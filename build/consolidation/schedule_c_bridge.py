"""Hand-authored bridge for Schedule C (Form 1040) Part I (Income) and
Part II (Expenses), and its connection into Schedule 1 / Schedule SE --
see docs/adr/0009 and the "Year-agnostic tax_year architecture +
Self-employment/W-2/Refund build-out" plan's Phase 6.

Scope (matches the plan's explicit "model the common path, defer the rest"
approach, same as hsa_worksheet_bridge.py / schedule_1a_bridge.py):

  MODELED:
    * Part I income, lines 1-7 (all straightforward arithmetic on real
      pure-input lines except line 9, see below).
    * Part II expenses, lines 8-27b, then line 28 (total), 29 (tentative
      profit/loss), 31 (net profit/loss).
    * Line 9 (car/truck expenses) is NOT asked as a raw dollar amount --
      the taxpayer enters business miles (line 44a, a real XSD field under
      Part IV) and this bridge multiplies by the 2025 standard mileage
      rate (already seeded in tax_constants -- see
      scripts/seed_tax_constants.py's "mileage" key), per the 2025
      Instructions for Schedule C (i1040sc), Line 9 / What's New: "For
      2025, the standard mileage rate for the cost of operating your car
      for business use is 70 cents per mile."

  DEFERRED (explicit constant-$0 "not modeled", never silent):
    * Part III Cost of Goods Sold / inventory (lines 33-42) -- line 42
      itself is set to a constant $0 rather than asked, since without Part
      III there is no grounded way to derive it.
    * Line 30, home office deduction (Form 8829 / simplified method).
    * Part IV vehicle mileage detail beyond line 44a itself, Part V other-
      expense itemization detail, lines 32a/32b at-risk boxes (loss-only,
      not relevant to the profit path this pilot models).

Two lines genuinely have NO XSD element of their own (grep-confirmed
absent from IRS1040ScheduleC.xsd -- same "form prints an arithmetic step
the e-file schema doesn't separately transmit" pattern already documented
in form1040_income_bridge.py for Form 1040 lines 1z/9/11a/14/15):
  * Line 4 ("Cost of goods sold (from line 42)") -- hand-created here as a
    carryover of the real `form_1040sc_line_42` element.
  * Line 27b ("Other expenses (from line 48)") -- hand-created here as a
    carryover of the real `form_1040sc_line_48` element (Part V's own
    total, which IS a real XSD element and stays a pure-input lump-sum
    question per the plan -- "ask Line 27a/48 as one lump sum instead" of
    itemizing Part V).

Verbatim quotes below were extracted directly from our stored copy of
f1040sc.pdf via PyMuPDF (same technique as hsa_worksheet_bridge.py):

    1   Gross receipts or sales. ...
    2   Returns and allowances
    3   Subtract line 2 from line 1
    4   Cost of goods sold (from line 42)
    5   Gross profit. Subtract line 4 from line 3
    6   Other income, including federal and state gasoline or fuel tax
        credit or refund (see instructions)
    7   Gross income. Add lines 5 and 6
    27b Other expenses (from line 48)
    28  Total expenses before expenses for business use of home. Add
        lines 8 through 27b
    29  Tentative profit or (loss). Subtract line 28 from line 7
    31  Net profit or (loss). Subtract line 30 from line 29.
        * If a profit, enter on both Schedule 1 (Form 1040), line 3, and
          on Schedule SE, line 2.

Net profit (line 31) is the connection point onward, verbatim per the
line 31 instruction: it feeds BOTH `form_1040s1_line_3` (Business income
or loss) and `form_1040sse_line_2` (Schedule SE, Part I) -- see
schedule_se_bridge.py for the Schedule SE side of this fan-out.

Idempotent: re-running deletes and rewrites every rule/edge this module
owns first (same pattern as every other hand-authored bridge in this
package). Re-running `synthesize --form 1040sc` afterward will delete
these rules and NOT recreate them (no KnowledgePacket ties these lines'
pure arithmetic together) -- re-run this bridge again if that happens.
"""
from __future__ import annotations

import structlog
from sqlalchemy import select

from db.models import CalcRule, CanonicalField, DependencyEdge, Document, HumanReviewItem, RuleStatusTransition
from db.session import get_session

log = structlog.get_logger(__name__)

# 2025 standard mileage rate, 70 cents/mile -- scripts/seed_tax_constants.py's
# tax_constants["mileage"]["standard_mileage_rate"]. Hardcoded here (not a
# runtime lookup) same as every other hand-authored bridge's formula
# constants in this codebase (e.g. schedule_1a_bridge.py's $1,000/$6,000
# figures) -- the tax_constants table is the cited source of truth this
# value was copied from, not a live dependency of the calc rule itself.
_MILEAGE_RATE_2025 = 0.70

# New canonical fields this bridge hand-creates (field_name, section,
# data_type, description, carryover source).
_NEW_FIELDS: list[tuple[str, str, str, str, str]] = [
    (
        "form_1040sc_line_4",
        "Part I - Income",
        "USAmountType",
        "Cost of goods sold (from line 42) — carries forward Part III's total (line 42). Hand-"
        "created: absent from IRS1040ScheduleC.xsd (no dedicated e-file element for this pure "
        "form-arithmetic redisplay line) — see module docstring.",
        "form_1040sc_line_42",
    ),
    (
        "form_1040sc_line_27b",
        "Part II - Expenses",
        "USAmountType",
        "Other expenses (from line 48) — carries forward Part V's total (line 48). Hand-created: "
        "absent from IRS1040ScheduleC.xsd (no dedicated e-file element for this pure form-"
        "arithmetic redisplay line) — see module docstring.",
        "form_1040sc_line_48",
    ),
]

_EXPENSE_LINES = [
    "form_1040sc_line_8", "form_1040sc_line_9", "form_1040sc_line_10", "form_1040sc_line_11",
    "form_1040sc_line_12", "form_1040sc_line_13", "form_1040sc_line_14", "form_1040sc_line_15",
    "form_1040sc_line_16a", "form_1040sc_line_16b", "form_1040sc_line_17", "form_1040sc_line_18",
    "form_1040sc_line_19", "form_1040sc_line_20a", "form_1040sc_line_20b", "form_1040sc_line_21",
    "form_1040sc_line_22", "form_1040sc_line_23", "form_1040sc_line_24a", "form_1040sc_line_24b",
    "form_1040sc_line_25", "form_1040sc_line_26", "form_1040sc_line_27a", "form_1040sc_line_27b",
]

# rule_id -> (formula, quote, formula_confidence, note)
_RULES: list[tuple[str, dict, str, float, str | None]] = [
    (
        "form_1040sc_line_3",
        {"type": "subtract", "operand_names": ["form_1040sc_line_1", "form_1040sc_line_2"]},
        "Subtract line 2 from line 1",
        0.95,
        None,
    ),
    (
        "form_1040sc_line_4",
        {"type": "carryover", "operand_names": ["form_1040sc_line_42"]},
        "Cost of goods sold (from line 42)",
        0.95,
        "See module docstring: hand-created field, no XSD element of its own.",
    ),
    (
        "form_1040sc_line_42",
        {"type": "sum", "operand_names": [], "constant": 0},
        "Part III Cost of Goods Sold / inventory not modeled this round -- explicit constant $0, "
        "same pattern as line 30's home office deduction.",
        1.0,
        "Deferred scope -- see module docstring.",
    ),
    (
        "form_1040sc_line_5",
        {"type": "subtract", "operand_names": ["form_1040sc_line_3", "form_1040sc_line_4"]},
        "Gross profit. Subtract line 4 from line 3",
        0.95,
        None,
    ),
    (
        "form_1040sc_line_7",
        {"type": "sum", "operand_names": ["form_1040sc_line_5", "form_1040sc_line_6"]},
        "Gross income. Add lines 5 and 6",
        0.95,
        None,
    ),
    (
        "form_1040sc_line_9",
        {"type": "multiply", "operand_names": ["form_1040sc_line_44a"], "constant": _MILEAGE_RATE_2025},
        "You can deduct the actual expenses of operating your car or truck or take the standard "
        "mileage rate. ... For 2025, the standard mileage rate for the cost of operating your car "
        "for business use is 70 cents per mile.",
        0.9,
        "Taxpayer enters business miles (line 44a) instead of a raw dollar amount -- see module "
        "docstring.",
    ),
    (
        "form_1040sc_line_27b",
        {"type": "carryover", "operand_names": ["form_1040sc_line_48"]},
        "Other expenses (from line 48)",
        0.95,
        "See module docstring: hand-created field, no XSD element of its own.",
    ),
    (
        "form_1040sc_line_28",
        {"type": "sum", "operand_names": _EXPENSE_LINES},
        "Total expenses before expenses for business use of home. Add lines 8 through 27b",
        0.95,
        None,
    ),
    (
        "form_1040sc_line_29",
        {"type": "subtract", "operand_names": ["form_1040sc_line_7", "form_1040sc_line_28"]},
        "Tentative profit or (loss). Subtract line 28 from line 7",
        0.95,
        None,
    ),
    (
        "form_1040sc_line_30",
        {"type": "sum", "operand_names": [], "constant": 0},
        "Expenses for business use of your home ... See instructions. -- home office deduction "
        "(Form 8829 / simplified method) not modeled this round, explicit constant $0.",
        1.0,
        "Deferred scope -- see module docstring.",
    ),
    (
        "form_1040sc_line_31",
        {"type": "subtract", "operand_names": ["form_1040sc_line_29", "form_1040sc_line_30"]},
        "Net profit or (loss). Subtract line 30 from line 29. If a profit, enter on both Schedule 1 "
        "(Form 1040), line 3, and on Schedule SE, line 2.",
        0.95,
        None,
    ),
]


def run_schedule_c_bridge(tax_year: int = 2025) -> None:
    with get_session() as session:
        pdf_doc = session.execute(
            select(Document).where(Document.form_number == "1040sc", Document.doc_type == "form")
        ).scalars().first()
        if pdf_doc is None:
            print("schedule c bridge: no catalogued f1040sc.pdf 'form' document -- run discover --form 1040sc first")
            return

        fields_by_name = {
            f.field_name: f
            for f in session.execute(
                select(CanonicalField).where(
                    CanonicalField.field_name.like("form_1040sc_line_%"), CanonicalField.tax_year == tax_year
                )
            ).scalars().all()
        }

        for field_name, section, data_type, description, _source in _NEW_FIELDS:
            existing = fields_by_name.get(field_name)
            if existing is None:
                existing = CanonicalField(
                    field_name=field_name,
                    section=section,
                    data_type=data_type,
                    cardinality="single",
                    instance_dimension=None,
                    source_xsd_element=None,
                    source_form_line=field_name.rsplit("_", 1)[-1],
                    description=description,
                    tax_year=tax_year,
                )
                session.add(existing)
                session.flush()
                log.info("schedule_c_bridge.created_canonical_field", field_name=field_name)
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
                    "schedule_c_bridge.missing_field",
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

    print(f"schedule c bridge complete: {created} calc rules created, {skipped} skipped (missing field)")
