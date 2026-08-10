"""Shared read/write helpers for the Streamlit app.

Every page (`ui/pages/*.py`) goes through this module rather than querying
the DB or invoking the build pipeline directly, so the query/subprocess
logic exists in exactly one place. This module is the UI's own data-access
layer, sitting *on top of* `db/`, `build/`, and `runtime/` — it is not part
of the build/runtime separation itself (ADR 0005 only constrains `runtime/`
importing `build/`; a UI orchestrating both is expected and fine).
"""
from __future__ import annotations

import re
import subprocess
import sys
from pathlib import Path
from typing import Any

import streamlit as st
from sqlalchemy import select

from build.evaluation.grounding_check import resolve_calc_rule_review
from build.graph.build_graph import resolve_review
from build.graph.llm_client import ReviewResult, persist_review_finding, review_return
from build.synthesis.pdf_field_mapper import resolve_pdf_field_mapping_review
from db.models import (
    CalcRule,
    CanonicalField,
    Document,
    EvaluationRun,
    HumanReviewItem,
    IntakeQuestion,
    PdfFieldMapping,
    RuntimeReviewFinding,
)
from db.session import get_session
from runtime.chain import ancestor_closure, form_field_condition, form_field_names
from runtime.engine import ComputedValue, compute

REPO_ROOT = Path(__file__).resolve().parent.parent

PILOT_FORMS = ["8889", "1040s1", "1040s1a", "1040sc", "1040sse", "1040s2", "1040"]

FORM_DISPLAY_NAMES = {
    "8889": "Form 8889",
    "1040s1": "Schedule 1 (Form 1040)",
    "1040s1a": "Schedule 1-A (Form 1040)",
    "1040sc": "Schedule C (Form 1040)",
    "1040sse": "Schedule SE (Form 1040)",
    "1040s2": "Schedule 2 (Form 1040)",
    "1040": "Form 1040",
}

# (cli_command, label, needs_form_arg). Order matches the pipeline's actual
# phase sequence (build/cli.py's module docstring / run-pilot). Deliberately
# NOT hardcoded to only work for 8889/1040/1040s1 -- run_phase() takes any
# form string, so onboarding a new form later is an additive catalog +
# button, not a rewrite (see the plan's "extensible later" decision).
PHASES: list[tuple[str, str, bool]] = [
    ("discover", "1. Discover", True),
    ("parse", "2. Parse", True),
    ("detect-patterns", "3. Detect Patterns", True),
    ("extract", "4-5. Extract (LangGraph)", True),
    ("consolidate", "6. Consolidate", True),
    ("bridge-forms", "6x. Cross-Form Bridge (global)", False),
    ("w2-bridge", "6x. W-2 Intake Bridge (global)", False),
    ("w2-pdf-bridge", "6x. W-2 PDF Field Bridge (global)", False),
    ("schedule-c-bridge", "6x. Schedule C Bridge (global)", False),
    ("schedule-se-bridge", "6x. Schedule SE Bridge (global)", False),
    ("schedule1-income-bridge", "6x. Schedule 1 Income Bridge (global)", False),
    ("schedule-2-bridge", "6x. Schedule 2 Bridge (global)", False),
    ("form1040-refund-bridge", "6x. Form 1040 Refund Bridge (global)", False),
    ("synthesize", "7. Synthesize", True),
    ("evaluate", "8. Evaluate (grounding)", True),
    ("export", "Export JSON", True),
    ("form-mapping", "Form Mapping", True),
    ("generate-questions", "Generate Questions", True),
    ("map-pdf-fields", "PDF Field Mapping", True),
]

# Form W-2 has its own catalog/documents/canonical-fields/PDF mappings (see
# build/sources/catalog/form_w2.yaml) but is deliberately NOT in PILOT_FORMS
# -- it never gets its own "Answer Questions" line-by-line tab or the
# generic single-instance render_filled_pdf view the way the other 4 forms
# do (it's this pilot's one genuinely multi-instance form, rendered by its
# own bespoke section -- see ui/pages/2_Answer_Questions.py's "Your W-2(s)"
# section / ui/pdf_render.py's render_filled_w2_pdf). Listed separately so
# Build Control can still show its discover/bridge/PDF-mapping status.
ADDITIONAL_STATUS_FORMS = ["w2"]


def form_display(form: str) -> str:
    return FORM_DISPLAY_NAMES.get(form, f"Form {form}")


# ---------------------------------------------------------------------------
# Tax year selection (Phase 10 -- see docs/adr/0009-tax-year-scoping.md)
# ---------------------------------------------------------------------------

# The only years with a seeded tax_constants row + built-out canonical
# fields/calc rules today. Adding 2026 later is exactly "add its name here
# once its own data has been built" -- see docs/adr/0009's rollout process,
# not a code change to this selector itself.
AVAILABLE_TAX_YEARS = [2025]
DEFAULT_TAX_YEAR = AVAILABLE_TAX_YEARS[-1]


def render_tax_year_selector() -> int:
    """Renders a one-time-per-session "which tax year?" selector in the
    sidebar (mirrors TaxMD-TaxCore's `TaxReturn.tax_year` -- chosen once per
    return, not re-asked per field) and returns the currently-selected year.

    Call this at the top of every page (it's idempotent/cheap -- a single
    `st.sidebar.selectbox`) so the selector is always visible regardless of
    which page the taxpayer's ephemeral session starts on; the choice lives
    in `st.session_state["tax_year"]`, which Streamlit already preserves
    across page navigation within one browser session, consistent with this
    project's "ephemeral, session-only" taxpayer data design (no
    server-side persistence needed for the selection itself)."""
    if "tax_year" not in st.session_state:
        st.session_state["tax_year"] = DEFAULT_TAX_YEAR
    st.sidebar.selectbox(
        "Tax Year",
        options=AVAILABLE_TAX_YEARS,
        key="tax_year",
        help=(
            "Which tax year's constants, calc rules, and forms to use. Chosen once per "
            "session, like TaxMD-TaxCore's TaxReturn.tax_year -- the calculation *strategy* "
            "stays the same across years, only the constants/rules/mappings loaded for the "
            "selected year change."
        ),
    )
    return st.session_state["tax_year"]


def get_selected_tax_year() -> int:
    """Reads the already-rendered selection without re-rendering the
    widget -- for helper code (e.g. build_review_field_summaries) that
    needs the year but isn't itself a page's top-level script."""
    return st.session_state.get("tax_year", DEFAULT_TAX_YEAR)


# ---------------------------------------------------------------------------
# Build Control
# ---------------------------------------------------------------------------


# Phases that pre-date the tax_year architecture and operate purely on
# `documents`/`sections`/`knowledge_packets` (no tax_year-scoped table
# involved yet) -- these build.cli commands take no --tax-year option.
_PHASES_WITHOUT_TAX_YEAR_OPTION = {"discover", "parse", "detect-patterns", "extract", "consolidate"}


def run_phase(phase: str, form: str | None, tax_year: int = 2025) -> subprocess.CompletedProcess:
    """Shells out to `python -m build.cli <phase> [--form <form>] [--tax-year
    <year>]` using the SAME interpreter running Streamlit (so it's the same
    venv/dependencies), and returns the completed process (stdout/stderr/
    returncode) for display. A subprocess — not an in-process call — so a
    crash in one phase can never take down the Streamlit server itself, and
    so the UI is running the exact same command a developer would type, not
    a lookalike."""
    args = [sys.executable, "-m", "build.cli", phase]
    if form is not None:
        args += ["--form", form]
    if phase not in _PHASES_WITHOUT_TAX_YEAR_OPTION:
        args += ["--tax-year", str(tax_year)]
    return subprocess.run(args, capture_output=True, text=True, cwd=REPO_ROOT, timeout=1800)


def _belongs_to_form(field_or_rule_name: str, form: str) -> bool:
    """Python-side equivalent of `runtime.chain.form_field_condition`, for
    filtering an already-fetched list (e.g. HumanReviewItem.detail JSON)
    rather than a SQL query."""
    names = form_field_names(form)
    if names is not None:
        return field_or_rule_name in names
    return field_or_rule_name.startswith(f"form_{form}_line_")


def get_form_status(form: str, tax_year: int = 2025) -> dict[str, Any]:
    """Lightweight artifact counts per form, used as the Build Control
    dashboard's "status" (there's no explicit phase-run-log table — this
    reads the actual downstream tables, so it can never claim a phase ran
    when its output doesn't exist)."""
    with get_session() as session:
        doc_ids = list(session.execute(select(Document.id).where(Document.form_number == form)).scalars().all())
        n_documents = len(doc_ids)

        fields = session.execute(
            select(CanonicalField).where(
                form_field_condition(CanonicalField.field_name, form), CanonicalField.tax_year == tax_year
            )
        ).scalars().all()
        n_fields = len(fields)

        rules = session.execute(
            select(CalcRule).where(
                form_field_condition(CalcRule.rule_id, form), CalcRule.tax_year == tax_year
            )
        ).scalars().all()
        rule_status_counts: dict[str, int] = {}
        for r in rules:
            rule_status_counts[r.status] = rule_status_counts.get(r.status, 0) + 1

        eval_result_counts: dict[str, int] = {}
        if rules:
            rule_ids = [r.id for r in rules]
            runs = session.execute(
                select(EvaluationRun).where(EvaluationRun.target_type == "calc_rule", EvaluationRun.target_id.in_(rule_ids))
            ).scalars().all()
            for run in runs:
                eval_result_counts[run.result] = eval_result_counts.get(run.result, 0) + 1

        n_questions = session.execute(
            select(IntakeQuestion).where(IntakeQuestion.form_number == form, IntakeQuestion.tax_year == tax_year)
        ).scalars().all()

        n_pending_calc_review = len([
            i for i in session.execute(
                select(HumanReviewItem).where(HumanReviewItem.related_type == "calc_rule", HumanReviewItem.status == "pending")
            ).scalars().all()
            if _belongs_to_form((i.detail or {}).get("rule_id", ""), form)
        ])

        n_pdf_mappings = len(
            session.execute(
                select(PdfFieldMapping).where(
                    PdfFieldMapping.form_number == form, PdfFieldMapping.tax_year == tax_year
                )
            ).scalars().all()
        )
        n_pending_pdf_review = len([
            i for i in session.execute(
                select(HumanReviewItem).where(HumanReviewItem.related_type == "pdf_field_mapping", HumanReviewItem.status == "pending")
            ).scalars().all()
            if _belongs_to_form((i.detail or {}).get("field_name", ""), form)
        ])

    out_dir_exists = (REPO_ROOT / "output" / f"ty{tax_year}" / form).exists()

    return {
        "documents": n_documents,
        "canonical_fields": n_fields,
        "calc_rules": len(rules),
        "calc_rule_status_counts": rule_status_counts,
        "evaluation_result_counts": eval_result_counts,
        "questions": len(n_questions),
        "pending_calc_rule_reviews": n_pending_calc_review,
        "pdf_field_mappings": n_pdf_mappings,
        "pending_pdf_mapping_reviews": n_pending_pdf_review,
        "exported": out_dir_exists,
    }


# ---------------------------------------------------------------------------
# Answer Questions + Form View
# ---------------------------------------------------------------------------


def get_chain_questions(tax_year: int = 2025) -> list[IntakeQuestion]:
    """Every intake question relevant to the modeled HSA chain, profile
    questions first (order_index 0-9), then form-line questions grouped by
    form in the order they appear on the actual form."""
    with get_session() as session:
        questions = session.execute(
            select(IntakeQuestion).where(IntakeQuestion.tax_year == tax_year)
        ).scalars().all()
    return sorted(questions, key=lambda q: (0 if q.question_key.startswith("profile_") else 1, q.order_index))


def get_chain_canonical_fields(tax_year: int = 2025) -> dict[str, CanonicalField]:
    with get_session() as session:
        closure = ancestor_closure(session)
        fields = session.execute(
            select(CanonicalField).where(
                CanonicalField.field_name.in_(closure), CanonicalField.tax_year == tax_year
            )
        ).scalars().all()
        return {f.field_name: f for f in fields}


def get_all_canonical_fields_for_form(form: str, tax_year: int = 2025) -> list[CanonicalField]:
    with get_session() as session:
        return list(
            session.execute(
                select(CanonicalField).where(
                    form_field_condition(CanonicalField.field_name, form), CanonicalField.tax_year == tax_year
                )
            ).scalars().all()
        )


def get_form_pdf_path(form: str) -> str | None:
    """Storage path of this form's catalogued fillable PDF (doc_type='form'),
    or None if it hasn't been discovered yet — see build/sources/catalog/
    form_{form}.yaml's include_doc_types.

    Filters to `superseded_by.is_(None)` and takes the highest `version` so a
    later re-fetch (a genuine new revision, OR a hand-corrected wrong-year
    fetch superseded by the right one -- see the Form W-2 archived-2025-PDF
    correction in build/sources/catalog/form_w2.yaml's module comment) always
    wins over a stale/incorrect row, rather than whichever row a
    superseded_by-blind `.first()` happened to return."""
    with get_session() as session:
        doc = session.execute(
            select(Document)
            .where(Document.form_number == form, Document.doc_type == "form", Document.superseded_by.is_(None))
            .order_by(Document.version.desc())
        ).scalars().first()
        return doc.storage_path if doc else None


def get_pdf_field_mappings(form: str, tax_year: int = 2025) -> dict[str, list[PdfFieldMapping]]:
    """canonical_field_name -> list of PdfFieldMapping, for the realistic PDF
    form view (ui/pdf_render.py). Usually a 1-item list (one widget per
    field); a checkbox-choice group (e.g. Form 8889 Line 1's self-only/family
    boxes, Form 1040's 5 filing-status boxes -- see build/consolidation/
    checkbox_field_bridge.py) has one entry per widget in the group, each
    carrying the `checkbox_match_value` that should check THAT widget."""
    with get_session() as session:
        mappings = session.execute(
            select(PdfFieldMapping).where(
                PdfFieldMapping.form_number == form, PdfFieldMapping.tax_year == tax_year
            )
        ).scalars().all()
        field_names = {
            f.id: f.field_name
            for f in session.execute(
                select(CanonicalField).where(
                    CanonicalField.id.in_([m.canonical_field_id for m in mappings])
                )
            ).scalars().all()
        }
        by_field_name: dict[str, list[PdfFieldMapping]] = {}
        for m in mappings:
            name = field_names.get(m.canonical_field_id)
            if name is None:
                continue
            by_field_name.setdefault(name, []).append(m)
        return by_field_name


def compute_return(
    answers: dict[str, Any], profile_answers: dict[str, Any], tax_year: int = 2025
) -> dict[str, ComputedValue]:
    """Thin pass-through to runtime.engine.compute — kept here so pages never
    import `runtime.engine` directly and so this is the one place that could
    add caching later."""
    return compute(answers, profile_answers, tax_year)


def build_review_field_summaries(computed: dict[str, ComputedValue], fields_by_name: dict[str, CanonicalField]) -> list[dict]:
    """Builds the narrow context passed to llm_client.review_return() —
    only the modeled HSA chain fields, each with its IRS quote and current
    Phase 8 grounding result (already carried on ComputedValue.grounding by
    runtime/engine.py, so no extra query is needed here)."""
    summaries = []
    for name, cv in computed.items():
        field_meta = fields_by_name.get(name)
        irs_quote = None
        if cv.irs_reference:
            irs_quote = cv.irs_reference.get("quote")
        m = re.match(r"^form_([a-z0-9]+)_line_(.+)$", name)
        form_token, line = (m.group(1), m.group(2)) if m else (None, None)
        summaries.append({
            "field_name": name,
            "form": form_display(form_token) if form_token else None,
            "line": line,
            "description": field_meta.description if field_meta else cv.explanation,
            "value": cv.value,
            "status": cv.status,
            "rule_status": cv.rule_status,
            "irs_quote": irs_quote,
            "grounding_result": (cv.grounding or {}).get("result") if cv.grounding else None,
            "grounding_issues": (cv.grounding or {}).get("detail", {}).get("issues", []) if cv.grounding else [],
        })
    return summaries


def run_return_review(computed: dict[str, ComputedValue], fields_by_name: dict[str, CanonicalField]) -> ReviewResult:
    """Calls the on-demand "CPA review" LLM (advisory only — see
    docs/adr/0007) and logs the outcome to runtime_review_findings. Never
    touches `computed` itself."""
    summaries = build_review_field_summaries(computed, fields_by_name)
    result = review_return(summaries)
    snapshot = {name: {"value": cv.value, "status": cv.status} for name, cv in computed.items()}
    persist_review_finding(form_chain=",".join(PILOT_FORMS), computed_snapshot=snapshot, result=result)
    return result


def get_recent_review_findings(limit: int = 5) -> list[RuntimeReviewFinding]:
    with get_session() as session:
        rows = session.execute(
            select(RuntimeReviewFinding).order_by(RuntimeReviewFinding.triggered_at.desc()).limit(limit)
        ).scalars().all()
        return list(rows)


# ---------------------------------------------------------------------------
# Human Review Queue
# ---------------------------------------------------------------------------


def get_pending_review_items(related_type: str | None = None) -> list[HumanReviewItem]:
    with get_session() as session:
        items = session.execute(
            select(HumanReviewItem).where(HumanReviewItem.status == "pending").order_by(HumanReviewItem.created_at)
        ).scalars().all()
        if related_type:
            items = [i for i in items if i.related_type == related_type]
        return list(items)


def get_resolved_review_items(limit: int = 20) -> list[HumanReviewItem]:
    with get_session() as session:
        return list(
            session.execute(
                select(HumanReviewItem)
                .where(HumanReviewItem.status == "resolved")
                .order_by(HumanReviewItem.resolved_at.desc())
                .limit(limit)
            ).scalars().all()
        )


def resolve_extraction_item(thread_id: str, action: str, reviewer: str, **kwargs) -> None:
    resolution = {"action": action, "reviewer": reviewer, **kwargs}
    resolve_review(thread_id, resolution)


def resolve_calc_rule_item(item_id: str, action: str, reviewer: str, correction: dict | None = None) -> None:
    resolve_calc_rule_review(item_id, action, reviewer, correction=correction)


def resolve_pdf_field_mapping_item(item_id: str, action: str, reviewer: str, pdf_field_code: str | None = None) -> None:
    resolve_pdf_field_mapping_review(item_id, action, reviewer, pdf_field_code=pdf_field_code)
