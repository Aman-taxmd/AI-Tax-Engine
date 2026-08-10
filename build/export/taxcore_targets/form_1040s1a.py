"""Schedule 1-A (Form 1040) — TaxCore export projection.

Pilot scope: tips deduction chain (Part II) + enhanced senior deduction (Part V)
+ MAGI setup (Part I lines 2e/3). Overtime (Part III) and car loan (Part IV) deferred.

Line 1 (AGI carryover) is skipped — 1040 module owns AGI.
Line 38 sums tips + senior only (lines 21/30 omitted this round).
"""
from __future__ import annotations

from build.export.taxcore_targets.spec import FormSpec

_INCOME = "income_worksheet"
_ADJ = "adjustments_worksheet"
_CREDITS = "credits_worksheet"
_DED = "deductions_worksheet"
_MAGI = "aotc_worksheet"

_FIELD_NAME_MAP: dict[str, str] = {
    "form_1040s1a_line_1": "income_calculated.adjusted_gross_income_amount",
    "form_1040s1a_line_2a": "adjustments.excluded_puerto_rico_income_amount",
    "form_1040s1a_line_2b": "adjustments.foreign_earned_income_exclusion_amount",
    "form_1040s1a_line_2c": "adjustments.housing_deduction_amount",
    "form_1040s1a_line_2d": "adjustments.gross_income_exclusion_amount",
    "form_1040s1a_line_2e": "adjustments.total_exclusions_deduction_amount",
    "form_1040s1a_line_3": "income_calculated.modified_adjusted_gross_income_amount",
    "form_1040s1a_line_4a": "income.qualified_tips_wages_amount",
    "form_1040s1a_line_4b": "income.qualified_tips_form_4137_amount",
    "form_1040s1a_line_4c": "income.qualified_tips_employee_amount",
    "form_1040s1a_line_5": "income.qualified_tips_trade_or_business_amount",
    "form_1040s1a_line_6": "income.total_qualified_tips_amount",
    "form_1040s1a_line_7": "adjustments.smaller_tips_or_max_ded_amount",
    "form_1040s1a_line_9": "income.tips_filing_status_threshold_amount",
    "form_1040s1a_line_10": "adjustments.tips_magi_less_threshold_amount",
    "form_1040s1a_line_11": "credits.tips_magi_less_threshold_divide_number",
    "form_1040s1a_line_12": "credits.tips_magi_less_threshold_reduction_amount",
    "form_1040s1a_line_13": "adjustments.qualified_tips_deduction_amount",
    "form_1040s1a_line_32": "deductions.enhanced_senior_deduction_filing_status_threshold_amount",
    "form_1040s1a_line_33": "deductions.enhanced_senior_deduction_magi_less_threshold_amount",
    "form_1040s1a_line_34": "deductions.enhanced_senior_deduction_magi_reduction_amount",
    "form_1040s1a_line_35": "adjustments.specified_dollar_less_threshold_reduced_amount",
    "form_1040s1a_line_36a": "deductions.primary_enhanced_senior_deduction_amount",
    "form_1040s1a_line_36b": "deductions.spouse_enhanced_senior_deduction_amount",
    "form_1040s1a_line_37": "deductions.enhanced_senior_deduction_amount",
    "form_1040s1a_line_38": "adjustments.total_additional_deductions_amount",
    "form_1040s1a_senior_eligible_flag": "taxpayer.is_age_65_or_older",
}

_CROSS_FORM_FIELD_MAP: dict[str, str] = {
    "form_1040_line_11a": "income_calculated.adjusted_gross_income_amount",
}


def _proj(
    taxcore_rule_id: str,
    worksheet_key: str,
    output_leaf: str,
    canonical_target: str | None,
) -> dict[str, str]:
    out: dict[str, str] = {
        "taxcore_rule_id": taxcore_rule_id,
        "worksheet_key": worksheet_key,
        "output_leaf": output_leaf,
    }
    if canonical_target:
        out["canonical_target"] = canonical_target
    return out


_RULE_PROJECTIONS: dict[str, dict[str, str]] = {
    "form_1040s1a_line_2e": _proj(
        "calc_adjustments_worksheet_total_foreign_income_exclusions_amount",
        _ADJ,
        "total_foreign_income_exclusions_amount",
        "adjustments.total_exclusions_deduction_amount",
    ),
    "form_1040s1a_line_3": _proj(
        "calc_scenario_aotc_modified_agi_amount",
        _MAGI,
        "modified_agi_amount",
        "income_calculated.modified_adjusted_gross_income_amount",
    ),
    "form_1040s1a_line_4c": _proj(
        "calc_income_worksheet_qualified_tips_employee_amount",
        _INCOME,
        "qualified_tips_employee_amount",
        "income.qualified_tips_employee_amount",
    ),
    "form_1040s1a_line_6": _proj(
        "calc_income_worksheet_total_qualified_tips_amount",
        _INCOME,
        "total_qualified_tips_amount",
        "income.total_qualified_tips_amount",
    ),
    "form_1040s1a_line_7": _proj(
        "calc_adjustments_worksheet_smaller_tips_or_max_ded_amount",
        _ADJ,
        "smaller_tips_or_max_ded_amount",
        "adjustments.smaller_tips_or_max_ded_amount",
    ),
    "form_1040s1a_line_10": _proj(
        "calc_adjustments_worksheet_tips_magi_less_threshold_amount",
        _ADJ,
        "tips_magi_less_threshold_amount",
        "adjustments.tips_magi_less_threshold_amount",
    ),
    "form_1040s1a_line_11": _proj(
        "calc_credits_worksheet_tips_magi_less_threshold_divide_number",
        _CREDITS,
        "tips_magi_less_threshold_divide_number",
        "credits.tips_magi_less_threshold_divide_number",
    ),
    "form_1040s1a_line_12": _proj(
        "calc_credits_worksheet_tips_magi_less_threshold_reduction_amount",
        _CREDITS,
        "tips_magi_less_threshold_reduction_amount",
        "credits.tips_magi_less_threshold_reduction_amount",
    ),
    "form_1040s1a_line_13": _proj(
        "calc_adjustments_worksheet_qualified_tips_deduction_amount",
        _ADJ,
        "qualified_tips_deduction_amount",
        "adjustments.qualified_tips_deduction_amount",
    ),
    "form_1040s1a_line_33": _proj(
        "calc_deductions_worksheet_enhanced_senior_deduction_magi_less_threshold_amount",
        _DED,
        "enhanced_senior_deduction_magi_less_threshold_amount",
        "deductions.enhanced_senior_deduction_magi_less_threshold_amount",
    ),
    "form_1040s1a_line_34": _proj(
        "calc_deductions_worksheet_enhanced_senior_deduction_magi_reduction_amount",
        _DED,
        "enhanced_senior_deduction_magi_reduction_amount",
        "deductions.enhanced_senior_deduction_magi_reduction_amount",
    ),
    "form_1040s1a_line_35": _proj(
        "calc_adjustments_worksheet_specified_dollar_less_threshold_reduced_amount",
        _ADJ,
        "specified_dollar_less_threshold_reduced_amount",
        "adjustments.specified_dollar_less_threshold_reduced_amount",
    ),
    "form_1040s1a_line_36a": _proj(
        "calc_deductions_worksheet_primary_enhanced_senior_deduction_amount",
        _DED,
        "primary_enhanced_senior_deduction_amount",
        "deductions.primary_enhanced_senior_deduction_amount",
    ),
    "form_1040s1a_line_37": _proj(
        "calc_deductions_worksheet_enhanced_senior_deduction_amount",
        _DED,
        "enhanced_senior_deduction_amount",
        "deductions.enhanced_senior_deduction_amount",
    ),
    "form_1040s1a_line_38": _proj(
        "calc_adjustments_worksheet_total_additional_deductions_amount",
        _ADJ,
        "total_additional_deductions_amount",
        "adjustments.total_additional_deductions_amount",
    ),
}

# TaxCore-native conditional for age gate (replaces multiply × eligibility flag).
_FORMULA_OVERRIDES: dict[str, dict] = {
    "form_1040s1a_line_36a": {
        "type": "conditional",
        "condition": {
            "field": "taxpayer.is_age_65_or_older",
            "operator": "equals",
            "value": True,
        },
        "true_value": {
            "type": "field",
            "field": "adjustments.specified_dollar_less_threshold_reduced_amount",
            "default_value": 0,
        },
        "false_value": {"type": "constant", "constant": 0},
    },
}

_WORKSHEETS: dict[str, dict[str, str]] = {
    _INCOME: {
        "qualified_tips_employee_amount": "currency",
        "total_qualified_tips_amount": "currency",
    },
    _ADJ: {
        "total_foreign_income_exclusions_amount": "currency",
        "smaller_tips_or_max_ded_amount": "currency",
        "tips_magi_less_threshold_amount": "currency",
        "specified_dollar_less_threshold_reduced_amount": "currency",
        "qualified_tips_deduction_amount": "currency",
        "total_additional_deductions_amount": "currency",
    },
    _CREDITS: {
        "tips_magi_less_threshold_divide_number": "currency",
        "tips_magi_less_threshold_reduction_amount": "currency",
    },
    _DED: {
        "enhanced_senior_deduction_magi_less_threshold_amount": "currency",
        "enhanced_senior_deduction_magi_reduction_amount": "currency",
        "primary_enhanced_senior_deduction_amount": "currency",
        "enhanced_senior_deduction_amount": "currency",
    },
    _MAGI: {
        "modified_agi_amount": "currency",
        "final_output_field": "income_calculated.modified_adjusted_gross_income_amount",
    },
}

_MUST_PROMOTE = [
    "income_calculated.modified_adjusted_gross_income_amount",
    "adjustments.qualified_tips_deduction_amount",
    "deductions.enhanced_senior_deduction_amount",
    "adjustments.total_additional_deductions_amount",
]

_OUTPUT_MAPPINGS = [
    {
        "source": f"{_MAGI}.modified_agi_amount",
        "target": "income_calculated.modified_adjusted_gross_income_amount",
    },
    {
        "source": f"{_ADJ}.qualified_tips_deduction_amount",
        "target": "adjustments.qualified_tips_deduction_amount",
    },
    {
        "source": f"{_DED}.enhanced_senior_deduction_amount",
        "target": "deductions.enhanced_senior_deduction_amount",
    },
    {
        "source": f"{_ADJ}.total_additional_deductions_amount",
        "target": "adjustments.total_additional_deductions_amount",
    },
]

_CALC_RULES_ORDER = [
    "calc_adjustments_worksheet_total_foreign_income_exclusions_amount",
    "calc_scenario_aotc_modified_agi_amount",
    "calc_income_worksheet_qualified_tips_employee_amount",
    "calc_income_worksheet_total_qualified_tips_amount",
    "calc_adjustments_worksheet_smaller_tips_or_max_ded_amount",
    "calc_adjustments_worksheet_tips_magi_less_threshold_amount",
    "calc_credits_worksheet_tips_magi_less_threshold_divide_number",
    "calc_credits_worksheet_tips_magi_less_threshold_reduction_amount",
    "calc_adjustments_worksheet_qualified_tips_deduction_amount",
    "calc_deductions_worksheet_enhanced_senior_deduction_magi_less_threshold_amount",
    "calc_deductions_worksheet_enhanced_senior_deduction_magi_reduction_amount",
    "calc_adjustments_worksheet_specified_dollar_less_threshold_reduced_amount",
    "calc_deductions_worksheet_primary_enhanced_senior_deduction_amount",
    "calc_deductions_worksheet_enhanced_senior_deduction_amount",
    "calc_adjustments_worksheet_total_additional_deductions_amount",
]

_SKIP_EXPORT = frozenset({"form_1040s1a_line_1"})

SPEC_1040S1A = FormSpec(
    form="1040s1a",
    form_type="irs_1040_schedule_1a",
    display_label="Schedule 1-A (Form 1040)",
    module_id="schedule_1a",
    worksheet_key=_ADJ,
    worksheets=_WORKSHEETS,
    field_name_map=_FIELD_NAME_MAP,
    cross_form_field_map=_CROSS_FORM_FIELD_MAP,
    rule_projections=_RULE_PROJECTIONS,
    formula_overrides=_FORMULA_OVERRIDES,
    skip_export_rule_ids=_SKIP_EXPORT,
    calculation_schema_merge_mode="upsert_worksheet_leaves",
    form_mapping_merge_mode="upsert_by_canonical_field",
    module_description=(
        "Schedule 1-A pilot: MAGI, qualified tips deduction, enhanced senior "
        "deduction, total additional deductions (AI_TAX_ENGINE projection)."
    ),
    import_decision=(
        "REPLACE Schedule 1-A calc_rules for this pilot chain; MERGE form_mapping "
        "by canonical_field. Overtime (L21) and car loan (L30) omitted — "
        "line 38 sums tips + senior only."
    ),
    canonical_inputs=[
        "income.qualified_tips_wages_amount",
        "income.qualified_tips_form_4137_amount",
        "income.qualified_tips_trade_or_business_amount",
        "income.tips_filing_status_threshold_amount",
        "deductions.enhanced_senior_deduction_filing_status_threshold_amount",
        "adjustments.excluded_puerto_rico_income_amount",
        "adjustments.foreign_earned_income_exclusion_amount",
        "adjustments.housing_deduction_amount",
        "adjustments.gross_income_exclusion_amount",
        "deductions.spouse_enhanced_senior_deduction_amount",
        "taxpayer.is_age_65_or_older",
    ],
    must_promote=_MUST_PROMOTE,
    output_mappings=_OUTPUT_MAPPINGS,
    calc_rules_order=_CALC_RULES_ORDER,
    canonical_schema_additions={
        "income_calculated": {
            "modified_adjusted_gross_income_amount": "currency",
        },
        "adjustments": {
            "total_exclusions_deduction_amount": "currency",
            "smaller_tips_or_max_ded_amount": "currency",
            "tips_magi_less_threshold_amount": "currency",
            "specified_dollar_less_threshold_reduced_amount": "currency",
            "qualified_tips_deduction_amount": "currency",
            "total_additional_deductions_amount": "currency",
        },
        "income": {
            "qualified_tips_employee_amount": "currency",
            "total_qualified_tips_amount": "currency",
            "tips_filing_status_threshold_amount": "currency",
        },
        "credits": {
            "tips_magi_less_threshold_divide_number": "currency",
            "tips_magi_less_threshold_reduction_amount": "currency",
        },
        "deductions": {
            "enhanced_senior_deduction_magi_less_threshold_amount": "currency",
            "enhanced_senior_deduction_magi_reduction_amount": "currency",
            "primary_enhanced_senior_deduction_amount": "currency",
            "enhanced_senior_deduction_amount": "currency",
            "enhanced_senior_deduction_filing_status_threshold_amount": "currency",
        },
    },
    metadata_overrides={
        "adjustments.total_additional_deductions_amount": {
            "computed_by": "calc_adjustments_worksheet_total_additional_deductions_amount",
            "notes": "Pilot sums tips (L13) + senior (L37) only; overtime/car loan deferred.",
        },
    },
    retire_rule_id_prefixes=[
        "calc_adjustments_worksheet_total_foreign_income_exclusions_amount",
        "calc_scenario_aotc_modified_agi_amount",
        "calc_income_worksheet_qualified_tips",
        "calc_income_worksheet_total_qualified_tips",
        "calc_adjustments_worksheet_smaller_tips",
        "calc_adjustments_worksheet_tips_magi",
        "calc_credits_worksheet_tips_magi",
        "calc_adjustments_worksheet_qualified_tips_deduction_amount",
        "calc_deductions_worksheet_enhanced_senior",
        "calc_adjustments_worksheet_specified_dollar",
        "calc_deductions_worksheet_primary_enhanced_senior",
        "calc_adjustments_worksheet_total_additional_deductions_amount",
    ],
    collide_canonical_targets=_MUST_PROMOTE,
    open_risks=[
        "Export projection only — DB/UI/goldens keep form_1040s1a_line_* names.",
        "Line 1 skipped; MAGI rule reads income_calculated.adjusted_gross_income_amount.",
        "Lines 21 (overtime) and 30 (car loan) omitted from line 38 sum.",
        "Line 36a uses TaxCore conditional on taxpayer.is_age_65_or_older (not 1.0/0.0 flag).",
        "Threshold lines 9/32 are pure inputs (filing-status tables not modeled).",
        "Tips inputs 4a/4b/5 default $0 until W-2 box 7 / Form 4137 modeled.",
    ],
    target_tree_extras={
        "multi_worksheet": True,
        "worksheet_keys": list(_WORKSHEETS.keys()),
        "field_name_map": _FIELD_NAME_MAP,
        "cross_form_field_map": _CROSS_FORM_FIELD_MAP,
        "skipped_rules": ["form_1040s1a_line_1"],
    },
)
