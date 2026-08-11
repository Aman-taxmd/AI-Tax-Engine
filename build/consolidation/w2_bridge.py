"""Hand-specified W-2 multi-instance wage/withholding intake (ADR 0012).

Intake field metadata is grounded via w2_synthesized_link_bridge after
`synthesize --form w2`. This module writes sum_instances cross-form calc rules
only — deterministic_parse evidence, status=validated.
"""
from __future__ import annotations

import structlog
from sqlalchemy import select

from build.consolidation.evidence_helpers import upsert_deterministic_evidence
from build.consolidation.w2_synthesized_link_bridge import run_w2_synthesized_link_bridge

from db.models import CalcRule, CanonicalField, DependencyEdge, Document, HumanReviewItem, RuleStatusTransition
from db.session import get_session

log = structlog.get_logger(__name__)

# (field_name, description, data_type) -- all cardinality="multi_instance",
# instance_dimension="w2". Order matches the real W-2's box order.
_W2_INTAKE_FIELDS: list[tuple[str, str, str]] = [
    (
        "intake_w2_box1_wages",
        "W-2 Box 1 Wages, tips, other compensation (per employer) \u2014 taxpayer intake list, one "
        "entry per Form W-2 received. Hand-authored (see this module's docstring): there is no "
        "single IRS line for 'list of all your W-2s', only the already-summed total on Form 1040, "
        "line 1a.",
        "USAmountType",
    ),
    (
        "intake_w2_box2_fed_withholding",
        "W-2 Box 2 Federal income tax withheld (per employer) \u2014 taxpayer intake list. Hand-"
        "authored; summed into Form 1040, line 25a (\"Federal income tax withheld from Form(s) "
        "W-2\"). Per the 2025 General Instructions for Forms W-2 and W-3: \"Show the total federal "
        "income tax withheld from the employee's wages for the year.\"",
        "USAmountType",
    ),
    (
        "intake_w2_box3_ss_wages",
        "W-2 Box 3 Social security wages (per employer) \u2014 taxpayer intake list. Hand-authored; "
        "consumed directly by Schedule SE, line 8a (not summed into its own Form 1040/Schedule 1/2 "
        "destination line here) so a taxpayer with both W-2 and self-employment income in the same "
        "year isn't double-charged Social Security tax past the wage-base cap. Per the 2025 General "
        "Instructions: \"Show the total wages paid ... subject to employee social security tax.\"",
        "USAmountType",
    ),
    (
        "intake_w2_box5_medicare_wages",
        "W-2 Box 5 Medicare wages and tips (per employer) \u2014 taxpayer intake list. Hand-authored; "
        "captured and displayed only, not yet wired to any calc rule (only matters once Additional "
        "Medicare Tax / Form 8959 is in scope). Per the 2025 General Instructions: \"Enter the total "
        "Medicare wages and tips in box 5.\"",
        "USAmountType",
    ),
    (
        "intake_w2_box12w_hsa_employer_contrib",
        "W-2 Box 12 Code W \u2014 Employer contributions to a health savings account (HSA) (per "
        "employer) \u2014 taxpayer intake list. Hand-authored; summed into Form 8889, line 9, "
        "REPLACING that line's former manual taxpayer question (this pilot's real legal source for "
        "that number). Per the 2025 General Instructions, Code W: \"Show any employer contributions "
        "(including amounts the employee elected to contribute using a section 125 (cafeteria) plan) "
        "to an HSA.\"",
        "USAmountType",
    ),
    (
        "intake_w2_employer_name",
        "W-2 Box c Employer's name (per employer) \u2014 taxpayer intake list. Presentation-only: "
        "printed on the \"realistic form view\" fw2.pdf render (build/consolidation/w2_pdf_bridge.py) "
        "for the taxpayer's own reference; never participates in any tax calculation.",
        "TextType",
    ),
    (
        "intake_w2_box12_code_w_label",
        "W-2 Box 12a Code letter, hand-set to the literal string 'W' whenever that row's "
        "intake_w2_box12w_hsa_employer_contrib amount is nonzero (blank otherwise) \u2014 taxpayer "
        "intake list. Presentation-only: exists solely so the \"realistic form view\" can print the "
        "'W' code letter next to its dollar amount on the real Box 12a AcroForm widget pair (see "
        "build/consolidation/w2_pdf_bridge.py); never participates in any tax calculation.",
        "TextType",
    ),
]

_BOX1_FIELD_NAME = "intake_w2_box1_wages"
_BOX2_FIELD_NAME = "intake_w2_box2_fed_withholding"
_BOX12W_FIELD_NAME = "intake_w2_box12w_hsa_employer_contrib"

# (rule_id, source multi-instance field, IRS quote off the destination line)
_SUM_RULES: list[tuple[str, str, str]] = [
    (
        "form_1040_line_1a",
        _BOX1_FIELD_NAME,
        "Total amount from Form(s) W-2, box 1 (see instructions)",
    ),
    (
        "form_1040_line_25a",
        _BOX2_FIELD_NAME,
        "Federal income tax withheld from Form(s) W-2",
    ),
    (
        "adjustments.hsa_employer_contribution_amount",  # Form 8889 line 9, renamed -- see docs/adr/0010
        _BOX12W_FIELD_NAME,
        "Employer contributions made to your HSAs for 2025",
    ),
]


def run_w2_bridge(tax_year: int = 2025) -> None:
    run_w2_synthesized_link_bridge(tax_year)
    with get_session() as session:
        pdf_doc = session.execute(
            select(Document).where(Document.form_number == "1040", Document.doc_type == "form")
        ).scalars().first()
        if pdf_doc is None:
            print("w2 bridge: no catalogued f1040.pdf 'form' document -- run discover --form 1040 first")
            return

        intake_fields_by_name: dict[str, CanonicalField] = {}
        for field_name, description, data_type in _W2_INTAKE_FIELDS:
            existing = session.execute(
                select(CanonicalField).where(
                    CanonicalField.field_name == field_name, CanonicalField.tax_year == tax_year
                )
            ).scalars().first()
            if existing is None:
                existing = CanonicalField(
                    field_name=field_name,
                    section="Income",
                    data_type=data_type,
                    cardinality="multi_instance",
                    instance_dimension="w2",
                    source_xsd_element=None,
                    source_form_line=None,
                    description=description,
                    tax_year=tax_year,
                )
                session.add(existing)
                session.flush()
                log.info("w2_bridge.created_canonical_field", field_name=field_name)
            intake_fields_by_name[field_name] = existing

        rules_written = 0
        for rule_id, source_field_name, quote in _SUM_RULES:
            destination_field = session.execute(
                select(CanonicalField).where(
                    CanonicalField.field_name == rule_id, CanonicalField.tax_year == tax_year
                )
            ).scalars().first()
            if destination_field is None:
                print(f"w2 bridge: canonical field {rule_id} not found -- run synthesize first, skipping")
                continue

            old_rule = session.execute(
                select(CalcRule).where(CalcRule.rule_id == rule_id, CalcRule.tax_year == tax_year)
            ).scalars().first()
            if old_rule is not None:
                for item in session.execute(
                    select(HumanReviewItem).where(
                        HumanReviewItem.related_type == "calc_rule",
                        HumanReviewItem.related_id == old_rule.id,
                        HumanReviewItem.status == "pending",
                    )
                ).scalars().all():
                    session.delete(item)
                for transition in session.execute(
                    select(RuleStatusTransition).where(RuleStatusTransition.rule_id == old_rule.id)
                ).scalars().all():
                    session.delete(transition)
                session.flush()
                session.delete(old_rule)
            for edge in session.execute(
                select(DependencyEdge).where(
                    DependencyEdge.field_a == rule_id, DependencyEdge.depends_on_type == "field"
                )
            ).scalars().all():
                session.delete(edge)
            session.flush()

            source_field = intake_fields_by_name[source_field_name]
            evidence_id = upsert_deterministic_evidence(
                quote=quote,
                document_version_id=pdf_doc.id,
                note=f"w2_bridge sum_instances -> {rule_id}",
            )
            session.add(
                CalcRule(
                    rule_id=rule_id,
                    status="validated",
                    canonical_field_id=destination_field.id,
                    formula={"type": "sum_instances", "operand_names": [source_field_name]},
                    operands=[{
                        "name": source_field_name,
                        "source": f"canonical_field:{source_field_name}",
                        "description": source_field.description,
                    }],
                    carryover_target=None,
                    irs_reference={
                        "document_id": pdf_doc.id,
                        "section_anchor": None,
                        "quote": quote,
                        "computation_source": "sum_instances",
                        "evidence_bundle_id": evidence_id,
                    },
                    confidence_breakdown={
                        "extraction_confidence": 1.0,
                        "reference_resolution_confidence": 1.0,
                        "formula_confidence": 1.0,
                        "note": f"Sums every W-2 row for {source_field_name}.",
                    },
                    tax_year=tax_year,
                )
            )
            session.add(DependencyEdge(field_a=rule_id, depends_on_type="field", depends_on_ref=source_field_name))
            rules_written += 1

        session.commit()

    print(
        f"w2 bridge complete: {len(_W2_INTAKE_FIELDS)} canonical field(s) "
        f"({', '.join(f[0] for f in _W2_INTAKE_FIELDS)}) + {rules_written} calc rule(s) "
        f"({', '.join(r[0] for r in _SUM_RULES)})"
    )
