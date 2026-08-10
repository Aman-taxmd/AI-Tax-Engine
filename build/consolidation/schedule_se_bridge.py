"""Hand-authored bridge for Schedule SE (Form 1040), Part I -- Self-
Employment Tax -- see docs/adr/0009 and the "Year-agnostic tax_year
architecture + Self-employment/W-2/Refund build-out" plan's Phase 7.

Scope: single nonfarm business, regular method only (matches the plan
exactly).

  MODELED: Part I regular-method computation, lines 2-13. Line 2 (net
  profit/loss) reads directly from `form_1040sc_line_31` (Schedule C,
  Phase 6); line 8a reads the new W-2 Box 3 total (Phase 5's
  `intake_w2_box3_ss_wages`, summed here for the first time -- Box 3 was
  captured back in Phase 5 but deliberately left unwired until this
  module existed, per w2_bridge.py's own module docstring).

  DEFERRED (explicit constant-$0 "not modeled", never silent):
    * Farm income (line 1a), Conservation Reserve Program payments
      (line 1b).
    * Church employee income (lines 5a/5b).
    * Optional methods, Part II (line 4b, folded to 0).
    * Form 4137/8919 tip/wage adjustments (lines 8b/8c).
    * The $400/$434 filing-threshold "stop, you don't owe SE tax" edge
      case on line 4c -- this pilot always runs the plain arithmetic
      through to line 12/13 rather than special-casing sub-$400 net
      earnings. (A Schedule C loss still correctly nets to $0 SE tax via
      `multiply_floor_zero` on line 4a -- see runtime/engine.py -- so the
      only edge case actually skipped is a small *positive* net-earnings
      amount under $400, a rare case for this pilot's realistic test
      scenarios.)

Verbatim quotes below were extracted directly from our stored copy of
f1040sse.pdf via PyMuPDF (same technique as hsa_worksheet_bridge.py):

    2   Net profit or (loss) from Schedule C, line 31; ...
    3   Combine lines 1a, 1b, and 2
    4a  If line 3 is more than zero, multiply line 3 by 92.35% (0.9235).
        Otherwise, enter amount from line 3
    4c  Combine lines 4a and 4b. If less than $400, stop; you don't owe
        self-employment tax.
    6   Add lines 4c and 5b
    7   Maximum amount of combined wages and self-employment earnings
        subject to social security tax ... for 2025 [printed constant:
        $176,100]
    8a  Total social security wages and tips (total of boxes 3 and 7 on
        Form(s) W-2) and railroad retirement (tier 1) compensation. ...
    8d  Add lines 8a, 8b, and 8c
    9   Subtract line 8d from line 7. If zero or less, enter -0- here and
        on line 10 and go to line 11
    10  Multiply the smaller of line 6 or line 9 by 12.4% (0.124)
    11  Multiply line 6 by 2.9% (0.029)
    12  Self-employment tax. Add lines 10 and 11. Enter here and on
        Schedule 2 (Form 1040), line 4, ...
    13  Deduction for one-half of self-employment tax. Multiply line 12
        by 50% (0.50). Enter here and on Schedule 1 (Form 1040), line 15

Two outbound paths, both verbatim per lines 12/13's own printed text:
line 12 (total SE tax) -> Schedule 2, line 4 (see schedule_2_bridge.py);
line 13 (half-SE-tax deduction) -> Schedule 1, line 15 (a real XSD
element, already existing).

Idempotent: re-running deletes and rewrites every rule/edge this module
owns first. Re-running `synthesize --form 1040sse` afterward will delete
these rules and NOT recreate them (this pilot's structural parser found
KnowledgePackets for only 2 of Schedule SE's 13 lines -- the rest of this
short, entirely form-printed-arithmetic worksheet has no instructions-
prose paragraph of its own to extract from) -- re-run this bridge again
if that happens.
"""
from __future__ import annotations

import structlog
from sqlalchemy import select

from db.models import CalcRule, CanonicalField, DependencyEdge, Document, HumanReviewItem, RuleStatusTransition
from db.session import get_session

log = structlog.get_logger(__name__)

# 2025 Social Security (OASDI) wage base -- scripts/seed_tax_constants.py's
# tax_constants["self_employment"]["oasdi_wage_base"]. Hardcoded here (not a
# runtime lookup), same convention as every other hand-authored bridge.
_OASDI_WAGE_BASE_2025 = 176100.0
_NET_EARNINGS_FACTOR = 0.9235  # tax_constants["self_employment"]["net_earnings_factor"]
_OASDI_RATE = 0.124            # tax_constants["self_employment"]["oasdi_rate"]
_MEDICARE_RATE = 0.029         # tax_constants["self_employment"]["medicare_rate"]
_DEDUCTIBLE_SE_TAX_FACTOR = 0.5  # tax_constants["self_employment"]["deductible_se_tax_factor"]

# New canonical field: line 7 is a FIXED printed dollar constant on the real
# form ("$176,100"), not a taxpayer-entered or XSD-transmitted amount --
# absent from IRS1040ScheduleSE.xsd (grep-confirmed no LineNumber "7"
# element), same "form prints something the e-file schema doesn't
# separately transmit" pattern as Schedule C's lines 4/27b.
_NEW_FIELDS: list[tuple[str, str, str, str]] = [
    (
        "form_1040sse_line_7",
        "Part I - Self-Employment Tax",
        "USAmountType",
        "Maximum amount of combined wages and self-employment earnings subject to social security "
        "tax or the 6.2% portion of the 7.65% railroad retirement (tier 1) tax for 2025 — a fixed "
        "printed dollar constant on the real form ($176,100), not a taxpayer answer. Hand-created: "
        "absent from IRS1040ScheduleSE.xsd (no e-file element for a value that never varies by "
        "taxpayer) — see module docstring.",
    ),
]

# rule_id -> (formula, quote, formula_confidence, note)
_RULES: list[tuple[str, dict, str, float, str | None]] = [
    (
        "form_1040sse_line_2",
        {"type": "carryover", "operand_names": ["form_1040sc_line_31"]},
        "Net profit or (loss) from Schedule C, line 31; and Schedule K-1 (Form 1065), box 14, code A "
        "(other than farming).",
        0.95,
        "Single nonfarm business, regular method only -- see module docstring.",
    ),
    (
        "form_1040sse_line_3",
        {"type": "sum", "operand_names": ["form_1040sse_line_1a", "form_1040sse_line_1b", "form_1040sse_line_2"]},
        "Combine lines 1a, 1b, and 2",
        0.95,
        "Lines 1a/1b (farm income, Conservation Reserve Program payments) are deferred to constant "
        "$0 -- see module docstring.",
    ),
    (
        "form_1040sse_line_1a",
        {"type": "sum", "operand_names": [], "constant": 0},
        "Net farm profit or (loss) from Schedule F, line 34 -- farm income not modeled this round, "
        "explicit constant $0.",
        1.0,
        "Deferred scope -- see module docstring.",
    ),
    (
        "form_1040sse_line_1b",
        {"type": "sum", "operand_names": [], "constant": 0},
        "If you received social security retirement or disability benefits, enter the amount of "
        "Conservation Reserve Program payments -- not modeled this round, explicit constant $0.",
        1.0,
        "Deferred scope -- see module docstring.",
    ),
    (
        "form_1040sse_line_4a",
        {"type": "multiply_floor_zero", "operand_names": ["form_1040sse_line_3"], "constant": _NET_EARNINGS_FACTOR},
        "If line 3 is more than zero, multiply line 3 by 92.35% (0.9235). Otherwise, enter amount "
        "from line 3",
        0.9,
        "A Schedule C loss (line 3 <= 0) correctly nets to $0 self-employment tax via this floor -- "
        "see module docstring and runtime/engine.py's multiply_floor_zero.",
    ),
    (
        "form_1040sse_line_4b",
        {"type": "sum", "operand_names": [], "constant": 0},
        "If you elect one or both of the optional methods, enter the total of lines 15 and 17 here -- "
        "optional methods (Part II) not modeled this round, explicit constant $0.",
        1.0,
        "Deferred scope -- see module docstring.",
    ),
    (
        "form_1040sse_line_4c",
        {"type": "sum", "operand_names": ["form_1040sse_line_4a", "form_1040sse_line_4b"]},
        "Combine lines 4a and 4b.",
        0.9,
        "The '$400 filing threshold, stop, you don't owe SE tax' branch is deferred -- see module "
        "docstring.",
    ),
    (
        "form_1040sse_line_5a",
        {"type": "sum", "operand_names": [], "constant": 0},
        "Enter your church employee income from Form W-2. -- church employee income not modeled "
        "this round, explicit constant $0.",
        1.0,
        "Deferred scope -- see module docstring.",
    ),
    (
        "form_1040sse_line_5b",
        {"type": "sum", "operand_names": [], "constant": 0},
        "Multiply line 5a by 92.35% (0.9235). If less than $100, enter -0- -- church employee income "
        "not modeled this round, explicit constant $0.",
        1.0,
        "Deferred scope -- see module docstring.",
    ),
    (
        "form_1040sse_line_6",
        {"type": "sum", "operand_names": ["form_1040sse_line_4c", "form_1040sse_line_5b"]},
        "Add lines 4c and 5b",
        0.95,
        None,
    ),
    (
        "form_1040sse_line_7",
        {"type": "sum", "operand_names": [], "constant": _OASDI_WAGE_BASE_2025},
        "Maximum amount of combined wages and self-employment earnings subject to social security "
        "tax or the 6.2% portion of the 7.65% railroad retirement (tier 1) tax for 2025 [$176,100]",
        1.0,
        "Fixed printed dollar constant, not a taxpayer answer -- see module docstring.",
    ),
    (
        "form_1040sse_line_8a",
        {"type": "sum_instances", "operand_names": ["intake_w2_box3_ss_wages"]},
        "Total social security wages and tips (total of boxes 3 and 7 on Form(s) W-2) and railroad "
        "retirement (tier 1) compensation.",
        0.9,
        "Sums Phase 5's intake_w2_box3_ss_wages (Box 3) across every W-2. Box 7 (social security "
        "tips) and railroad retirement (tier 1) compensation are not modeled this round -- W-2 "
        "intake only captures Boxes 1/2/3/5/12-W (see w2_bridge.py) -- explicit scope narrowing, "
        "not a silent omission.",
    ),
    (
        "form_1040sse_line_8b",
        {"type": "sum", "operand_names": [], "constant": 0},
        "Unreported tips subject to social security tax from Form 4137, line 10 -- not modeled this "
        "round, explicit constant $0.",
        1.0,
        "Deferred scope -- see module docstring.",
    ),
    (
        "form_1040sse_line_8c",
        {"type": "sum", "operand_names": [], "constant": 0},
        "Wages subject to social security tax from Form 8919, line 10 -- not modeled this round, "
        "explicit constant $0.",
        1.0,
        "Deferred scope -- see module docstring.",
    ),
    (
        "form_1040sse_line_8d",
        {
            "type": "sum",
            "operand_names": ["form_1040sse_line_8a", "form_1040sse_line_8b", "form_1040sse_line_8c"],
        },
        "Add lines 8a, 8b, and 8c",
        0.95,
        None,
    ),
    (
        "form_1040sse_line_9",
        {"type": "subtract_floor_zero", "operand_names": ["form_1040sse_line_7", "form_1040sse_line_8d"]},
        "Subtract line 8d from line 7. If zero or less, enter -0- here and on line 10 and go to line 11",
        0.95,
        None,
    ),
    (
        "form_1040sse_line_10",
        {
            "type": "min_multiply",
            "operand_names": ["form_1040sse_line_6", "form_1040sse_line_9"],
            "constant": _OASDI_RATE,
        },
        "Multiply the smaller of line 6 or line 9 by 12.4% (0.124)",
        0.95,
        None,
    ),
    (
        "form_1040sse_line_11",
        {"type": "multiply", "operand_names": ["form_1040sse_line_6"], "constant": _MEDICARE_RATE},
        "Multiply line 6 by 2.9% (0.029)",
        0.95,
        None,
    ),
    (
        "form_1040sse_line_12",
        {"type": "sum", "operand_names": ["form_1040sse_line_10", "form_1040sse_line_11"]},
        "Self-employment tax. Add lines 10 and 11. Enter here and on Schedule 2 (Form 1040), line 4",
        0.95,
        None,
    ),
    (
        "form_1040sse_line_13",
        {"type": "multiply", "operand_names": ["form_1040sse_line_12"], "constant": _DEDUCTIBLE_SE_TAX_FACTOR},
        "Deduction for one-half of self-employment tax. Multiply line 12 by 50% (0.50). Enter here "
        "and on Schedule 1 (Form 1040), line 15",
        0.95,
        None,
    ),
    (
        "form_1040s1_line_15",
        {"type": "carryover", "operand_names": ["form_1040sse_line_13"]},
        "Deductible self-employment tax -- verbatim per Schedule SE line 13's own printed text: "
        "'Enter here and on Schedule 1 (Form 1040), line 15.'",
        0.95,
        None,
    ),
]


def run_schedule_se_bridge(tax_year: int = 2025) -> None:
    with get_session() as session:
        pdf_doc = session.execute(
            select(Document).where(Document.form_number == "1040sse", Document.doc_type == "form")
        ).scalars().first()
        if pdf_doc is None:
            print("schedule se bridge: no catalogued f1040sse.pdf 'form' document -- run discover --form 1040sse first")
            return

        fields_by_name: dict[str, CanonicalField] = {
            f.field_name: f
            for f in session.execute(
                select(CanonicalField).where(
                    CanonicalField.field_name.like("form_1040sse_line_%"), CanonicalField.tax_year == tax_year
                )
            ).scalars().all()
        }
        # Cross-form operands (Schedule C's net profit, the W-2 Box 3 intake
        # field, Schedule 1's half-SE-tax-deduction destination line) also
        # need to resolve for the missing-field guard below.
        cross_form_names = ["form_1040sc_line_31", "intake_w2_box3_ss_wages", "form_1040s1_line_15"]
        for f in session.execute(
            select(CanonicalField).where(
                CanonicalField.field_name.in_(cross_form_names), CanonicalField.tax_year == tax_year
            )
        ).scalars().all():
            fields_by_name[f.field_name] = f

        for field_name, section, data_type, description in _NEW_FIELDS:
            existing = fields_by_name.get(field_name)
            if existing is None:
                existing = CanonicalField(
                    field_name=field_name,
                    section=section,
                    data_type=data_type,
                    cardinality="single",
                    instance_dimension=None,
                    source_xsd_element=None,
                    source_form_line="7",
                    description=description,
                    tax_year=tax_year,
                )
                session.add(existing)
                session.flush()
                log.info("schedule_se_bridge.created_canonical_field", field_name=field_name)
            else:
                existing.description = description
            fields_by_name[field_name] = existing

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
                    "schedule_se_bridge.missing_field",
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

    print(f"schedule se bridge complete: {created} calc rules created, {skipped} skipped (missing field)")
