"""Hand-authored bridge for Schedule 1 (Form 1040), Part I -- Additional
Income -- connecting Schedule C's net profit (Phase 6) into Schedule 1's
own total, and that total into Form 1040 line 8. See docs/adr/0009 and the
"Year-agnostic tax_year architecture + Self-employment/W-2/Refund
build-out" plan's Phase 6 ("Net profit (Line 31) is the connection point:
'If a profit, enter on both Schedule 1 (Form 1040), line 3, and on
Schedule SE, line 2.'").

Before this bridge, `form_1040_line_8` ("Additional income from Schedule
1, line 10") had no calc rule at all -- it was asked directly as a raw
taxpayer input, completely bypassing Schedule 1 and, transitively,
Schedule C. That meant a self-employed taxpayer's Schedule C profit never
actually reached Form 1040's total income/AGI/tax computation unless they
manually re-typed the same number into line 8 themselves. This bridge
wires the real chain instead: `form_1040sc_line_31` -> `form_1040s1_line_3`
-> `form_1040s1_line_10` -> `form_1040_line_8`.

Scope: Lines 4 ("Other gains or (losses)") and 7 ("Unemployment
compensation") ARE now included as real pure-input dollar lines
(form_1040s1_line_4 / form_1040s1_line_7) directly in the line 10 sum below
-- corrected by scripts/fix_line_collision_fields.py after discovering that
IRS1040Schedule1.xsd genuinely has a dollar element for each (OtherGainLossAmt
/ UnemploymentCompAmt); an earlier version of this module wrongly concluded
neither existed because IRS's own XSD reuses each printed line number across
several elements (checkboxes AND the amount), and the field synthesizer's
original "first element in file order wins" logic had silently resolved both
line numbers to their checkbox instead -- see
canonical_field_writer.py's `_resolve_line_number_collisions` for the general
fix. Line 7's XSD also carries a secondary RepaymentAmt sub-figure (for
unemployment compensation repaid in a prior year) which stays deferred/out of
scope as its own field (form_1040s1_line_7_repayment_amt) -- a genuine edge
case, not a repeat of the original bug.

Verbatim quotes below were extracted directly from our stored copy of
f1040s1.pdf via PyMuPDF:

    3   Business income or (loss). Attach Schedule C
    9   Total other income. Add lines 8a through 8z
    10  Combine lines 1 through 7 and 9. This is your additional income.
        Enter here and on Form 1040, 1040-SR, or 1040-NR, line 8

Idempotent: re-running deletes and rewrites every rule/edge this module
owns first. Re-running `synthesize --form 1040` or `synthesize --form
1040s1` afterward will delete the rules this module owns for THAT form
(form_1040_line_8, or form_1040s1_line_3/9/10 respectively) and NOT
recreate them -- re-run this bridge again if that happens.
"""
from __future__ import annotations

import structlog
from sqlalchemy import select

from db.models import CalcRule, CanonicalField, DependencyEdge, Document, HumanReviewItem, RuleStatusTransition
from db.session import get_session

log = structlog.get_logger(__name__)

_LINE_9_OPERANDS = [
    "form_1040s1_line_8a", "form_1040s1_line_8b", "form_1040s1_line_8c", "form_1040s1_line_8d",
    "form_1040s1_line_8e", "form_1040s1_line_8f", "form_1040s1_line_8g", "form_1040s1_line_8h",
    "form_1040s1_line_8i", "form_1040s1_line_8j", "form_1040s1_line_8k", "form_1040s1_line_8l",
    "form_1040s1_line_8m", "form_1040s1_line_8n", "form_1040s1_line_8o", "form_1040s1_line_8p",
    "form_1040s1_line_8q", "form_1040s1_line_8r", "form_1040s1_line_8s", "form_1040s1_line_8t",
    "form_1040s1_line_8u", "form_1040s1_line_8v", "form_1040s1_line_8z",
]

# rule_id -> (formula, quote, formula_confidence, note, pdf_form_number)
_RULES: list[tuple[str, dict, str, float, str | None, str]] = [
    (
        "form_1040s1_line_3",
        {"type": "carryover", "operand_names": ["form_1040sc_line_31"]},
        "Business income or (loss). Attach Schedule C",
        0.95,
        None,
        "1040s1",
    ),
    (
        "form_1040s1_line_9",
        {"type": "sum", "operand_names": _LINE_9_OPERANDS},
        "Total other income. Add lines 8a through 8z",
        0.95,
        None,
        "1040s1",
    ),
    (
        "form_1040s1_line_10",
        {
            "type": "sum",
            "operand_names": [
                "form_1040s1_line_1", "form_1040s1_line_2a", "form_1040s1_line_3", "form_1040s1_line_4",
                "form_1040s1_line_5", "form_1040s1_line_6", "form_1040s1_line_7", "form_1040s1_line_9",
            ],
        },
        "Combine lines 1 through 7 and 9. This is your additional income. Enter here and on Form "
        "1040, 1040-SR, or 1040-NR, line 8",
        0.9,
        "Lines 4 and 7 now included as real pure-input dollar lines -- see module docstring for the "
        "line-number-collision fix that unlocked them.",
        "1040s1",
    ),
    (
        "form_1040_line_8",
        {"type": "carryover", "operand_names": ["form_1040s1_line_10"]},
        "Additional income from Schedule 1, line 10",
        0.95,
        None,
        "1040",
    ),
]


def run_schedule1_income_bridge(tax_year: int = 2025) -> None:
    with get_session() as session:
        pdf_docs = {
            d.form_number: d
            for d in session.execute(
                select(Document).where(Document.form_number.in_(["1040s1", "1040"]), Document.doc_type == "form")
            ).scalars().all()
        }
        if "1040s1" not in pdf_docs or "1040" not in pdf_docs:
            print(
                "schedule1 income bridge: missing catalogued form PDF(s) for 1040s1/1040 -- run "
                "discover for both first"
            )
            return

        fields_by_name: dict[str, CanonicalField] = {
            f.field_name: f
            for f in session.execute(
                select(CanonicalField).where(
                    CanonicalField.field_name.like("form_1040s1_line_%"), CanonicalField.tax_year == tax_year
                )
            ).scalars().all()
        }
        cross_form_names = ["form_1040sc_line_31", "form_1040_line_8"]
        for f in session.execute(
            select(CanonicalField).where(
                CanonicalField.field_name.in_(cross_form_names), CanonicalField.tax_year == tax_year
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
                    "schedule1_income_bridge.missing_field",
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

    print(f"schedule1 income bridge complete: {created} calc rules created, {skipped} skipped (missing field)")
