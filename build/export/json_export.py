"""Build-time JSON export.

The Postgres database is the single source of truth (every other phase reads
and writes it), but reviewers coming from TaxMD-TaxCore / TaxMD-Schema-
Automation-New expect to be able to just open a JSON file per canonical
field / calc rule under `output/`, the same way those repos do
(`output/ty2025/canonical_schema.json`, `output/ty2025/form_mappings/...`).
This module is a pure read-side projection — it never writes back to the
database, and re-running it is always safe (it just overwrites the JSON
files with the DB's current state).
"""
from __future__ import annotations

import json
import re
from datetime import datetime
from pathlib import Path

from sqlalchemy import select

from db.models import CalcRule, CanonicalField, Document, IntakeQuestion
from db.session import get_session
from runtime.chain import form_field_condition

OUTPUT_ROOT = Path(__file__).resolve().parent.parent.parent / "output"

# w2_bridge.py hand-creates its canonical fields under an `intake_w2_*`
# prefix rather than `form_w2_line_*` -- deliberately: there is no single
# IRS-side canonical field for "one taxpayer's list of W-2s" (see that
# module's docstring), so nothing to key a `line_N` name off of. Without this
# override, run_export/run_form_mapping_export's default
# `form_{form}_line_%` LIKE pattern matches zero rows for form="w2" and
# silently produces an empty (but present) output file -- confirmed to have
# been the actual state of output/ty2025/w2/canonical_fields.json before
# this override existed. Forms whose fields were renamed to TaxCore's
# dot-notation (e.g. "8889" -- see docs/adr/0010) have no shared prefix at
# all, so those go through runtime.chain's exact-name-list override instead
# (checked first by `_field_condition` below); this dict stays for forms
# that still share a prefix, just not the default `form_{form}_line_` one.
_FIELD_NAME_PATTERN_OVERRIDES: dict[str, str] = {"w2": "intake_w2_%"}


def _field_pattern(form: str) -> str:
    return _FIELD_NAME_PATTERN_OVERRIDES.get(form, f"form_{form}_line_%")


def _field_condition(column, form: str):
    """The full filter condition for `form`'s canonical-field/calc-rule name
    column -- prefers runtime.chain's exact-name-list override (renamed
    forms), then cost seg patterns, then this module's own prefix override (e.g. w2),
    then the default `form_{form}_line_%` prefix."""
    from runtime.chain import form_field_condition

    return form_field_condition(column, form)


def _json_default(obj):
    if isinstance(obj, datetime):
        return obj.isoformat()
    raise TypeError(f"not JSON serializable: {obj!r}")


def _field_to_dict(field: CanonicalField) -> dict:
    return {
        "id": field.id,
        "field_name": field.field_name,
        "section": field.section,
        "data_type": field.data_type,
        "cardinality": field.cardinality,
        "instance_dimension": field.instance_dimension,
        "source_xsd_element": field.source_xsd_element,
        "source_form_line": field.source_form_line,
        "description": field.description,
        "version": field.version,
    }


def _rule_to_dict(rule: CalcRule, doc_by_id: dict[str, Document]) -> dict:
    irs_reference = dict(rule.irs_reference or {})
    doc = doc_by_id.get(irs_reference.get("document_id"))
    if doc is not None:
        irs_reference["source_url"] = doc.source_url
        irs_reference["document_version"] = doc.version

    return {
        "id": rule.id,
        "rule_id": rule.rule_id,
        "version": rule.version,
        "status": rule.status,
        "canonical_field_id": rule.canonical_field_id,
        "formula": rule.formula,
        "operands": rule.operands,
        "carryover_target": rule.carryover_target,
        "irs_reference": irs_reference,
        "confidence_breakdown": rule.confidence_breakdown,
        "created_at": rule.created_at,
    }


def run_export(form: str, tax_year: int = 2025) -> None:
    out_dir = OUTPUT_ROOT / f"ty{tax_year}" / form
    fields_dir = out_dir / "canonical_fields"
    rules_dir = out_dir / "calc_rules"
    fields_dir.mkdir(parents=True, exist_ok=True)
    rules_dir.mkdir(parents=True, exist_ok=True)

    # Idempotent regeneration: a field that's been reclassified (e.g. a line
    # the calc rule agent now correctly treats as a pure input, per ADR 0008)
    # no longer has a row to overwrite its old per-rule file, so a stale file
    # from a previous export would otherwise sit around forever showing an
    # already-fixed, wrong rule. Clear both directories before writing.
    for stale in fields_dir.glob("*.json"):
        stale.unlink()
    for stale in rules_dir.glob("*.json"):
        stale.unlink()

    with get_session() as session:
        fields = session.execute(
            select(CanonicalField).where(
                _field_condition(CanonicalField.field_name, form), CanonicalField.tax_year == tax_year
            )
        ).scalars().all()
        rules = session.execute(
            select(CalcRule).where(
                _field_condition(CalcRule.rule_id, form), CalcRule.tax_year == tax_year
            )
        ).scalars().all()

        doc_ids = {r.irs_reference.get("document_id") for r in rules if r.irs_reference.get("document_id")}
        docs = session.execute(select(Document).where(Document.id.in_(doc_ids))).scalars().all() if doc_ids else []
        doc_by_id = {d.id: d for d in docs}

        field_dicts = [_field_to_dict(f) for f in sorted(fields, key=lambda f: _sort_key(f.source_form_line))]
        rule_dicts = [_rule_to_dict(r, doc_by_id) for r in sorted(rules, key=lambda r: r.rule_id)]

    for f in field_dicts:
        (fields_dir / f"{f['field_name']}.json").write_text(json.dumps(f, indent=2, default=_json_default) + "\n")
    for r in rule_dicts:
        (rules_dir / f"{r['rule_id']}.json").write_text(json.dumps(r, indent=2, default=_json_default) + "\n")

    (out_dir / "canonical_fields.json").write_text(
        json.dumps({"form": form, "tax_year": tax_year, "fields": field_dicts}, indent=2, default=_json_default) + "\n"
    )
    (out_dir / "calc_rules.json").write_text(
        json.dumps({"form": form, "tax_year": tax_year, "rules": rule_dicts}, indent=2, default=_json_default) + "\n"
    )

    print(
        f"export complete (form={form}): {len(field_dicts)} canonical fields, "
        f"{len(rule_dicts)} calc rules -> {out_dir}"
    )


def _question_to_dict(q: IntakeQuestion) -> dict:
    return {
        "id": q.id,
        "form_number": q.form_number,
        "question_key": q.question_key,
        "prompt_text": q.prompt_text,
        "input_type": q.input_type,
        "choices": q.choices,
        "maps_to_canonical_field": q.maps_to_canonical_field,
        "maps_to_condition": q.maps_to_condition,
        "justification": q.justification,
        "irs_reference": q.irs_reference,
        "order_index": q.order_index,
        "required": q.required,
    }


def run_question_export(form: str, tax_year: int = 2025) -> None:
    """Writes output/ty{year}/{form}/questions.json — the Question Registry's
    form-line + matching profile questions, built by
    build/synthesis/question_registry.py."""
    out_dir = OUTPUT_ROOT / f"ty{tax_year}" / form
    out_dir.mkdir(parents=True, exist_ok=True)

    with get_session() as session:
        questions = session.execute(
            select(IntakeQuestion).where(
                IntakeQuestion.form_number == form, IntakeQuestion.tax_year == tax_year
            )
        ).scalars().all()
        question_dicts = [_question_to_dict(q) for q in sorted(questions, key=lambda q: q.order_index)]

    (out_dir / "questions.json").write_text(
        json.dumps({"form": form, "tax_year": tax_year, "questions": question_dicts}, indent=2, default=_json_default)
        + "\n"
    )
    print(f"question export complete (form={form}): {len(question_dicts)} questions -> {out_dir / 'questions.json'}")


def _sort_key(line_ref: str | None) -> tuple:
    if not line_ref:
        return (float("inf"), "")
    m = re.match(r"^(\d+)", line_ref)
    return (int(m.group(1)) if m else float("inf"), line_ref)
