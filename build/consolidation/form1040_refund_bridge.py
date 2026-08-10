"""Hand-authored bridge for Form 1040's Payments/Refund/Amount-You-Owe
section (Lines 25-38) -- same rationale as tax_computation_bridge.py /
form1040_income_bridge.py: this is the form's own printed worksheet
arithmetic, not repeated in i1040gi's line-by-line instruction prose, so
the general LLM calc-rule agent has no KnowledgePacket to work from for
any of these lines. See docs/adr/0009 and the "Year-agnostic tax_year
architecture + Self-employment/W-2/Refund build-out" plan's Phase 9.

Verbatim quotes below were extracted directly from our stored copy of
f1040.pdf via PyMuPDF (same technique as tax_computation_bridge.py):

    25a Form(s) W-2                              [already wired: w2_bridge.py]
    25d Add lines 25a through 25c
    32  Add lines 27a, 28, 29, 30, and 31. These are your total other
        payments and refundable credits.
    33  Add lines 25d, 26, and 32. These are your total payments
    34  If line 33 is more than line 24, subtract line 24 from line 33.
        This is the amount you overpaid
    35a Amount of line 34 you want refunded to you. ...
    37  Subtract line 33 from line 24. This is the amount you owe.

Scope simplifications (explicit, not silent -- same convention as every
other bridge in this package):
  * Lines 25b/25c (1099/other-forms withholding), 26 (estimated tax
    payments) stay pure-input questions (this pilot's W-2-only intake has
    no other withholding source modeled yet, but a taxpayer could
    genuinely have these).
  * Lines 27a (EIC), 28 (ACTC), 29 (American Opportunity Credit), 30
    (Refundable Adoption Credit), 31 (Schedule 3 line 15) each require
    eligibility logic / a schedule this pilot does not model at all
    (dependents, education expenses, adoption, nonrefundable credits) --
    hand-authored as constant $0, same "no input this pilot collects
    could make it nonzero" reasoning as tax_computation_bridge.py's
    Lines 17/19/20.
  * Line 35a (refund amount requested) assumes the taxpayer takes their
    ENTIRE overpayment as a refund (`carryover(line_34)`) rather than
    applying any of it to next year's estimated tax -- line 36 ("Amount
    of line 34 you want applied to your 2026 estimated tax") is
    therefore hand-authored as constant $0. This is the default most
    taxpayers choose and is the only choice this pilot's Question
    Registry has any way to ask about; splitting the overpayment is a
    real, clearly-documented scope gap, not silently wrong math (line 34
    itself is still fully correct either way).
  * Line 38 (estimated tax penalty) requires Form 2210's own worksheet
    (safe-harbor / prior-year-tax tests) -- not modeled, constant $0.

Lines 34 and 37 are mutually exclusive on the real form (an "if more
than"/"if less than" pair) -- both use `subtract_floor_zero` so exactly
one of them is ever nonzero for a given taxpayer, matching the form's own
either/or branching without a dedicated conditional formula type.

Idempotent: re-running deletes and rewrites every rule/edge this module
owns first. Re-running `synthesize --form 1040` afterward will delete
these rules along with every other form_1040_line_% rule and NOT recreate
them -- re-run this bridge again if that happens.
"""
from __future__ import annotations

import structlog
from sqlalchemy import select

from db.models import CalcRule, CanonicalField, DependencyEdge, Document, HumanReviewItem, RuleStatusTransition
from db.session import get_session

log = structlog.get_logger(__name__)

_NOT_MODELED_NOTE = (
    "Scope simplification (see build/consolidation/form1040_refund_bridge.py's module docstring): "
    "this schedule/eligibility test is not modeled by this pilot, and no input this pilot collects "
    "could make it nonzero, so this line is hand-authored as a constant $0 rather than a pure-input "
    "question."
)

_LINE_32_OPERANDS = [
    "form_1040_line_27a", "form_1040_line_28", "form_1040_line_29", "form_1040_line_30", "form_1040_line_31",
]

# rule_id -> (formula, quote, formula_confidence, note_or_None)
_RULES: list[tuple[str, dict, str, float, str | None]] = [
    (
        "form_1040_line_25d",
        {"type": "sum", "operand_names": ["form_1040_line_25a", "form_1040_line_25b", "form_1040_line_25c"]},
        "Add lines 25a through 25c",
        0.95,
        None,
    ),
    (
        "form_1040_line_27a",
        {"type": "sum", "operand_names": [], "constant": 0},
        "Earned income credit (EIC)",
        0.95,
        _NOT_MODELED_NOTE + " (EIC eligibility not modeled.)",
    ),
    (
        "form_1040_line_28",
        {"type": "sum", "operand_names": [], "constant": 0},
        "Additional child tax credit (ACTC) from Schedule 8812.",
        0.95,
        _NOT_MODELED_NOTE + " (Schedule 8812 -- no dependents are modeled by this pilot.)",
    ),
    (
        "form_1040_line_29",
        {"type": "sum", "operand_names": [], "constant": 0},
        "American opportunity credit from Form 8863, line 8",
        0.95,
        _NOT_MODELED_NOTE + " (Form 8863 -- education expenses not modeled.)",
    ),
    (
        "form_1040_line_30",
        {"type": "sum", "operand_names": [], "constant": 0},
        "Refundable adoption credit from Form 8839, line 13",
        0.95,
        _NOT_MODELED_NOTE + " (Form 8839 -- adoption expenses not modeled.)",
    ),
    (
        "form_1040_line_31",
        {"type": "sum", "operand_names": [], "constant": 0},
        "Amount from Schedule 3, line 15",
        0.95,
        _NOT_MODELED_NOTE + " (Schedule 3 -- nonrefundable credits not modeled.)",
    ),
    (
        "form_1040_line_32",
        {"type": "sum", "operand_names": _LINE_32_OPERANDS},
        "Add lines 27a, 28, 29, 30, and 31. These are your total other payments and refundable credits.",
        0.95,
        None,
    ),
    (
        "form_1040_line_33",
        {"type": "sum", "operand_names": ["form_1040_line_25d", "form_1040_line_26", "form_1040_line_32"]},
        "Add lines 25d, 26, and 32. These are your total payments",
        0.95,
        None,
    ),
    (
        "form_1040_line_34",
        {"type": "subtract_floor_zero", "operand_names": ["form_1040_line_33", "form_1040_line_24"]},
        "If line 33 is more than line 24, subtract line 24 from line 33. This is the amount you overpaid",
        0.95,
        None,
    ),
    (
        "form_1040_line_35a",
        {"type": "carryover", "operand_names": ["form_1040_line_34"]},
        "Amount of line 34 you want refunded to you.",
        0.9,
        "Assumes the entire overpayment is refunded (line 36 -- applied to next year's estimated "
        "tax -- is hand-authored as constant $0) -- see module docstring.",
    ),
    (
        "form_1040_line_36",
        {"type": "sum", "operand_names": [], "constant": 0},
        "Amount of line 34 you want applied to your 2026 estimated tax.",
        0.9,
        _NOT_MODELED_NOTE + " (this pilot assumes the full overpayment is refunded -- see line 35a's note.)",
    ),
    (
        "form_1040_line_37",
        {"type": "subtract_floor_zero", "operand_names": ["form_1040_line_24", "form_1040_line_33"]},
        "Subtract line 33 from line 24. This is the amount you owe.",
        0.95,
        None,
    ),
    (
        "form_1040_line_38",
        {"type": "sum", "operand_names": [], "constant": 0},
        "Estimated tax penalty (see instructions)",
        0.95,
        _NOT_MODELED_NOTE + " (Form 2210 safe-harbor/prior-year-tax worksheet not modeled.)",
    ),
]


def run_form1040_refund_bridge(tax_year: int = 2025) -> None:
    with get_session() as session:
        pdf_doc = session.execute(
            select(Document).where(Document.form_number == "1040", Document.doc_type == "form")
        ).scalars().first()
        if pdf_doc is None:
            print("form1040 refund bridge: no catalogued f1040.pdf 'form' document -- run discover --form 1040 first")
            return

        fields_by_name = {
            f.field_name: f
            for f in session.execute(
                select(CanonicalField).where(
                    CanonicalField.field_name.like("form_1040_line_%"), CanonicalField.tax_year == tax_year
                )
            ).scalars().all()
        }

        rule_ids = [r[0] for r in _RULES]
        old_rules = session.execute(
            select(CalcRule).where(CalcRule.rule_id.in_(rule_ids), CalcRule.tax_year == tax_year)
        ).scalars().all()
        old_rule_ids = [r.id for r in old_rules]
        if old_rule_ids:
            for item in session.execute(
                select(HumanReviewItem).where(
                    HumanReviewItem.related_type == "calc_rule",
                    HumanReviewItem.related_id.in_(old_rule_ids),
                    HumanReviewItem.status == "pending",
                )
            ).scalars().all():
                session.delete(item)
            for transition in session.execute(
                select(RuleStatusTransition).where(RuleStatusTransition.rule_id.in_(old_rule_ids))
            ).scalars().all():
                session.delete(transition)
            session.flush()
            for r in old_rules:
                session.delete(r)
        for edge in session.execute(
            select(DependencyEdge).where(
                DependencyEdge.field_a.in_(rule_ids), DependencyEdge.depends_on_type == "field"
            )
        ).scalars().all():
            session.delete(edge)
        session.flush()

        created = 0
        skipped = 0
        for rule_id, formula, quote, formula_confidence, note in _RULES:
            field = fields_by_name.get(rule_id)
            operand_names = formula.get("operand_names", [])
            operand_fields = [fields_by_name.get(op) for op in operand_names]
            if field is None or any(op is None for op in operand_fields):
                log.warning(
                    "form1040_refund_bridge.missing_field",
                    rule_id=rule_id,
                    missing=[n for n, f in zip(operand_names, operand_fields) if f is None],
                )
                skipped += 1
                continue

            session.add(
                CalcRule(
                    rule_id=rule_id,
                    status="candidate",
                    canonical_field_id=field.id,
                    formula=formula,
                    operands=[
                        {"name": op.field_name, "source": f"canonical_field:{op.field_name}", "description": op.description}
                        for op in operand_fields
                    ],
                    carryover_target=None,
                    irs_reference={"document_id": pdf_doc.id, "section_anchor": None, "quote": quote},
                    confidence_breakdown={
                        "extraction_confidence": 1.0,
                        "reference_resolution_confidence": 1.0,
                        "formula_confidence": formula_confidence,
                        "note": note or "Hand-authored from the form's own printed worksheet text.",
                    },
                    tax_year=tax_year,
                )
            )
            for op in operand_names:
                session.add(DependencyEdge(field_a=rule_id, depends_on_type="field", depends_on_ref=op))
            created += 1

        session.commit()

    print(f"form1040 refund bridge complete: {created} calc rules created, {skipped} skipped (missing field)")
