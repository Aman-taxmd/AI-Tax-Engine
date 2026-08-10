"""Schedule 1 (Form 1040) — TaxCore export projection.

Our engine keeps `form_1040s1_line_*` names in DB/UI/goldens; this FormSpec
projects to TaxCore domain paths and worksheet leaves at export time only.

Pilot scope: six validated calc rules (lines 3, 9, 10, 13, 15, 26). Pure-input
lines export via field_name_map for form_mapping / metadata only.
"""
from __future__ import annotations

from build.export.taxcore_targets.spec import FormSpec

_OTHER = "schedule_1_other_income_worksheet"
_ADJ = "adjustments_worksheet"

_FIELD_NAME_MAP: dict[str, str] = {
    # Part I — additional income
    "form_1040s1_line_1": "income.state_local_income_tax_refund_amount",
    "form_1040s1_line_2a": "income.alimony_received_amount",
    "form_1040s1_line_3": "income.schedule_c_net_profit_amount",
    "form_1040s1_line_4": "income.other_gain_loss_amount",
    "form_1040s1_line_5": "income.rental_real_estate_income_loss_amount",
    "form_1040s1_line_6": "income.farm_net_profit_loss_amount",
    "form_1040s1_line_7": "income.unemployment_compensation_amount",
    "form_1040s1_line_8a": "income.net_operating_loss_carryforward_amount",
    "form_1040s1_line_8b": "income.gambling_winnings_amount",
    "form_1040s1_line_8c": "income.debt_cancellation_amount",
    "form_1040s1_line_8d": "adjustments.foreign_earned_income_exclusion_amount",
    "form_1040s1_line_8e": "income.hsa_distribution_amount",
    "form_1040s1_line_8f": "income.hsa_distribution_amount",
    "form_1040s1_line_8g": "income.alaska_permanent_fund_dividend_amount",
    "form_1040s1_line_8h": "income.jury_duty_pay_amount",
    "form_1040s1_line_8i": "income.prizes_awards_amount",
    "form_1040s1_line_8j": "income.activity_not_for_profit_income_amount",
    "form_1040s1_line_8k": "income.stock_options_amount",
    "form_1040s1_line_8l": "income.rental_personal_property_amount",
    "form_1040s1_line_8m": "income.olympic_paralympic_medal_usoc_amount",
    "form_1040s1_line_8n": "income.section_951a_inclusion_amount",
    "form_1040s1_line_8o": "income.section_951a_inclusion_amount",
    "form_1040s1_line_8p": "income.excess_business_loss_adjustment_amount",
    "form_1040s1_line_8q": "income.taxable_able_distributions_amount",
    "form_1040s1_line_8r": "income.scholarship_fellowship_grants_amount",
    "form_1040s1_line_8s": "income.nontaxable_medicaid_waiver_payment_amount",
    "form_1040s1_line_8t": "income.nonqualified_deferred_compensation_amount",
    "form_1040s1_line_8u": "income.wages_earned_while_incarcerated_amount",
    "form_1040s1_line_8v": "income.digital_assets_amount",
    "form_1040s1_line_8z": "income.other_income_amount",
    "form_1040s1_line_9": "income.total_other_income_amount",
    "form_1040s1_line_10": "income.total_additional_income_amount",
    # Part II — adjustments
    "form_1040s1_line_11": "adjustments.educator_expenses_amount",
    "form_1040s1_line_12": "adjustments.business_expenses_reservists_others_amount",
    "form_1040s1_line_13": "adjustments.health_savings_account_deduction_amount",
    "form_1040s1_line_14": "adjustments.moving_expense_amount",
    "form_1040s1_line_15": "adjustments.deductible_self_employment_tax_amount",
    "form_1040s1_line_16": "adjustments.self_employed_retirement_plan_amount",
    "form_1040s1_line_17": "adjustments.self_employed_health_insurance_deduction_amount",
    "form_1040s1_line_18": "adjustments.early_withdrawal_penalty_amount",
    "form_1040s1_line_19a": "adjustments.total_alimony_paid_amount",
    "form_1040s1_line_20": "adjustments.ira_deduction_amount",
    "form_1040s1_line_21": "adjustments.student_loan_interest_deduction_amount",
    "form_1040s1_line_22": "adjustments.tuition_fees_deduction_amount",
    "form_1040s1_line_23": "adjustments.archer_msa_deduction_amount",
    "form_1040s1_line_25": "adjustments.other_adjustments_total_amount",
    "form_1040s1_line_26": "adjustments.total_adjustments_amount",
}

_CROSS_FORM_FIELD_MAP: dict[str, str] = {
    "form_1040sc_line_31": "income.schedule_c_net_profit_amount",
    "form_1040sse_line_13": "adjustments.deductible_self_employment_tax_amount",
    "form_8889_line_13": "adjustments.health_savings_account_deduction_amount",
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
    "form_1040s1_line_3": _proj(
        "calc_schedule_1_other_income_worksheet_business_income_loss",
        _OTHER,
        "business_income_loss",
        None,
    ),
    "form_1040s1_line_9": _proj(
        "calc_schedule_1_other_income_worksheet_other_income_items",
        _OTHER,
        "other_income_items",
        "income.other_income_amount",
    ),
    "form_1040s1_line_10": _proj(
        "calc_schedule_1_other_income_worksheet_total_other_income",
        _OTHER,
        "total_other_income",
        "income.total_additional_income_amount",
    ),
    "form_1040s1_line_13": _proj(
        "calc_adjustments_worksheet_hsa_deduction_amount",
        _ADJ,
        "hsa_deduction_amount",
        None,
    ),
    "form_1040s1_line_15": _proj(
        "calc_adjustments_worksheet_deductible_self_employment_tax_amount",
        _ADJ,
        "deductible_self_employment_tax_amount",
        None,
    ),
    "form_1040s1_line_26": _proj(
        "calc_adjustments_worksheet_total_adjustments_amount",
        _ADJ,
        "total_adjustments_amount",
        "adjustments.total_adjustments_amount",
    ),
}

_WORKSHEETS: dict[str, dict[str, str]] = {
    _OTHER: {
        "taxable_refunds_state_local": "currency",
        "alimony_received": "currency",
        "business_income_loss": "currency",
        "other_gains_losses": "currency",
        "rental_real_estate_income": "currency",
        "farm_income_loss": "currency",
        "unemployment_compensation": "currency",
        "other_income_items": "currency",
        "total_other_income": "currency",
        "final_output_field": "income.total_additional_income_amount",
    },
    _ADJ: {
        "hsa_deduction_amount": "currency",
        "deductible_self_employment_tax_amount": "currency",
        "total_adjustments_amount": "currency",
        "final_output_field": "adjustments.total_adjustments_amount",
    },
}

_MUST_PROMOTE = [
    "income.total_additional_income_amount",
    "adjustments.total_adjustments_amount",
]

_OUTPUT_MAPPINGS = [
    {
        "source": f"{_OTHER}.total_other_income",
        "target": "income.total_additional_income_amount",
    },
    {
        "source": f"{_ADJ}.total_adjustments_amount",
        "target": "adjustments.total_adjustments_amount",
    },
]

_CALC_RULES_ORDER = [
    "calc_schedule_1_other_income_worksheet_business_income_loss",
    "calc_schedule_1_other_income_worksheet_other_income_items",
    "calc_schedule_1_other_income_worksheet_total_other_income",
    "calc_adjustments_worksheet_hsa_deduction_amount",
    "calc_adjustments_worksheet_deductible_self_employment_tax_amount",
    "calc_adjustments_worksheet_total_adjustments_amount",
]

SPEC_1040S1 = FormSpec(
    form="1040s1",
    form_type="irs_1040_schedule_1",
    display_label="Schedule 1 (Form 1040)",
    module_id="schedule_1",
    worksheet_key=_OTHER,
    worksheets=_WORKSHEETS,
    field_name_map=_FIELD_NAME_MAP,
    cross_form_field_map=_CROSS_FORM_FIELD_MAP,
    rule_projections=_RULE_PROJECTIONS,
    calculation_schema_merge_mode="upsert_worksheet_leaves",
    form_mapping_merge_mode="upsert_by_canonical_field",
    module_description=(
        "Schedule 1 pilot: additional income (Part I) and adjustments (Part II) "
        "— AI_TAX_ENGINE projection for lines 3/9/10/13/15/26."
    ),
    import_decision=(
        "REPLACE schedule_1 calc_rules for this pilot chain; MERGE form_mapping "
        "and metadata by canonical_field. HSA L13 reads 8889-promoted "
        "adjustments.health_savings_account_deduction_amount. SE L15 reads "
        "adjustments.deductible_self_employment_tax_amount (Schedule SE TBD)."
    ),
    canonical_inputs=[
        "income.state_local_income_tax_refund_amount",
        "income.alimony_received_amount",
        "income.other_gain_loss_amount",
        "income.rental_real_estate_income_loss_amount",
        "income.farm_net_profit_loss_amount",
        "income.unemployment_compensation_amount",
        "adjustments.educator_expenses_amount",
        "adjustments.business_expenses_reservists_others_amount",
        "adjustments.moving_expense_amount",
        "adjustments.self_employed_retirement_plan_amount",
        "adjustments.self_employed_health_insurance_deduction_amount",
        "adjustments.early_withdrawal_penalty_amount",
        "adjustments.total_alimony_paid_amount",
        "adjustments.ira_deduction_amount",
        "adjustments.student_loan_interest_deduction_amount",
        "adjustments.archer_msa_deduction_amount",
        "adjustments.other_adjustments_total_amount",
        "income.schedule_c_net_profit_amount",
        "adjustments.deductible_self_employment_tax_amount",
        "adjustments.health_savings_account_deduction_amount",
    ],
    must_promote=_MUST_PROMOTE,
    output_mappings=_OUTPUT_MAPPINGS,
    calc_rules_order=_CALC_RULES_ORDER,
    canonical_schema_additions={
        "income": {
            "total_additional_income_amount": "currency",
            "total_other_income_amount": "currency",
            "schedule_c_net_profit_amount": "currency",
        },
        "adjustments": {
            "total_adjustments_amount": "currency",
            "health_savings_account_deduction_amount": "currency",
            "deductible_self_employment_tax_amount": "currency",
        },
    },
    metadata_overrides={
        "adjustments.health_savings_account_deduction_amount": {
            "computed_by": (
                "calc_form_8889_hsa_deduction_worksheet_health_savings_account_deduction_amount"
            ),
            "notes": "Promoted from hsa module; Sch 1 L13 mirrors via hsa_deduction worksheet rule.",
        },
        "income.total_additional_income_amount": {
            "computed_by": "calc_schedule_1_other_income_worksheet_total_other_income",
        },
        "adjustments.total_adjustments_amount": {
            "computed_by": "calc_adjustments_worksheet_total_adjustments_amount",
        },
    },
    retire_rule_id_prefixes=[
        "calc_schedule_1_other_income_worksheet_",
        "calc_adjustments_worksheet_hsa_deduction_amount",
        "calc_adjustments_worksheet_deductible_self_employment_tax_amount",
        "calc_adjustments_worksheet_total_adjustments_amount",
    ],
    collide_canonical_targets=_MUST_PROMOTE,
    open_risks=[
        "Export projection only — DB/UI/goldens keep form_1040s1_line_* names.",
        "Line 3 carryover from Schedule C until schedule_c module exports.",
        "Line 13 sum_instances_then_carryover → reads 8889-promoted HSA deduction.",
        "Line 15 carryover from Schedule SE until schedule_se module exports.",
        "Line 9 sums 8a–8z; TaxCore other_income_items uses a narrower canonical set.",
        "Line 26 sums Sch 1 Part II lines; TaxCore total_adjustments uses canonical paths.",
    ],
    target_tree_extras={
        "multi_worksheet": True,
        "worksheet_keys": list(_WORKSHEETS.keys()),
        "field_name_map": _FIELD_NAME_MAP,
        "cross_form_field_map": _CROSS_FORM_FIELD_MAP,
    },
)
