"""Question Registry synthesis (build-time).

Produces the taxpayer-facing question set the Streamlit app's "Answer
Questions" page renders in its sidebar. Two sources are merged into one
`intake_questions` table, mirroring `build/export/form_mapping.py`'s
`is_input_field` distinction:

1. **Auto-derived form-line questions** — one per canonical field on `form`
   that has no calc rule (a pure input line, e.g. "how much did you
   contribute to your HSA"), *except* fields that are either the target of a
   hand-authored structured condition (`runtime.condition_rules.
   CONDITION_FIELDS`, e.g. Form 8889 Line 3's contribution limit) or already
   shadowed by a profile question (`runtime.condition_rules.
   DERIVED_FROM_PROFILE`, e.g. Form 8889 Line 1's coverage-type checkbox) —
   those get their value from a condition function / a profile answer
   instead of a duplicate question. The justification for each auto-derived
   question is built by walking `dependency_edges` forward to the terminal
   field it ultimately feeds (e.g. "Feeds Form 8889, Line 13 -> Schedule 1,
   Line 13 -> Form 1040, Line 10.").
2. **Hand-authored profile questions** (`build/sources/profile_questions.yaml`)
   — taxpayer facts not captured as a single form line (e.g. age).

Re-running this for a form fully replaces that form's auto-derived
questions (so a field that later gains a calc rule stops being asked) and
upserts every profile question from the YAML (cheap, idempotent, and
profile questions aren't tied to a single `--form` invocation).
"""
from __future__ import annotations

import re
from pathlib import Path

import structlog
import yaml
from sqlalchemy import select

from db.models import CalcRule, CanonicalField, DependencyEdge, Document, IntakeQuestion, Section
from db.session import get_session
from runtime.chain import ancestor_closure, form_field_condition, form_field_names, form_for_field_name
from runtime.condition_rules import CONDITION_FIELDS, DERIVED_FROM_PROFILE

log = structlog.get_logger(__name__)

PROFILE_QUESTIONS_PATH = Path(__file__).resolve().parent.parent / "sources" / "profile_questions.yaml"
W2_QUESTIONS_PATH = Path(__file__).resolve().parent.parent / "sources" / "w2_questions.yaml"
COST_SEG_QUESTIONS_PATH = Path(__file__).resolve().parent.parent / "sources" / "cost_seg_questions.yaml"

_DATA_TYPE_TO_INPUT_TYPE = {
    "USAmountNNType": "currency",
    "CheckboxType": "boolean",
}
_DEFAULT_INPUT_TYPE = "currency"

_FORM_DISPLAY_NAMES = {
    "8889": "Form 8889",
    "1040s1": "Schedule 1 (Form 1040)",
    "1040s1a": "Schedule 1-A (Form 1040)",
    "1040": "Form 1040",
}

_MAX_CHAIN_HOPS = 6


def _form_token(field_name: str) -> str | None:
    m = re.match(r"^form_([a-z0-9]+)_line_", field_name)
    if m:
        return m.group(1)
    return form_for_field_name(field_name)


def _form_display(field_name: str) -> str:
    token = _form_token(field_name)
    return _FORM_DISPLAY_NAMES.get(token, f"Form {token}" if token else field_name)


def _short_label(description: str) -> str:
    for dash in ("\u2014", " - "):
        if dash in description:
            return description.split(dash, 1)[0].strip()
    return description[:60].strip()


def _input_type_for(data_type: str) -> str:
    mapped = _DATA_TYPE_TO_INPUT_TYPE.get(data_type)
    if mapped is None:
        log.warning("question_registry.unmapped_data_type", data_type=data_type, default=_DEFAULT_INPUT_TYPE)
        return _DEFAULT_INPUT_TYPE
    return mapped


def _line_sort_key(field_name: str) -> tuple:
    m = re.search(r"line_(\d+)", field_name)
    return (int(m.group(1)) if m else float("inf"), field_name)


def _walk_forward_chain(
    session, field_name: str, fields_by_name: dict[str, CanonicalField], in_scope: set[str]
) -> list[str]:
    """Follows dependency_edges forward (this field -> whatever depends on
    it) up to `_MAX_CHAIN_HOPS`, returning a list of human-readable hop
    labels for the justification text.

    Prefers hops that stay within `in_scope` (the pilot's ancestor closure —
    see runtime/chain.py) so the narrative follows the one path that
    actually reaches the modeled terminal field, rather than a dead-end
    branch a field also happens to feed (e.g. Form 8889 Line 10 feeds both
    Line 2, which is on the modeled path, and Line 19, which is not)."""
    chain: list[str] = []
    visited = {field_name}
    current = field_name
    for _ in range(_MAX_CHAIN_HOPS):
        edges = session.execute(
            select(DependencyEdge).where(
                DependencyEdge.depends_on_ref == current, DependencyEdge.depends_on_type == "field"
            )
        ).scalars().all()
        candidates = {e.field_a for e in edges if e.field_a not in visited}
        in_scope_candidates = sorted(candidates & in_scope, key=_line_sort_key)
        downstream = in_scope_candidates or sorted(candidates, key=_line_sort_key)
        if not downstream:
            break
        next_field, others = downstream[0], downstream[1:]
        cf = fields_by_name.get(next_field)
        label = f"{_form_display(next_field)}, Line {cf.source_form_line}" if cf else next_field
        if cf is not None:
            label += f" ({_short_label(cf.description)})"
        if others:
            label += f" [+{len(others)} other line{'s' if len(others) > 1 else ''}]"
        chain.append(label)
        visited.add(next_field)
        current = next_field
    return chain


def _irs_reference_for_field(session, field: CanonicalField, form: str) -> dict:
    doc = session.execute(
        select(Document).where(Document.form_number == form, Document.doc_type == "instructions")
    ).scalars().first()
    section = None
    if doc is not None and field.source_form_line:
        section = session.execute(
            select(Section).where(Section.document_id == doc.id, Section.irs_line_ref == field.source_form_line)
        ).scalars().first()
    return {
        "form": form,
        "line": field.source_form_line,
        "quote": section.text[:400] if section else None,
        "source": f"{_form_display(field.field_name)} instructions, Line {field.source_form_line}",
    }


def _prompt_for_field(field: CanonicalField, input_type: str) -> str:
    label = _short_label(field.description)
    where = f"{_form_display(field.field_name)}, Line {field.source_form_line}"
    if input_type == "boolean":
        return f"Does this apply to you: {label}? ({where})"
    if input_type == "currency":
        return f"Enter the dollar amount for {where} ({label})."
    return f"Enter the value for {where} ({label})."


def _is_cost_seg_computed_field(field_name: str) -> bool:
    if not field_name.startswith("cost_seg."):
        return False
    if field_name.startswith("taxpayer.depreciation_summary."):
        return True
    return ".depreciation." in field_name or ".form_4562." in field_name or ".schedule_e." in field_name or ".limitations." in field_name


def _build_auto_questions(session, form: str, tax_year: int) -> list[dict]:
    fields = session.execute(
        select(CanonicalField).where(
            form_field_condition(CanonicalField.field_name, form), CanonicalField.tax_year == tax_year
        )
    ).scalars().all()
    # Global (all forms), not just this form's — the forward chain frequently
    # crosses form boundaries (e.g. Form 8889 Line 13 -> Schedule 1 Line 13).
    fields_by_name = {
        f.field_name: f
        for f in session.execute(select(CanonicalField).where(CanonicalField.tax_year == tax_year)).scalars().all()
    }
    rule_field_ids = {
        r.canonical_field_id
        for r in session.execute(
            select(CalcRule).where(
                form_field_condition(CalcRule.rule_id, form), CalcRule.tax_year == tax_year
            )
        ).scalars().all()
    }
    # Scope to the pilot's actively-modeled HSA chain — see runtime/chain.py's
    # module docstring for why the other ~85% of Form 1040/Schedule 1 fields
    # (name, SSN, bank routing numbers, unrelated schedule lines, ...) are
    # intentionally never turned into questions.
    in_scope = ancestor_closure(session)

    def _sort_key(f: CanonicalField) -> tuple:
        m = re.match(r"^(\d+)", f.source_form_line or "")
        return (int(m.group(1)) if m else float("inf"), f.source_form_line or "")

    questions = []
    for idx, field in enumerate(sorted(fields, key=_sort_key)):
        if field.field_name not in in_scope:
            continue
        if _is_cost_seg_computed_field(field.field_name):
            continue
        if field.id in rule_field_ids:
            continue  # has a calc rule — not a raw taxpayer input
        if field.field_name in CONDITION_FIELDS:
            continue  # computed by a hand-authored structured condition instead
        if field.field_name in DERIVED_FROM_PROFILE:
            continue  # shadowed by a profile question — see profile_questions.yaml

        chain = _walk_forward_chain(session, field.field_name, fields_by_name, in_scope)
        justification = (
            f"Feeds {' -> '.join(chain)}." if chain
            else "Does not yet feed another line via a recorded calc-rule dependency."
        )
        input_type = _input_type_for(field.data_type)
        questions.append({
            "question_key": field.field_name,
            "form_number": form,
            "prompt_text": _prompt_for_field(field, input_type),
            "input_type": input_type,
            "choices": None,
            "maps_to_canonical_field": field.field_name,
            "maps_to_condition": None,
            "justification": justification,
            "irs_reference": _irs_reference_for_field(session, field, form),
            "order_index": 100 + idx,
            "required": True,
            "tax_year": tax_year,
        })
    return questions


def _load_profile_questions(tax_year: int) -> list[dict]:
    raw = yaml.safe_load(PROFILE_QUESTIONS_PATH.read_text())
    questions = []
    for q in raw.get("questions", []):
        questions.append({
            "question_key": q["question_key"],
            "form_number": q["form_number"],
            "prompt_text": q["prompt_text"],
            "input_type": q["input_type"],
            "choices": q.get("choices"),
            "maps_to_canonical_field": q.get("shadows_canonical_field"),
            "maps_to_condition": {"condition_field": q["feeds_condition"]} if q.get("feeds_condition") else None,
            "justification": q["justification"].strip(),
            "irs_reference": q.get("irs_reference") or {},
            "order_index": q.get("order_index", 0),
            "required": q.get("required", True),
            "tax_year": tax_year,
        })
    return questions


def _load_cost_seg_questions(tax_year: int) -> list[dict]:
    """Cost segregation intake + REPS profile questions (see cost_seg_questions.yaml)."""
    if not COST_SEG_QUESTIONS_PATH.exists():
        return []
    raw = yaml.safe_load(COST_SEG_QUESTIONS_PATH.read_text())
    questions = []
    for q in raw.get("questions", []):
        questions.append({
            "question_key": q["question_key"],
            "form_number": q["form_number"],
            "prompt_text": q["prompt_text"],
            "input_type": q["input_type"],
            "choices": q.get("choices"),
            "maps_to_canonical_field": q.get("shadows_canonical_field"),
            "maps_to_condition": {"condition_field": q["feeds_condition"]} if q.get("feeds_condition") else None,
            "justification": q["justification"].strip(),
            "irs_reference": q.get("irs_reference") or {},
            "order_index": q.get("order_index", 0),
            "required": q.get("required", False),
            "tax_year": tax_year,
        })
    return questions


def _load_w2_questions(tax_year: int) -> list[dict]:
    """Same YAML shape/loading logic as `_load_profile_questions` -- see
    build/sources/w2_questions.yaml's module comment for why this is a
    separate file/loader rather than folded into profile_questions.yaml
    (its one question is multi-instance, not a plain scalar)."""
    if not W2_QUESTIONS_PATH.exists():
        return []
    raw = yaml.safe_load(W2_QUESTIONS_PATH.read_text())
    questions = []
    for q in raw.get("questions", []):
        questions.append({
            "question_key": q["question_key"],
            "form_number": q["form_number"],
            "prompt_text": q["prompt_text"],
            "input_type": q["input_type"],
            "choices": q.get("choices"),
            "maps_to_canonical_field": q.get("shadows_canonical_field"),
            "maps_to_condition": {"condition_field": q["feeds_condition"]} if q.get("feeds_condition") else None,
            "justification": q["justification"].strip(),
            "irs_reference": q.get("irs_reference") or {},
            "order_index": q.get("order_index", 0),
            "required": q.get("required", True),
            "tax_year": tax_year,
        })
    return questions


def _upsert(session, existing_by_key: dict[str, IntakeQuestion], payload: dict) -> bool:
    existing = existing_by_key.get(payload["question_key"])
    if existing is None:
        session.add(IntakeQuestion(**payload))
        return True
    for key, value in payload.items():
        if key == "question_key":
            continue
        setattr(existing, key, value)
    return False


def run_question_registry_synthesis(form: str, tax_year: int = 2025) -> None:
    with get_session() as session:
        existing_by_key = {
            q.question_key: q
            for q in session.execute(
                select(IntakeQuestion).where(IntakeQuestion.tax_year == tax_year)
            ).scalars().all()
        }

        auto_questions = _build_auto_questions(session, form, tax_year)
        auto_keys = {q["question_key"] for q in auto_questions}
        renamed_names = form_field_names(form)
        stale = [
            q for key, q in existing_by_key.items()
            if (key in renamed_names if renamed_names is not None else key.startswith(f"form_{form}_line_"))
            and key not in auto_keys
        ]
        for q in stale:
            session.delete(q)
            existing_by_key.pop(q.question_key, None)

        profile_questions = _load_profile_questions(tax_year)
        w2_questions = _load_w2_questions(tax_year)
        cost_seg_questions = _load_cost_seg_questions(tax_year)

        created = 0
        updated = 0
        for payload in auto_questions + profile_questions + w2_questions + cost_seg_questions:
            if _upsert(session, existing_by_key, payload):
                created += 1
            else:
                updated += 1

        session.commit()

    log.info(
        "question_registry.synthesis_complete",
        form=form,
        auto_questions=len(auto_questions),
        profile_questions=len(profile_questions),
        w2_questions=len(w2_questions),
        cost_seg_questions=len(cost_seg_questions),
        created=created,
        updated=updated,
        stale_removed=len(stale),
    )
    print(
        f"question registry complete (form={form}): {len(auto_questions)} auto + "
        f"{len(profile_questions)} profile + {len(w2_questions)} w2 + "
        f"{len(cost_seg_questions)} cost-seg questions "
        f"({created} created, {updated} updated, {len(stale)} stale removed)"
    )
