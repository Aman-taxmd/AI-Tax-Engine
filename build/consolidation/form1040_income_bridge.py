"""Hand-authored bridge for Form 1040's own internal Income/AGI/Deductions
arithmetic chain (lines 1z, 9, 11a, 14, 15) -- same rationale as
hsa_worksheet_bridge.py: this arithmetic is printed directly on the form
itself (not repeated in the i1040gi instructions prose), grep-confirmed
absent from the fetched i1040gi HTML, so the general LLM calc-rule agent has
no KnowledgePacket to work from for any of these lines.

Verbatim quotes below were extracted directly from our stored copy of
f1040.pdf via PyMuPDF (same technique as hsa_worksheet_bridge.py /
build/synthesis/pdf_field_mapper.py's `_nearby_label_text`):

    Page 1:
      1z  Add lines 1a through 1h
       9  Add lines 1z, 2b, 3b, 4b, 5b, 6b, 7a, and 8. This is your total income
      11a Subtract line 10 from line 9. This is your adjusted gross income
    Page 2:
      11b Amount from line 11a (adjusted gross income)
      14  Add lines 12e, 13a, and 13b
      15  Subtract line 14 from line 11b. If zero or less, enter -0-. This is
          your taxable income

AGI investigation (resolves the plan's "verify 11a vs 11b" open question):
Schedule 1-A's own printed line 1 says "Enter the amount from Form 1040,
1040-SR, or 1040-NR, line 11b" -- but the real, catalogued f1040.pdf has NO
separate `AdjustedGrossIncomeAmt`-type XSD element for "11b" (confirmed:
IRS1040.xsd has exactly one AGI element, `LineNumber` `11a`). Reading both
pages of the real PDF together makes this unambiguous: 11a computes AGI on
page 1 ("This is your adjusted gross income"); 11b on page 2 is a pure
redisplay of that same number ("Amount from line 11a (adjusted gross
income)") so the Tax and Credits section has it without flipping back a
page -- the exact same "no separate element, form just repeats an earlier
line's value" pattern already seen in Form 8889 (line 8 = "use Part I line
3") and Schedule 1-A itself (lines 8/16/25/31 = "use line 3"). So
Schedule 1-A's own MAGI passthrough (line 1) correctly reads
`form_1040_line_11a` directly -- see build/consolidation/schedule_1a_bridge.py.

Scope simplifications (explicit, not silent):
  * Line 11a's own "Subtract line 10 from line 9" is NOT floored at zero on
    the real form (unlike line 15) -- correctly modeled here as plain
    `subtract`, not `subtract_floor_zero`.
  * Line 13a (QBI deduction, Form 8995/8995-A) is out of this round's scope
    -- left as a plain pure-input question, defaulting to $0 like every
    other not-yet-modeled adjustment line.
  * Line 10 (Schedule 1, line 26 carryover) and line 13b (Schedule 1-A,
    line 38 carryover) already have their own calc rules from
    cross_form_bridge.py / schedule_1a_bridge.py respectively -- NOT
    recreated here.
  * This pilot stops at line 15 (Taxable Income) -- line 16 (Tax) requires
    the full tax-bracket/Qualified-Dividends-Worksheet logic, out of scope.

Idempotent: re-running deletes and rewrites every rule/edge this module owns
first (same pattern as hsa_worksheet_bridge.py).
"""
from __future__ import annotations

import structlog
from sqlalchemy import select

from db.models import CalcRule, CanonicalField, DependencyEdge, Document, HumanReviewItem, RuleStatusTransition
from db.session import get_session

log = structlog.get_logger(__name__)

# rule_id -> (formula, quote, formula_confidence)
_RULES: list[tuple[str, dict, str, float]] = [
    (
        "form_1040_line_1z",
        {
            "type": "sum",
            "operand_names": [
                "form_1040_line_1a", "form_1040_line_1b", "form_1040_line_1c", "form_1040_line_1d",
                "form_1040_line_1e", "form_1040_line_1f", "form_1040_line_1g", "form_1040_line_1h",
            ],
        },
        "Add lines 1a through 1h",
        0.95,
    ),
    (
        "form_1040_line_9",
        {
            "type": "sum",
            "operand_names": [
                "form_1040_line_1z", "form_1040_line_2b", "form_1040_line_3b", "form_1040_line_4b",
                "form_1040_line_5b", "form_1040_line_6b", "form_1040_line_7a", "form_1040_line_8",
            ],
        },
        "Add lines 1z, 2b, 3b, 4b, 5b, 6b, 7a, and 8. This is your total income",
        0.95,
    ),
    (
        "form_1040_line_11a",
        {"type": "subtract", "operand_names": ["form_1040_line_9", "form_1040_line_10"]},
        "Subtract line 10 from line 9. This is your adjusted gross income",
        0.95,
    ),
    (
        "form_1040_line_14",
        {"type": "sum", "operand_names": ["form_1040_line_12e", "form_1040_line_13a", "form_1040_line_13b"]},
        "Add lines 12e, 13a, and 13b",
        0.95,
    ),
    (
        "form_1040_line_15",
        {"type": "subtract_floor_zero", "operand_names": ["form_1040_line_11a", "form_1040_line_14"]},
        "Subtract line 14 from line 11b. If zero or less, enter -0-. This is your taxable income "
        "(line 11b is a same-page-2 redisplay of line 11a -- see module docstring).",
        0.95,
    ),
]


def run_form1040_income_bridge(tax_year: int = 2025) -> None:
    with get_session() as session:
        pdf_doc = session.execute(
            select(Document).where(Document.form_number == "1040", Document.doc_type == "form")
        ).scalars().first()
        if pdf_doc is None:
            print("form1040 income bridge: no catalogued f1040.pdf 'form' document -- run discover --form 1040 first")
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
        for rule_id, formula, quote, formula_confidence in _RULES:
            field = fields_by_name.get(rule_id)
            operand_names = formula["operand_names"]
            operand_fields = [fields_by_name.get(op) for op in operand_names]
            if field is None or any(op is None for op in operand_fields):
                log.warning(
                    "form1040_income_bridge.missing_field",
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
                    irs_reference={
                        "document_id": pdf_doc.id,
                        "section_anchor": None,
                        "quote": quote,
                    },
                    confidence_breakdown={
                        "extraction_confidence": 1.0,
                        "reference_resolution_confidence": 1.0,
                        "formula_confidence": formula_confidence,
                        "note": "Hand-authored from the form's own printed worksheet text.",
                    },
                    tax_year=tax_year,
                )
            )
            for op in operand_names:
                session.add(DependencyEdge(field_a=rule_id, depends_on_type="field", depends_on_ref=op))
            created += 1

        session.commit()

    print(f"form1040 income bridge complete: {created} calc rules created, {skipped} skipped (missing field)")
