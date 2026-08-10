"""Hand-authored calc rules for the 2025 Schedule 1-A (Form 1040) --
Additional Deductions (Part I MAGI, Part II No Tax on Tips, Part V Enhanced
Deduction for Seniors, Part VI Total) -- see the plan's scope decision
(Part III Overtime and Part IV Car Loan Interest are explicitly deferred).

Unlike hsa_worksheet_bridge.py, Schedule 1-A's ~35 canonical fields are NOT
hand-authored here -- they come for free from the real, catalogued
IRS1040Schedule1A.xsd via build/synthesis/canonical_field_writer.py's
existing XSD walk (every element carries a clean `<LineNumber>` annotation;
verified directly). Only the *calc rules* are hand-authored, for the exact
same reason as hsa_worksheet_bridge.py: this is pure worksheet arithmetic
printed directly on the form itself, with no per-line KnowledgePacket for
the general LLM calc-rule agent to work from (Schedule 1-A has no
dedicated, separately-fetched instructions document -- see
build/sources/catalog/form_1040s1a.yaml).

Verbatim quotes below were extracted directly from the real, catalogued
f1040s1a.pdf's printed worksheet text (via xsd-files/xsl/2025/
IRS1040Schedule1A.xsl, the IRS's own e-file rendering stylesheet for this
exact form -- the same "form itself, not just instructions, is a versioned
source" pattern as hsa_worksheet_bridge.py):

  Part I    1  Enter the amount from Form 1040, 1040-SR, or 1040-NR, line 11b
           2e  Add lines 2a, 2b, 2c, and 2d
            3  Add lines 1 and 2e
  Part II   4c  If you only received qualified tips from one employer, enter
                the larger of line 4a or line 4b. Otherwise, see instructions
            6  Add lines 4c and 5
            7  Enter the smaller of the amount on line 6 or $25,000
            8  Enter the amount from line 3                    [no XSD element -- pure redisplay of line 3]
            9  Enter $150,000 ($300,000 if married filing jointly)
           10  Subtract line 9 from line 8. If zero or less, enter amount
                from line 7 on line 13
           11  Divide line 10 by $1,000. If the resulting number isn't a
                whole number, decrease the result to the next lower whole number
           12  Multiply line 11 by $100
           13  Qualified tips deduction. Subtract line 12 from line 7. If
                zero or less, enter -0-
  Part V    31  Enter the amount from line 3                    [no XSD element -- pure redisplay of line 3]
           32  Enter $75,000 ($150,000 if married filing jointly)
           33  Subtract line 32 from line 31. If zero or less, enter $6,000
                on line 35
           34  Multiply line 33 by 6% (0.06)
           35  Subtract line 34 from $6,000. If zero or less, enter -0-
          36a  If you have a valid social security number (see instructions)
                and were born before January 2, 1961, enter the amount from
                line 35
           37  Enhanced deduction for seniors. Add lines 36a and 36b
  Part VI   38  Add lines 13, 21, 30, and 37. Enter here and on Form 1040 or
                1040-SR, line 13b, or on Form 1040-NR, line 13c

Line 10's "if zero or less, enter amount from line 7 on line 13" branch (and
line 33's "if zero or less, enter $6,000 on line 35") are BOTH already
correctly handled by simple floor-at-zero chaining, with no explicit
if/else needed -- see runtime/engine.py's new `subtract_floor_zero` formula
type: if line 10 floors to 0, line 11 (floor_divide) is also 0, line 12
(multiply) is also 0, so line 13 = subtract_floor_zero(7, 12) = 7 exactly as
the branch describes. Same reasoning for line 33 -> 34 -> 35.

Lines 36a's age/SSN gate can't be expressed as a plain calc-rule formula
(CONDITION_FIELDS functions only ever see `profile_answers`, never another
canonical field's computed value -- see runtime/engine.py) -- instead this
module hand-creates a small non-XSD helper canonical field,
`form_1040s1a_senior_eligible_flag` (1.0/0.0, from
runtime.condition_rules.senior_deduction_eligibility_flag), and line_36a is
just `multiply(line_35, that_flag)`. Single-taxpayer pilot scope: SSN
validity is assumed true, so only the age test is actually evaluated (see
that function's own docstring).

Scope simplifications (explicit, not silent):
  * Part I lines 2a-2d (Puerto Rico / Form 2555 / Form 4563 add-backs) are
    out of scope -- left as plain pure-input questions, defaulting to $0.
  * Part II line 4a (W-2 box 7 tips) and 4b (Form 4137 tips) are out of
    scope this round (this pilot's W-2 intake only models Box 1 -- see
    build/consolidation/w2_bridge.py) -- also plain pure-input questions
    defaulting to $0. Only line 5 (tips from a trade/business, via
    1099-NEC/1099-MISC/1099-K) gets a real new question (see
    build/sources/w2_questions.yaml), per your scope decision.
  * Part V line 36b (spouse's enhanced senior deduction) is out of scope
    (no spouse modeled) -- plain pure-input question, defaulting to $0.
  * Part VI line 38's real formula is `sum(13, 21, 30, 37)`, but lines 21
    (Overtime) and 30 (Car Loan Interest) are Part III/IV, entirely
    deferred this round (per the plan's "explicitly out of scope" list) --
    modeled here as `sum(13, 37)` only, which is exactly equal to the real
    formula as long as 21/30 are 0 (true by construction: their own Parts
    have no calc rule/question wired, so nothing can ever make them
    nonzero this round).

Idempotent: re-running deletes and rewrites every rule/field/edge this
module owns first (same pattern as hsa_worksheet_bridge.py).
"""
from __future__ import annotations

import structlog
from sqlalchemy import select

from db.models import CalcRule, CanonicalField, DependencyEdge, Document, HumanReviewItem, RuleStatusTransition
from db.session import get_session

log = structlog.get_logger(__name__)

_ELIGIBLE_FLAG_FIELD_NAME = "form_1040s1a_senior_eligible_flag"

_ELIGIBLE_FLAG_CANONICAL_FIELD = dict(
    field_name=_ELIGIBLE_FLAG_FIELD_NAME,
    section="Part V \u2014 Enhanced Deduction for Seniors",
    data_type="DecimalType",
    cardinality="single",
    instance_dimension=None,
    source_xsd_element=None,
    source_form_line=None,
    description=(
        "Enhanced Senior Deduction Eligibility Flag (1.0 or 0.0) \u2014 hand-authored helper "
        "(see build/consolidation/schedule_1a_bridge.py's module docstring), not a real IRS "
        "line: gates form_1040s1a_line_36a on age >= 65 (SSN validity assumed true for this "
        "single-taxpayer pilot). See runtime.condition_rules.senior_deduction_eligibility_flag."
    ),
)

# rule_id -> (formula, quote, formula_confidence, note)
_RULES: list[tuple[str, dict, str, float, str | None]] = [
    (
        "form_1040s1a_line_1",
        {"type": "carryover", "operand_names": ["form_1040_line_11a"]},
        "Enter the amount from Form 1040, 1040-SR, or 1040-NR, line 11b",
        0.9,
        "Form 1040 has no separate 'line 11b' canonical field -- 11b is a page-2 redisplay of "
        "line 11a (AGI); see build/consolidation/form1040_income_bridge.py's module docstring "
        "for the full investigation.",
    ),
    (
        "form_1040s1a_line_2e",
        {"type": "sum", "operand_names": [
            "form_1040s1a_line_2a", "form_1040s1a_line_2b", "form_1040s1a_line_2c", "form_1040s1a_line_2d",
        ]},
        "Add lines 2a, 2b, 2c, and 2d",
        0.95,
        "Lines 2a-2d (Puerto Rico / Form 2555 / Form 4563 add-backs) are out of this pilot's "
        "scope -- pure-input questions defaulting to $0.",
    ),
    (
        "form_1040s1a_line_3",
        {"type": "sum", "operand_names": ["form_1040s1a_line_1", "form_1040s1a_line_2e"]},
        "Add lines 1 and 2e",
        0.95,
        None,
    ),
    (
        "form_1040s1a_line_4c",
        {"type": "max", "operand_names": ["form_1040s1a_line_4a", "form_1040s1a_line_4b"]},
        "If you only received qualified tips from one employer, enter the larger of line 4a or "
        "line 4b. Otherwise, see instructions",
        0.85,
        "Default (single-employer) case only -- the multi-employer 'see instructions' branch is "
        "out of this pilot's scope. Lines 4a/4b are themselves out of scope this round (W-2 box 7 "
        "/ Form 4137 tips not modeled) and default to $0.",
    ),
    (
        "form_1040s1a_line_6",
        {"type": "sum", "operand_names": ["form_1040s1a_line_4c", "form_1040s1a_line_5"]},
        "Add lines 4c and 5",
        0.95,
        None,
    ),
    (
        "form_1040s1a_line_7",
        {"type": "min", "operand_names": ["form_1040s1a_line_6"], "constant": 25000.0},
        "Enter the smaller of the amount on line 6 or $25,000",
        0.95,
        None,
    ),
    (
        "form_1040s1a_line_10",
        {"type": "subtract_floor_zero", "operand_names": ["form_1040s1a_line_3", "form_1040s1a_line_9"]},
        "Subtract line 9 from line 8. If zero or less, enter amount from line 7 on line 13",
        0.9,
        "Line 8 has no separate canonical field -- it's a pure redisplay of line 3 (MAGI), used "
        "directly here. The 'if zero or less, use line 7' branch is correctly handled by "
        "floor-at-zero chaining through lines 11/12/13 -- see module docstring.",
    ),
    (
        "form_1040s1a_line_11",
        {"type": "floor_divide", "operand_names": ["form_1040s1a_line_10"], "constant": 1000.0},
        "Divide line 10 by $1,000. If the resulting number isn't a whole number, decrease the "
        "result to the next lower whole number",
        0.9,
        None,
    ),
    (
        "form_1040s1a_line_12",
        {"type": "multiply", "operand_names": ["form_1040s1a_line_11"], "constant": 100.0},
        "Multiply line 11 by $100",
        0.95,
        None,
    ),
    (
        "form_1040s1a_line_13",
        {"type": "subtract_floor_zero", "operand_names": ["form_1040s1a_line_7", "form_1040s1a_line_12"]},
        "Qualified tips deduction. Subtract line 12 from line 7. If zero or less, enter -0-",
        0.95,
        None,
    ),
    (
        "form_1040s1a_line_33",
        {"type": "subtract_floor_zero", "operand_names": ["form_1040s1a_line_3", "form_1040s1a_line_32"]},
        "Subtract line 32 from line 31. If zero or less, enter $6,000 on line 35",
        0.9,
        "Line 31 has no separate canonical field -- it's a pure redisplay of line 3 (MAGI), used "
        "directly here. The 'if zero or less, enter $6,000' branch is correctly handled by "
        "floor-at-zero chaining through lines 34/35 -- see module docstring.",
    ),
    (
        "form_1040s1a_line_34",
        {"type": "multiply", "operand_names": ["form_1040s1a_line_33"], "constant": 0.06},
        "Multiply line 33 by 6% (0.06)",
        0.95,
        None,
    ),
    (
        "form_1040s1a_line_35",
        {"type": "subtract_floor_zero", "operand_names": ["form_1040s1a_line_34"], "constant": 6000.0},
        "Subtract line 34 from $6,000. If zero or less, enter -0-",
        0.95,
        "The fixed $6,000 is the minuend (see runtime/engine.py's subtract_floor_zero convention).",
    ),
    (
        "form_1040s1a_line_36a",
        {"type": "multiply", "operand_names": ["form_1040s1a_line_35", _ELIGIBLE_FLAG_FIELD_NAME]},
        "If you have a valid social security number (see instructions) and were born before "
        "January 2, 1961, enter the amount from line 35",
        0.9,
        "Age/SSN gate expressed via the hand-authored eligibility-flag helper field -- see module "
        "docstring.",
    ),
    (
        "form_1040s1a_line_37",
        {"type": "sum", "operand_names": ["form_1040s1a_line_36a", "form_1040s1a_line_36b"]},
        "Enhanced deduction for seniors. Add lines 36a and 36b",
        0.95,
        "Line 36b (spouse) is out of scope (no spouse modeled) -- pure-input question defaulting to $0.",
    ),
    (
        "form_1040s1a_line_38",
        {"type": "sum", "operand_names": ["form_1040s1a_line_13", "form_1040s1a_line_37"]},
        "Add lines 13, 21, 30, and 37. Enter here and on Form 1040 or 1040-SR, line 13b, or on "
        "Form 1040-NR, line 13c",
        0.9,
        "Lines 21 (Overtime, Part III) and 30 (Car Loan Interest, Part IV) are entirely deferred "
        "this round (see the plan's explicitly-out-of-scope list) and are omitted rather than "
        "wired as always-zero operands -- equivalent as long as neither Part ever gets a calc "
        "rule/question, which is true by construction this round.",
    ),
    (
        "form_1040_line_13b",
        {"type": "carryover", "operand_names": ["form_1040s1a_line_38"]},
        "Add lines 13, 21, 30, and 37. Enter here and on Form 1040 or 1040-SR, line 13b, or on "
        "Form 1040-NR, line 13c",
        0.95,
        "Destination-side carryover onto Form 1040 itself (same pattern as cross_form_bridge.py).",
    ),
]


def run_schedule_1a_bridge(tax_year: int = 2025) -> None:
    with get_session() as session:
        pdf_doc = session.execute(
            select(Document).where(Document.form_number == "1040s1a", Document.doc_type == "form")
        ).scalars().first()
        if pdf_doc is None:
            print("schedule 1-a bridge: no catalogued f1040s1a.pdf 'form' document -- run discover --form 1040s1a first")
            return

        flag_field = session.execute(
            select(CanonicalField).where(
                CanonicalField.field_name == _ELIGIBLE_FLAG_FIELD_NAME, CanonicalField.tax_year == tax_year
            )
        ).scalars().first()
        if flag_field is None:
            flag_field = CanonicalField(**_ELIGIBLE_FLAG_CANONICAL_FIELD, tax_year=tax_year)
            session.add(flag_field)
            session.flush()
            log.info("schedule_1a_bridge.created_canonical_field", field_name=_ELIGIBLE_FLAG_FIELD_NAME)

        fields_by_name = {
            f.field_name: f
            for f in session.execute(
                select(CanonicalField).where(
                    (
                        CanonicalField.field_name.like("form_1040s1a_line_%")
                        | CanonicalField.field_name.like("form_1040_line_%")
                        | (CanonicalField.field_name == _ELIGIBLE_FLAG_FIELD_NAME)
                    ),
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
                    "schedule_1a_bridge.missing_field",
                    rule_id=rule_id,
                    missing=[n for n, f in zip(operand_names, operand_fields) if f is None],
                )
                skipped += 1
                continue

            operands = [
                {"name": op.field_name, "source": f"canonical_field:{op.field_name}", "description": op.description}
                for op in operand_fields
            ]
            if formula.get("constant") is not None:
                operands.append({
                    "name": f"constant:{formula['constant']}",
                    "source": "constant",
                    "description": "A fixed dollar figure printed on the form itself, not a taxpayer input or another canonical field.",
                })

            session.add(
                CalcRule(
                    rule_id=rule_id,
                    status="candidate",
                    canonical_field_id=field.id,
                    formula=formula,
                    operands=operands,
                    carryover_target=None,
                    irs_reference={
                        "document_id": pdf_doc.id,
                        "section_anchor": None,
                        "quote": quote,
                    },
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

    print(f"schedule 1-a bridge complete: {created} calc rules created, {skipped} skipped (missing field)")
