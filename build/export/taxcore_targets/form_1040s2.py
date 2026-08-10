"""Schedule 2 (Form 1040) — TaxCore export projection.

Pilot: Part II other taxes — SE tax passthrough (L4), SS/Medicare add-on
total (L7), HSA additional taxes (L17c/17d from 8889), section-17 total
(L18), and line 21 total feeding Form 1040 line 23.
"""
from __future__ import annotations

from build.export.taxcore_targets.spec import FormSpec

_WS = "schedule_2_total_additional_taxes_worksheet"

_FIELD_NAME_MAP: dict[str, str] = {
    "form_1040s2_line_4": f"{_WS}.self_employment_tax_amount",
    "form_1040s2_line_5": "taxes.additional_social_security_tax_amount",
    "form_1040s2_line_6": "taxes.additional_medicare_tax_on_wages_amount",
    "form_1040s2_line_7": f"{_WS}.unreported_social_security_medicare_tax_amount",
    "form_1040s2_line_8": f"{_WS}.alternative_minimum_tax_amount",
    "form_1040s2_line_9": f"{_WS}.excess_advance_premium_tax_credit_repayment_amount",
    "form_1040s2_line_11": f"{_WS}.additional_tax_on_iras_other_qualified_plans_amount",
    "form_1040s2_line_12": f"{_WS}.household_employment_taxes_amount",
    "form_1040s2_line_13": f"{_WS}.repayment_first_time_homebuyer_credit_amount",
    "form_1040s2_line_14": f"{_WS}.additional_medicare_tax_amount",
    "form_1040s2_line_15": f"{_WS}.net_investment_income_tax_amount",
    "form_1040s2_line_16": f"{_WS}.section_965_net_tax_liability_amount",
    "form_1040s2_line_17a": "taxes.other_tax_amount",
    "form_1040s2_line_17b": "taxes.other_tax_amount",
    "form_1040s2_line_17c": f"{_WS}.hsa_distribution_additional_tax_amount",
    "form_1040s2_line_17d": f"{_WS}.hdhp_coverage_additional_tax_amount",
    "form_1040s2_line_18": f"{_WS}.other_additional_taxes_amount",
    "form_1040s2_line_19": f"{_WS}.section_965_installment_amount",
    "form_1040s2_line_21": f"{_WS}.total_additional_taxes_part_ii_amount",
}

_CROSS_FORM_FIELD_MAP: dict[str, str] = {
    "form_1040sse_line_12": "taxes.self_employment_tax_amount",
    "taxes.hsa_distribution_additional_percent_tax_amount": (
        "taxes.hsa_distribution_additional_percent_tax_amount"
    ),
    "taxes.hdhp_coverage_additional_tax_amount": "taxes.hdhp_coverage_additional_tax_amount",
}

_FORMULA_OVERRIDES: dict[str, dict] = {
    "form_1040s2_line_4": {
        "type": "sum",
        "operands": [
            {
                "type": "field",
                "field": "taxes.self_employment_tax_amount",
                "sign": "+",
                "default_value": 0,
            }
        ],
        "rounding": "nearest",
        "decimal_places": 0,
    },
    "form_1040s2_line_17c": {
        "type": "sum",
        "operands": [
            {
                "type": "field",
                "field": "taxes.hsa_distribution_additional_percent_tax_amount",
                "sign": "+",
                "default_value": 0,
            }
        ],
        "rounding": "nearest",
        "decimal_places": 0,
    },
    "form_1040s2_line_17d": {
        "type": "sum",
        "operands": [
            {
                "type": "field",
                "field": "taxes.hdhp_coverage_additional_tax_amount",
                "sign": "+",
                "default_value": 0,
            }
        ],
        "rounding": "nearest",
        "decimal_places": 0,
    },
}


def _proj(
    taxcore_rule_id: str,
    output_leaf: str,
    canonical_target: str | None,
) -> dict[str, str]:
    out: dict[str, str] = {
        "taxcore_rule_id": taxcore_rule_id,
        "worksheet_key": _WS,
        "output_leaf": output_leaf,
    }
    if canonical_target:
        out["canonical_target"] = canonical_target
    return out


_RULE_PROJECTIONS: dict[str, dict[str, str]] = {
    "form_1040s2_line_4": _proj(
        "calc_schedule_2_total_additional_taxes_worksheet_self_employment_tax_amount",
        "self_employment_tax_amount",
        "taxes.self_employment_tax_amount",
    ),
    "form_1040s2_line_7": _proj(
        "calc_schedule_2_total_additional_taxes_worksheet_unreported_social_security_medicare_tax_amount",
        "unreported_social_security_medicare_tax_amount",
        None,
    ),
    "form_1040s2_line_21": _proj(
        "calc_schedule_2_total_additional_taxes_worksheet_total_additional_taxes_part_ii_amount",
        "total_additional_taxes_part_ii_amount",
        None,
    ),
}

_WORKSHEET_FIELDS: dict[str, str] = {
    "self_employment_tax_amount": "currency",
    "unreported_social_security_medicare_tax_amount": "currency",
    "other_additional_taxes_amount": "currency",
    "total_additional_taxes_part_ii_amount": "currency",
    "final_output_field": "taxes.total_other_taxes_amount",
}

_CALC_RULES_ORDER = [
    "calc_schedule_2_total_additional_taxes_worksheet_self_employment_tax_amount",
    "calc_schedule_2_total_additional_taxes_worksheet_unreported_social_security_medicare_tax_amount",
    "calc_schedule_2_total_additional_taxes_worksheet_total_additional_taxes_part_ii_amount",
]

SPEC_1040S2 = FormSpec(
    form="1040s2",
    form_type="irs_1040_schedule_2",
    display_label="Schedule 2 (Form 1040)",
    module_id="schedule_2",
    worksheet_key=_WS,
    worksheet_fields=_WORKSHEET_FIELDS,
    field_name_map=_FIELD_NAME_MAP,
    cross_form_field_map=_CROSS_FORM_FIELD_MAP,
    rule_projections=_RULE_PROJECTIONS,
    formula_overrides=_FORMULA_OVERRIDES,
    calculation_schema_merge_mode="upsert_worksheet_leaves",
    form_mapping_merge_mode="upsert_by_canonical_field",
    module_description=(
        "Schedule 2 pilot: Part II other taxes total (AI_TAX_ENGINE projection)."
    ),
    import_decision=(
        "REPLACE schedule_2 calc_rules for this pilot chain; MERGE form_mapping "
        "by canonical_field. Form 1040 line 23 carryover owned by 1040 package."
    ),
    canonical_inputs=[
        "taxes.additional_social_security_tax_amount",
        "taxes.additional_medicare_tax_on_wages_amount",
        "taxes.other_tax_amount",
    ],
    must_promote=[],
    form_view_promote=[f"{_WS}.total_additional_taxes_part_ii_amount"],
    output_mappings=[],
    calc_rules_order=_CALC_RULES_ORDER,
    canonical_schema_additions={
        "taxes": {
            "total_other_taxes_amount": "currency",
            "self_employment_tax_amount": "currency",
        },
    },
    metadata_overrides={
        "taxes.total_other_taxes_amount": {
            "computed_by": (
                "calc_schedule_2_total_additional_taxes_worksheet_total_additional_taxes_part_ii_amount"
            ),
            "notes": "1040 line 23 reads this worksheet total via 1040 export cross-form map.",
        },
    },
    retire_rule_id_prefixes=["calc_schedule_2_total_additional_taxes_worksheet_"],
    open_risks=[
        "Export projection only — DB/UI/goldens keep form_1040s2_line_* names.",
        "Line 21 sums pilot-modeled lines only; Part I AMT/NIIT etc. default $0 inputs.",
        "Lines 17c/17d mirror 8889-promoted HSA additional taxes.",
        "Form 1040 line 23 carryover not exported here (1040 package).",
    ],
    target_tree_extras={
        "field_name_map": _FIELD_NAME_MAP,
        "cross_form_field_map": _CROSS_FORM_FIELD_MAP,
    },
)
