"""Hand-authored bridge for Schedule 2 (Form 1040), Part II -- Other Taxes
-- and Form 8889's own Part II/III (HSA distributions / failure-to-
maintain-HDHP additional tax), whose two outputs (17b, 21) feed Schedule
2's lines 17c/17d. See docs/adr/0009 and the "Year-agnostic tax_year
architecture + Self-employment/W-2/Refund build-out" plan's Phase 8.

Three converging inputs to Schedule 2, Part II, all wired here for the
first time:
  1. Schedule SE's total self-employment tax (line 12) -> Schedule 2,
     line 4 -- verbatim per Schedule SE line 12's own printed text ("Enter
     here and on Schedule 2 (Form 1040), line 4").
  2. Form 8889's Part II "Additional 20% tax" (line 17b) -> Schedule 2,
     line 17c -- verbatim per Form 8889 line 17b's own printed text
     ("include this amount in the total on Schedule 2 (Form 1040), Part
     II, line 17c").
  3. Form 8889's Part III "Additional tax" (line 21) -> Schedule 2, line
     17d -- verbatim per Form 8889 line 21's own printed text ("include
     this amount in the total on Schedule 2 (Form 1040), Part II, line
     17d").

Then Schedule 2's own line 21 total feeds Form 1040 line 23 (see
tax_computation_bridge.py's module docstring for that hand-off note).

Form 8889 Part II/III scope (matches the plan's "do both while we're in
the file -- SE lines AND the Form 8889 Part II/III HSA-distribution lines
(17c/17d)"):
  MODELED: lines 14a/14b/14c/15/16 (taxable HSA distribution computation),
  17a/17b (the 20% additional tax, correctly gated to $0 if the taxpayer
  checks the 17a Exceptions box -- see runtime/engine.py's
  `multiply_unless_flag`).
  DEFERRED (explicit constant-$0, Part III "failure to maintain HDHP
  coverage" is a rare scenario -- last-month-rule electors who fail the
  testing period): lines 18 ("Last-month rule") and 19 ("Qualified HSA
  funding distribution", a DIFFERENT line from Part I's line 10 of the
  same name) are both constant $0; line 20/21 still compute correctly off
  them (both $0 -> $0 additional tax) rather than being skipped, so this
  chain is honest math on unmodeled-but-present inputs, not a missing
  link.

Verbatim quotes below were extracted directly from our stored copies of
f8889.pdf / f1040s2.pdf via PyMuPDF:

    (Form 8889)
    14c Subtract line 14b from line 14a
    16  Taxable HSA distributions. Subtract line 15 from line 14c. If
        zero or less, enter -0-. ...
    17b Additional 20% tax ... Enter 20% (0.20) of the distributions
        included on line 16 that are subject to the additional 20% tax.
        ... include this amount in the total on Schedule 2 (Form 1040),
        Part II, line 17c
    20  Total income. Add lines 18 and 19. ...
    21  Additional tax. Multiply line 20 by 10% (0.10). Include this
        amount in the total on Schedule 2 (Form 1040), Part II, line 17d

    (Schedule 2)
    7   Total additional social security and Medicare tax. Add lines 5
        and 6
    18  Total additional taxes. Add lines 17a through 17z
    21  Add lines 4, 7 through 16, 18, and 19. These are your total other
        taxes. Enter here and on Form 1040 or 1040-SR, line 23

Line 21's exact composition (per the form's own text) is "lines 4, 7
through 16, 18, and 19" -- NOT lines 5/6/10/17a-17z/20 individually (5/6
are absorbed into line 7 already; 17a-17z are absorbed into line 18
already; line 10 is "Reserved for future use", no field exists for it;
line 20 -- "Section 965 net tax liability installment" -- is deliberately
excluded by the real form's own line 21 instruction, not an omission
here).

Idempotent: re-running deletes and rewrites every rule/edge this module
owns first. Re-running `synthesize --form 1040s2` or `synthesize --form
8889` afterward will delete the rules this module owns for that form and
NOT recreate them -- re-run this bridge again if that happens (see
tax_computation_bridge.py's module docstring for the related Form 1040
line 23 hand-off caution).
"""
from __future__ import annotations

import structlog
from sqlalchemy import select

from db.models import CalcRule, CanonicalField, DependencyEdge, Document, HumanReviewItem, RuleStatusTransition
from db.session import get_session
from runtime.chain import form_field_condition

log = structlog.get_logger(__name__)

_ADDITIONAL_TAX_RATE = 0.20  # Form 8889 line 17b: "Enter 20% (0.20) of the distributions ..."
_FAILURE_TO_MAINTAIN_RATE = 0.10  # Form 8889 line 21: "Multiply line 20 by 10% (0.10)"

_SCHEDULE2_LINE_18_OPERANDS = [
    "form_1040s2_line_17a", "form_1040s2_line_17b", "form_1040s2_line_17c", "form_1040s2_line_17d",
    "form_1040s2_line_17e", "form_1040s2_line_17f", "form_1040s2_line_17g", "form_1040s2_line_17h",
    "form_1040s2_line_17i", "form_1040s2_line_17j", "form_1040s2_line_17k", "form_1040s2_line_17l",
    "form_1040s2_line_17m", "form_1040s2_line_17n", "form_1040s2_line_17o", "form_1040s2_line_17p",
    "form_1040s2_line_17q", "form_1040s2_line_17z",
]
_SCHEDULE2_LINE_21_OPERANDS = [
    "form_1040s2_line_4", "form_1040s2_line_7", "form_1040s2_line_8", "form_1040s2_line_9",
    "form_1040s2_line_11", "form_1040s2_line_12", "form_1040s2_line_13", "form_1040s2_line_14",
    "form_1040s2_line_15", "form_1040s2_line_16", "form_1040s2_line_18", "form_1040s2_line_19",
]

# rule_id -> (formula, quote, formula_confidence, note, pdf_form_number)
_RULES: list[tuple[str, dict, str, float, str | None, str]] = [
    # --- Form 8889 Part II (HSA Distributions) ---
    # Field names below use TaxCore's dot-notation domain paths (renamed from
    # `form_8889_line_N` -- see docs/adr/0010).
    (
        "income.hsa_net_distribution_amount",  # Line 14c
        {
            "type": "subtract",
            "operand_names": [
                "income.total_hsa_distribution_amount",  # Line 14a
                "adjustments.hsa_distribution_rollover_amount",  # Line 14b
            ],
        },
        "Subtract line 14b from line 14a",
        0.95,
        None,
        "8889",
    ),
    (
        "income.taxable_hsa_distribution_amount",  # Line 16
        {
            "type": "subtract_floor_zero",
            "operand_names": [
                "income.hsa_net_distribution_amount",  # Line 14c
                "deductions.unreimbursed_qualified_medical_dental_expenses_amount",  # Line 15
            ],
        },
        "Taxable HSA distributions. Subtract line 15 from line 14c. If zero or less, enter -0-.",
        0.95,
        None,
        "8889",
    ),
    (
        "taxes.hsa_distribution_additional_percent_tax_amount",  # Line 17b
        {
            "type": "multiply_unless_flag",
            "flag_operand": "income.is_hsa_distribution_additional_tax_exception",  # Line 17a
            "operand_names": [
                "income.is_hsa_distribution_additional_tax_exception",  # Line 17a
                "income.taxable_hsa_distribution_amount",  # Line 16
            ],
            "constant": _ADDITIONAL_TAX_RATE,
        },
        "Additional 20% tax (see instructions). Enter 20% (0.20) of the distributions included on "
        "line 16 that are subject to the additional 20% tax.",
        0.9,
        "$0 if the taxpayer checked line 17a's Exceptions box -- see runtime/engine.py's "
        "multiply_unless_flag.",
        "8889",
    ),
    # --- Form 8889 Part III (Failure To Maintain HDHP Coverage) ---
    (
        "deductions.hdhp_coverage_fail_partial_year_amount",  # Line 18
        {"type": "sum", "operand_names": [], "constant": 0},
        "Last-month rule -- not modeled this round (last-month-rule testing-period failures are a "
        "rare scenario), explicit constant $0.",
        1.0,
        "Deferred scope -- see module docstring.",
        "8889",
    ),
    (
        "adjustments.hdhp_coverage_fail_fund_distribution_amount",  # Line 19
        {"type": "sum", "operand_names": [], "constant": 0},
        "Qualified HSA funding distribution -- Part III's own line 19 (distinct from Part I's line "
        "10 of the same name) not modeled this round, explicit constant $0.",
        1.0,
        "Deferred scope -- see module docstring.",
        "8889",
    ),
    (
        "income.hdhp_coverage_income_amount",  # Line 20
        {
            "type": "sum",
            "operand_names": [
                "deductions.hdhp_coverage_fail_partial_year_amount",  # Line 18
                "adjustments.hdhp_coverage_fail_fund_distribution_amount",  # Line 19
            ],
        },
        "Total income. Add lines 18 and 19.",
        0.95,
        None,
        "8889",
    ),
    (
        "taxes.hdhp_coverage_additional_tax_amount",  # Line 21
        {
            "type": "multiply",
            "operand_names": ["income.hdhp_coverage_income_amount"],  # Line 20
            "constant": _FAILURE_TO_MAINTAIN_RATE,
        },
        "Additional tax. Multiply line 20 by 10% (0.10). Include this amount in the total on "
        "Schedule 2 (Form 1040), Part II, line 17d",
        0.95,
        None,
        "8889",
    ),
    # --- Schedule 2, Part II (Other Taxes) ---
    (
        "form_1040s2_line_4",
        {"type": "carryover", "operand_names": ["form_1040sse_line_12"]},
        "Self-employment tax. Attach Schedule SE.",
        0.95,
        None,
        "1040s2",
    ),
    (
        "form_1040s2_line_7",
        {"type": "sum", "operand_names": ["form_1040s2_line_5", "form_1040s2_line_6"]},
        "Total additional social security and Medicare tax. Add lines 5 and 6",
        0.95,
        None,
        "1040s2",
    ),
    (
        "form_1040s2_line_17c",
        {"type": "carryover", "operand_names": ["taxes.hsa_distribution_additional_percent_tax_amount"]},
        "Additional tax on HSA distributions. Attach Form 8889.",
        0.95,
        None,
        "1040s2",
    ),
    (
        "form_1040s2_line_17d",
        {"type": "carryover", "operand_names": ["taxes.hdhp_coverage_additional_tax_amount"]},
        "Additional tax on an HSA because you didn't remain an eligible individual. Attach Form 8889.",
        0.95,
        None,
        "1040s2",
    ),
    (
        "form_1040s2_line_18",
        {"type": "sum", "operand_names": _SCHEDULE2_LINE_18_OPERANDS},
        "Total additional taxes. Add lines 17a through 17z",
        0.95,
        None,
        "1040s2",
    ),
    (
        "form_1040s2_line_21",
        {"type": "sum", "operand_names": _SCHEDULE2_LINE_21_OPERANDS},
        "Add lines 4, 7 through 16, 18, and 19. These are your total other taxes. Enter here and on "
        "Form 1040 or 1040-SR, line 23",
        0.9,
        "Line 10 ('Reserved for future use') has no field to add; line 20 is genuinely excluded by "
        "the form's own line 21 instruction -- see module docstring.",
        "1040s2",
    ),
    # --- Form 1040 hand-off (see tax_computation_bridge.py's module docstring) ---
    (
        "form_1040_line_23",
        {"type": "carryover", "operand_names": ["form_1040s2_line_21"]},
        "Other taxes, including self-employment tax, from Schedule 2, line 21",
        0.95,
        None,
        "1040",
    ),
]


def run_schedule_2_bridge(tax_year: int = 2025) -> None:
    with get_session() as session:
        pdf_docs = {
            d.form_number: d
            for d in session.execute(
                select(Document).where(
                    Document.form_number.in_(["1040s2", "8889", "1040"]), Document.doc_type == "form"
                )
            ).scalars().all()
        }
        missing_docs = {"1040s2", "8889", "1040"} - set(pdf_docs)
        if missing_docs:
            print(f"schedule 2 bridge: missing catalogued form PDF(s) for {sorted(missing_docs)} -- run discover first")
            return

        fields_by_name: dict[str, CanonicalField] = {}
        for form in ("1040s2", "8889", "1040"):
            for f in session.execute(
                select(CanonicalField).where(
                    form_field_condition(CanonicalField.field_name, form), CanonicalField.tax_year == tax_year
                )
            ).scalars().all():
                fields_by_name[f.field_name] = f
        for f in session.execute(
            select(CanonicalField).where(
                CanonicalField.field_name == "form_1040sse_line_12", CanonicalField.tax_year == tax_year
            )
        ).scalars().all():
            fields_by_name[f.field_name] = f

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
        for rule_id, formula, quote, formula_confidence, note, pdf_form_number in _RULES:
            field = fields_by_name.get(rule_id)
            operand_names = formula.get("operand_names", [])
            operand_fields = [fields_by_name.get(op) for op in operand_names]
            if field is None or any(op is None for op in operand_fields):
                log.warning(
                    "schedule_2_bridge.missing_field",
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
                    irs_reference={"document_id": pdf_docs[pdf_form_number].id, "section_anchor": None, "quote": quote},
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

    print(f"schedule 2 bridge complete: {created} calc rules created, {skipped} skipped (missing field)")
