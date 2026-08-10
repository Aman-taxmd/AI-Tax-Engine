"""Hand-authored bridge for Form 1040's Tax and Credits section (Lines
16-24) -- same rationale as form1040_income_bridge.py/hsa_worksheet_bridge.py:
this is the form's own printed worksheet arithmetic, not repeated in
i1040gi's line-by-line instruction prose, so the general LLM calc-rule agent
has no KnowledgePacket to work from for any of these lines.

Verbatim quotes below were extracted directly from our stored copy of
f1040.pdf via PyMuPDF (same technique as form1040_income_bridge.py):

    Page 2:
      16  Tax (see instructions). Check if any from Form(s): 1 8814 2 4972 3
      17  Amount from Schedule 2, line 3
      18  Add lines 16 and 17
      19  Child tax credit or credit for other dependents from Schedule 8812
      20  Amount from Schedule 3, line 8
      21  Add lines 19 and 20
      22  Subtract line 21 from line 18. If zero or less, enter -0-
      23  Other taxes, including self-employment tax, from Schedule 2, line 21
      24  Add lines 22 and 23. This is your total tax

Line 16 -- the one line here that ISN'T simple arithmetic over other Form
1040 lines -- is `formula.type = "federal_income_tax"`, a generic new
formula type (runtime/engine.py's `_evaluate_federal_income_tax`) that looks
up the actual dollar amount from the IRS Tax Table / Tax Computation
Worksheet data build/ingestion/tax_table_extractor.py extracted into
Postgres, keyed by (`form_1040_line_15`, `form_1040_filing_status`,
tax_year). Per the approved Line 16 design (see runtime/tax_lookup.py's
module docstring), every result from this pilot is `verification.tier =
"provisional"` -- never silently presented as fully verified -- because this
pilot doesn't model several real Line-16-affecting conditions (qualified
dividends, capital gains, foreign earned income, the kiddie tax, lump-sum
distributions). That tier then automatically propagates to lines 18/22/24
through runtime/engine.py's generic `_propagate_verification` (no special
casing needed per-line -- any calc_rule result that consumes a provisional
operand inherits the same tier).

Scope simplifications (explicit, not silent -- same convention as
form1040_income_bridge.py's Line 13a note): Lines 17, 19, and 20 each pull
from a real IRS schedule/form this pilot does not model at all (Schedule 2
Part I -- AMT/excess-APTC; Schedule 8812 -- child tax credit; Schedule 3 --
nonrefundable credits). Rather than leaving these as 3 more pure-input
questions defaulting to $0 (adding UI clutter for a value that, given what
this pilot even collects as input, can only ever be $0 anyway -- there is
no dependent or Schedule-3-eligible credit input anywhere in this pilot's
Question Registry to make them otherwise), they are hand-authored as
deterministic constant-0 calc rules instead. This is a real,
clearly-documented scope gap that becomes a genuine question again once a
later round adds any of those schedules -- not a silently wrong
assumption.

Line 23 ("Other taxes, including self-employment tax, from Schedule 2,
line 21") is a HAND-OFF, not owned here: once Schedule 2 exists (Phase 8
of the self-employment build-out), build/consolidation/schedule_2_bridge.py
takes over this rule with a real `carryover(form_1040s2_line_21)` formula
instead of the constant-$0 placeholder this module used to hand-author
before Schedule 2/Schedule SE existed.

CAUTION (operational fragility, same category as cross_form_bridge.py):
re-running THIS bridge after schedule_2_bridge.py has already run will NOT
overwrite line 23 (it's no longer in this module's `_RULES` list at all)
-- but re-running `synthesize --form 1040` will delete line 23's rule
along with every other form_1040_line_% rule, and neither bridge
recreates it automatically. Re-run schedule_2_bridge.py (after this one)
if that happens.

Idempotent: re-running deletes and rewrites every rule/edge this module owns
first (same pattern as form1040_income_bridge.py).
"""
from __future__ import annotations

import structlog
from sqlalchemy import or_, select

from db.models import CalcRule, CanonicalField, DependencyEdge, Document, HumanReviewItem, RuleStatusTransition
from db.session import get_session

log = structlog.get_logger(__name__)

_NOT_MODELED_NOTE = (
    "Scope simplification (see build/consolidation/tax_computation_bridge.py's module docstring): "
    "this schedule is not modeled by this pilot, and no input this pilot collects could make it "
    "nonzero, so this line is hand-authored as a constant $0 rather than a pure-input question."
)

# rule_id -> (formula, quote, formula_confidence, note_or_None)
_RULES: list[tuple[str, dict, str, float, str | None]] = [
    (
        "form_1040_line_16",
        {"type": "federal_income_tax", "operand_names": ["form_1040_line_15", "form_1040_filing_status"]},
        "Tax (see instructions). Check if any from Form(s): 1 8814 2 4972 3 [amount]",
        0.9,
        "Looked up from the IRS Tax Table / Tax Computation Worksheet (see runtime/tax_lookup.py) -- "
        "always tier='provisional' in this pilot today (see module docstring).",
    ),
    (
        "form_1040_line_17",
        {"type": "sum", "operand_names": [], "constant": 0},
        "Amount from Schedule 2, line 3",
        0.95,
        _NOT_MODELED_NOTE + " (Schedule 2 Part I -- AMT / excess advance premium tax credit repayment.)",
    ),
    (
        "form_1040_line_18",
        {"type": "sum", "operand_names": ["form_1040_line_16", "form_1040_line_17"]},
        "Add lines 16 and 17",
        0.95,
        None,
    ),
    (
        "form_1040_line_19",
        {"type": "sum", "operand_names": [], "constant": 0},
        "Child tax credit or credit for other dependents from Schedule 8812",
        0.95,
        _NOT_MODELED_NOTE + " (Schedule 8812 -- no dependents are modeled by this pilot.)",
    ),
    (
        "form_1040_line_20",
        {"type": "sum", "operand_names": [], "constant": 0},
        "Amount from Schedule 3, line 8",
        0.95,
        _NOT_MODELED_NOTE + " (Schedule 3 -- nonrefundable credits.)",
    ),
    (
        "form_1040_line_21",
        {"type": "sum", "operand_names": ["form_1040_line_19", "form_1040_line_20"]},
        "Add lines 19 and 20",
        0.95,
        None,
    ),
    (
        "form_1040_line_22",
        {"type": "subtract_floor_zero", "operand_names": ["form_1040_line_18", "form_1040_line_21"]},
        "Subtract line 21 from line 18. If zero or less, enter -0-",
        0.95,
        None,
    ),
    (
        "form_1040_line_24",
        {"type": "sum", "operand_names": ["form_1040_line_22", "form_1040_line_23"]},
        "Add lines 22 and 23. This is your total tax",
        0.95,
        None,
    ),
]


def run_tax_computation_bridge(tax_year: int = 2025) -> None:
    with get_session() as session:
        pdf_doc = session.execute(
            select(Document).where(Document.form_number == "1040", Document.doc_type == "form")
        ).scalars().first()
        if pdf_doc is None:
            print("tax computation bridge: no catalogued f1040.pdf 'form' document -- run discover --form 1040 first")
            return

        fields_by_name = {
            f.field_name: f
            for f in session.execute(
                select(CanonicalField).where(
                    or_(CanonicalField.field_name.like("form_1040_line_%"), CanonicalField.field_name == "form_1040_filing_status"),
                    CanonicalField.tax_year == tax_year,
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
            operand_names = formula["operand_names"]
            operand_fields = [fields_by_name.get(op) for op in operand_names]
            if field is None or any(op is None for op in operand_fields):
                log.warning(
                    "tax_computation_bridge.missing_field",
                    rule_id=rule_id,
                    missing=[n for n, f in zip(operand_names, operand_fields) if f is None],
                )
                skipped += 1
                continue

            confidence_breakdown = {
                "extraction_confidence": 1.0,
                "reference_resolution_confidence": 1.0,
                "formula_confidence": formula_confidence,
                "note": note or "Hand-authored from the form's own printed worksheet text.",
            }

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
                    irs_reference={
                        "document_id": pdf_doc.id,
                        "section_anchor": None,
                        "quote": quote,
                    },
                    confidence_breakdown=confidence_breakdown,
                    tax_year=tax_year,
                )
            )
            for op in operand_names:
                session.add(DependencyEdge(field_a=rule_id, depends_on_type="field", depends_on_ref=op))
            created += 1

        session.commit()

    print(f"tax computation bridge complete: {created} calc rules created, {skipped} skipped (missing field)")
