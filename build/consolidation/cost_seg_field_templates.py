"""Cost segregation field templates — one row per logical field, not per activity instance.

Runtime binds templates to instances:
  cost_seg.{tax_activity_id}.{relative_field}

Build-time artifacts reference template_id, not taxpayer-created activity IDs.
"""
from __future__ import annotations

from dataclasses import dataclass
from typing import Any

INSTANCE_GROUP = "cost_seg_activity"


@dataclass(frozen=True)
class CostSegFieldTemplate:
    template_id: str
    instance_group: str | None
    relative_field: str
    source_form_number: str | None
    source_form_line: str | None
    section: str
    data_type: str
    source_xsd_element: str | None
    description: str
    projection: bool
    calc_rule_type: str | None = None
    calc_rule_operand_relative: str | None = None


def instance_field_name(tax_activity_id: str, relative_field: str) -> str:
    safe = tax_activity_id.replace(".", "_")
    return f"cost_seg.{safe}.{relative_field}"


def all_templates() -> list[CostSegFieldTemplate]:
    per_activity: list[tuple[str, str, str | None, str | None, str, str, bool, str | None, str | None]] = [
        ("cost_seg.depreciation.bonus_amount", "depreciation.bonus_amount", None, None, "Engine", "USAmountType", False, None, None),
        ("cost_seg.depreciation.macrs_amount", "depreciation.macrs_amount", None, None, "Engine", "USAmountType", False, None, None),
        ("cost_seg.depreciation.total_amount", "depreciation.total_amount", None, None, "Engine", "USAmountType", False, None, None),
        ("cost_seg.depreciation.calculation_status", "depreciation.calculation_status", None, None, "Engine", "StringType", False, None, None),
        ("cost_seg.form_4562.required", "form_4562.required", "4562", "header", "Form 4562", "BooleanType", True, None, None),
        ("cost_seg.form_4562.instance_status", "form_4562.instance_status", "4562", "header", "Form 4562", "StringType", True, None, None),
        ("cost_seg.form_4562.special_allowance_amount", "form_4562.special_allowance_amount", "4562", "14", "Part II", "USAmountType", True, "carryover", "depreciation.bonus_amount"),
        ("cost_seg.form_4562.macrs_5_year_amount", "form_4562.macrs_5_year_amount", "4562", "19", "Part III", "USAmountType", True, None, None),
        ("cost_seg.form_4562.macrs_7_year_amount", "form_4562.macrs_7_year_amount", "4562", "19", "Part III", "USAmountType", True, None, None),
        ("cost_seg.form_4562.macrs_15_year_amount", "form_4562.macrs_15_year_amount", "4562", "19", "Part III", "USAmountType", True, None, None),
        ("cost_seg.form_4562.residential_real_property_amount", "form_4562.residential_real_property_amount", "4562", "19", "Part III", "USAmountType", True, None, None),
        ("cost_seg.form_4562.nonresidential_real_property_amount", "form_4562.nonresidential_real_property_amount", "4562", "19", "Part III", "USAmountType", True, None, None),
        ("cost_seg.form_4562.total_depreciation_amount", "form_4562.total_depreciation_amount", "4562", "22", "Part IV", "USAmountType", True, "carryover", "depreciation.total_amount"),
        ("cost_seg.schedule_e.depreciation_expense", "schedule_e.depreciation_expense", "1040se", "18", "Part I Line 18", "USAmountType", True, "carryover", "depreciation.total_amount"),
        ("cost_seg.limitations.loss_after_basis_amount", "limitations.loss_after_basis_amount", None, None, "Limitations", "USAmountType", False, None, None),
        ("cost_seg.limitations.loss_after_at_risk_amount", "limitations.loss_after_at_risk_amount", None, None, "Limitations", "USAmountType", False, None, None),
        ("cost_seg.limitations.passive_allowed_loss_amount", "limitations.passive_allowed_loss_amount", None, None, "Limitations", "USAmountType", False, None, None),
        ("cost_seg.limitations.loss_after_excess_business_loss_amount", "limitations.loss_after_excess_business_loss_amount", None, None, "Limitations", "USAmountType", False, None, None),
    ]

    xsd_by_relative: dict[str, str] = {
        "form_4562.special_allowance_amount": "SpecialAllowanceAmt",
        "form_4562.total_depreciation_amount": "TotalDepreciationAmt",
        "schedule_e.depreciation_expense": "DepreciationExpenseAmt",
    }

    desc_by_relative: dict[str, str] = {
        "depreciation.bonus_amount": "Engine bonus depreciation for activity.",
        "depreciation.macrs_amount": "Engine MACRS depreciation for activity.",
        "depreciation.total_amount": "Authoritative total depreciation for activity.",
        "depreciation.calculation_status": "Activity depreciation calculation status.",
        "form_4562.required": "Whether Form 4562 is required for this activity.",
        "form_4562.instance_status": "Form 4562 instance status for activity.",
        "form_4562.special_allowance_amount": "Form 4562 Part II special allowance projection.",
        "form_4562.macrs_5_year_amount": "Form 4562 Part III 5-year property.",
        "form_4562.macrs_7_year_amount": "Form 4562 Part III 7-year property.",
        "form_4562.macrs_15_year_amount": "Form 4562 Part III 15-year property.",
        "form_4562.residential_real_property_amount": "Form 4562 Part III residential real property.",
        "form_4562.nonresidential_real_property_amount": "Form 4562 Part III nonresidential real property.",
        "form_4562.total_depreciation_amount": "Form 4562 Part IV total projection.",
        "schedule_e.depreciation_expense": "Schedule E Line 18 depreciation projection.",
        "limitations.loss_after_basis_amount": "Loss after basis limitation.",
        "limitations.loss_after_at_risk_amount": "Loss after at-risk limitation.",
        "limitations.passive_allowed_loss_amount": "Passive allowed loss (simplified preview).",
        "limitations.loss_after_excess_business_loss_amount": "Loss after excess business loss limitation.",
    }

    templates: list[CostSegFieldTemplate] = []
    for template_id, relative_field, source_form, source_line, section, data_type, projection, calc_type, calc_operand in per_activity:
        templates.append(
            CostSegFieldTemplate(
                template_id=template_id,
                instance_group=INSTANCE_GROUP,
                relative_field=relative_field,
                source_form_number=source_form,
                source_form_line=source_line,
                section=section,
                data_type=data_type,
                source_xsd_element=xsd_by_relative.get(relative_field),
                description=desc_by_relative[relative_field],
                projection=projection,
                calc_rule_type=calc_type,
                calc_rule_operand_relative=calc_operand,
            )
        )

    summary_specs = [
        ("cost_seg.depreciation_summary.bonus_amount", "taxpayer.depreciation_summary.bonus_amount", "Taxpayer-level bonus depreciation summary (analytics only).", "USAmountType"),
        ("cost_seg.depreciation_summary.macrs_amount", "taxpayer.depreciation_summary.macrs_amount", "Taxpayer-level MACRS summary (analytics only).", "USAmountType"),
        ("cost_seg.depreciation_summary.total_amount", "taxpayer.depreciation_summary.total_amount", "Taxpayer-level total depreciation summary (analytics only).", "USAmountType"),
        ("cost_seg.depreciation_summary.summary_status", "taxpayer.depreciation_summary.summary_status", "Summary rollup status: complete | incomplete | empty.", "StringType"),
        ("cost_seg.depreciation_summary.blocked_activity_count", "taxpayer.depreciation_summary.blocked_activity_count", "Count of blocked/unsupported activities.", "IntegerType"),
        ("cost_seg.depreciation_summary.supported_activity_count", "taxpayer.depreciation_summary.supported_activity_count", "Count of supported activities.", "IntegerType"),
    ]
    for template_id, flat_name, desc, dtype in summary_specs:
        templates.append(
            CostSegFieldTemplate(
                template_id=template_id,
                instance_group=None,
                relative_field=flat_name,
                source_form_number=None,
                source_form_line=None,
                section="Analytics",
                data_type=dtype,
                source_xsd_element=None,
                description=desc,
                projection=False,
            )
        )
    return templates


def templates_for_form(form: str) -> list[CostSegFieldTemplate]:
    return [t for t in all_templates() if t.source_form_number == form]


def template_to_dict(t: CostSegFieldTemplate) -> dict[str, Any]:
    return {
        "template_id": t.template_id,
        "instance_group": t.instance_group,
        "relative_field": t.relative_field,
        "source_form_number": t.source_form_number,
        "source_form_line": t.source_form_line,
        "section": t.section,
        "data_type": t.data_type,
        "source_xsd_element": t.source_xsd_element,
        "description": t.description,
        "projection": t.projection,
        "calc_rule_type": t.calc_rule_type,
        "calc_rule_operand_relative": t.calc_rule_operand_relative,
        "runtime_binding_pattern": (
            f"cost_seg.{{tax_activity_id}}.{t.relative_field}" if t.instance_group else t.relative_field
        ),
    }
