"""Form 1040 — multi-worksheet TaxCore export projection.

Our engine keeps `form_1040_line_*` names in DB/UI/goldens; this FormSpec
projects to TaxCore domain paths and worksheet leaves at export time only.

W-2-owned rules (lines 1a, 25a) are omitted — see w2 package.
Cross-form carryovers (lines 8, 10, 13b) are omitted as separate rules;
operands rewrite to canonical schedule paths in consuming rules.
"""
from __future__ import annotations

from build.export.taxcore_targets.spec import FormSpec

_AGI = "form_1040_agi_worksheet"
_TAXABLE = "form_1040_taxable_income_worksheet"
_TOTAL_TAX = "form_1040_total_tax_worksheet"
_REFUND = "form_1040_refund_worksheet"
_AMOUNT_OWED = "form_1040_amount_owed_worksheet"

_FIELD_NAME_MAP: dict[str, str] = {
    "form_1040_filing_status": "taxpayer.filing_status",
    "form_1040_line_1a": "income.wages_salaries_tips",
    "form_1040_line_1b": "income.household_employee_wages_amount",
    "form_1040_line_1c": "income.tip_income_amount",
    "form_1040_line_1d": "income.medicaid_waiver_payment_not_reported_w2_amount",
    "form_1040_line_1e": "income.taxable_dependent_care_benefits_amount",
    "form_1040_line_1f": "income.taxable_adoption_benefits_amount",
    "form_1040_line_1g": "income.form_8919_wages_amount",
    "form_1040_line_1h": "income.other_earned_income_amount",
    "form_1040_line_1z": "income_calculated.total_wages_salaries_tips_amount",
    "form_1040_line_2b": "income.taxable_interest",
    "form_1040_line_3b": "income.ordinary_dividends",
    "form_1040_line_4b": "income.ira_distributions_taxable",
    "form_1040_line_5b": "income.pensions_annuities_taxable",
    "form_1040_line_6b": "income.taxable_social_security_amount",
    "form_1040_line_7a": "income.capital_gain_loss_amount",
    "form_1040_line_8": "income.total_additional_income_amount",
    "form_1040_line_9": "income_calculated.total_income_amount",
    "form_1040_line_10": "adjustments.total_adjustments_amount",
    "form_1040_line_11a": "income_calculated.adjusted_gross_income_amount",
    "form_1040_line_12e": "deductions.standard_deduction_amount",
    "form_1040_line_13a": "deductions.qualified_business_income_amount",
    "form_1040_line_13b": "adjustments.total_additional_deductions_amount",
    "form_1040_line_14": "deductions.total_deductions_amount",
    "form_1040_line_15": "income_calculated.taxable_income_amount",
    "form_1040_line_16": "taxes.income_tax_amount",
    "form_1040_line_18": "taxes.total_before_credits_amount",
    "form_1040_line_21": "taxes.total_nonrefundable_credits_amount",
    "form_1040_line_22": "taxes.tax_less_credits_amount",
    "form_1040_line_23": "taxes.total_other_taxes_amount",
    "form_1040_line_24": "taxes.total_tax_amount",
    "form_1040_line_25a": "payments.w2_withholding_amount",
    "form_1040_line_25b": "payments.form_1099_withholding_amount",
    "form_1040_line_25c": "payments.other_withholding_amount",
    "form_1040_line_25d": "payments.total_withholding_amount",
    "form_1040_line_26": "payments.estimated_tax_payments_amount",
    "form_1040_line_33": "payments.total_payments_amount",
    "form_1040_line_34": "refund.overpaid_amount",
    "form_1040_line_35a": "refund.refund_amount",
    "form_1040_line_37": "refund.amount_owed",
}

_CROSS_FORM_FIELD_MAP: dict[str, str] = {
    "form_1040s1_line_10": "income.total_additional_income_amount",
    "form_1040s1_line_26": "adjustments.total_adjustments_amount",
    "form_1040s1a_line_38": "adjustments.total_additional_deductions_amount",
    "form_1040s2_line_21": (
        "schedule_2_total_additional_taxes_worksheet.total_additional_taxes_part_ii_amount"
    ),
}

def _proj(
    taxcore_rule_id: str,
    worksheet_key: str,
    output_leaf: str,
    canonical_target: str,
) -> dict[str, str]:
    return {
        "taxcore_rule_id": taxcore_rule_id,
        "worksheet_key": worksheet_key,
        "output_leaf": output_leaf,
        "canonical_target": canonical_target,
    }


_RULE_PROJECTIONS: dict[str, dict[str, str]] = {
    "form_1040_line_1z": _proj(
        "calc_form_1040_agi_worksheet_w2_wages_aggregate",
        _AGI,
        "w2_wages_aggregate",
        "income_calculated.total_wages_salaries_tips_amount",
    ),
    "form_1040_line_9": _proj(
        "calc_form_1040_agi_worksheet_total_income_before_adjustments",
        _AGI,
        "total_income_before_adjustments",
        "income_calculated.total_income_amount",
    ),
    "form_1040_line_11a": _proj(
        "calc_form_1040_agi_worksheet_adjusted_gross_income",
        _AGI,
        "adjusted_gross_income",
        "income_calculated.adjusted_gross_income_amount",
    ),
    "form_1040_line_14": _proj(
        "calc_form_1040_taxable_income_worksheet_total_deductions",
        _TAXABLE,
        "total_deductions",
        "deductions.total_deductions_amount",
    ),
    "form_1040_line_15": _proj(
        "calc_form_1040_taxable_income_worksheet_taxable_income",
        _TAXABLE,
        "taxable_income",
        "income_calculated.taxable_income_amount",
    ),
    "form_1040_line_16": _proj(
        "calc_form_1040_total_tax_worksheet_income_tax_amount",
        _TOTAL_TAX,
        "income_tax_amount",
        "taxes.income_tax_amount",
    ),
    "form_1040_line_18": _proj(
        "calc_form_1040_total_tax_worksheet_total_tax_before_credits",
        _TOTAL_TAX,
        "total_tax_before_credits",
        "taxes.total_before_credits_amount",
    ),
    "form_1040_line_21": _proj(
        "calc_form_1040_total_tax_worksheet_total_nonrefundable_credits",
        _TOTAL_TAX,
        "total_nonrefundable_credits",
        "taxes.total_nonrefundable_credits_amount",
    ),
    "form_1040_line_22": _proj(
        "calc_form_1040_total_tax_worksheet_tax_after_nonrefundable_credits",
        _TOTAL_TAX,
        "tax_after_nonrefundable_credits",
        "taxes.tax_less_credits_amount",
    ),
    "form_1040_line_23": _proj(
        "calc_form_1040_total_tax_worksheet_total_other_taxes",
        _TOTAL_TAX,
        "total_other_taxes",
        "taxes.total_other_taxes_amount",
    ),
    "form_1040_line_24": _proj(
        "calc_form_1040_total_tax_worksheet_total_tax_amount",
        _TOTAL_TAX,
        "total_tax_amount",
        "taxes.total_tax_amount",
    ),
    "form_1040_line_25d": _proj(
        "calc_form_1040_refund_worksheet_total_withholding",
        _REFUND,
        "total_withholding",
        "payments.total_withholding_amount",
    ),
    "form_1040_line_33": _proj(
        "calc_form_1040_refund_worksheet_total_payments",
        _REFUND,
        "total_payments",
        "payments.total_payments_amount",
    ),
    "form_1040_line_34": _proj(
        "calc_form_1040_refund_worksheet_overpaid_amount",
        _REFUND,
        "overpaid_amount",
        "refund.overpaid_amount",
    ),
    "form_1040_line_35a": _proj(
        "calc_form_1040_refund_worksheet_refund_amount",
        _REFUND,
        "refund_amount",
        "refund.refund_amount",
    ),
    "form_1040_line_37": _proj(
        "calc_form_1040_amount_owed_worksheet_amount_owed",
        _AMOUNT_OWED,
        "amount_owed",
        "refund.amount_owed",
    ),
}

_WORKSHEETS: dict[str, dict[str, str]] = {
    _AGI: {
        "total_income_before_adjustments": "currency",
        "w2_wages_aggregate": "currency",
        "taxable_interest_aggregate": "currency",
        "ordinary_dividends_aggregate": "currency",
        "ira_distributions_taxable": "currency",
        "pensions_annuities_taxable": "currency",
        "social_security_taxable": "currency",
        "capital_gain_loss": "currency",
        "other_income_total": "currency",
        "total_adjustments": "currency",
        "adjusted_gross_income": "currency",
        "final_output_field": "income_calculated.adjusted_gross_income_amount",
    },
    _TAXABLE: {
        "adjusted_gross_income": "currency",
        "greater_deduction": "currency",
        "qualified_business_income_deduction": "currency",
        "total_deductions": "currency",
        "taxable_income": "currency",
        "final_output_field": "income_calculated.taxable_income_amount",
    },
    _TOTAL_TAX: {
        "income_tax_amount": "currency",
        "total_other_taxes": "currency",
        "total_tax_before_credits": "currency",
        "total_nonrefundable_credits": "currency",
        "tax_after_nonrefundable_credits": "currency",
        "total_tax_amount": "currency",
        "final_output_field": "taxes.total_tax_amount",
    },
    _REFUND: {
        "total_withholding": "currency",
        "total_payments": "currency",
        "overpaid_amount": "currency",
        "refund_amount": "currency",
        "final_output_field": "refund.refund_amount",
    },
    _AMOUNT_OWED: {
        "amount_owed": "currency",
        "final_output_field": "refund.amount_owed",
    },
}

_MUST_PROMOTE = [
    "income_calculated.total_wages_salaries_tips_amount",
    "income_calculated.total_income_amount",
    "income_calculated.adjusted_gross_income_amount",
    "income_calculated.taxable_income_amount",
    "taxes.income_tax_amount",
    "taxes.total_before_credits_amount",
    "taxes.tax_less_credits_amount",
    "taxes.total_other_taxes_amount",
    "taxes.total_tax_amount",
    "payments.total_withholding_amount",
    "payments.total_payments_amount",
    "refund.overpaid_amount",
    "refund.refund_amount",
    "refund.amount_owed",
]

_OUTPUT_MAPPINGS = [
    {"source": f"{_AGI}.w2_wages_aggregate", "target": "income_calculated.total_wages_salaries_tips_amount"},
    {"source": f"{_AGI}.total_income_before_adjustments", "target": "income_calculated.total_income_amount"},
    {"source": f"{_AGI}.adjusted_gross_income", "target": "income_calculated.adjusted_gross_income_amount"},
    {"source": f"{_TAXABLE}.taxable_income", "target": "income_calculated.taxable_income_amount"},
    {"source": f"{_TOTAL_TAX}.income_tax_amount", "target": "taxes.income_tax_amount"},
    {"source": f"{_TOTAL_TAX}.total_tax_before_credits", "target": "taxes.total_before_credits_amount"},
    {"source": f"{_TOTAL_TAX}.tax_after_nonrefundable_credits", "target": "taxes.tax_less_credits_amount"},
    {"source": f"{_TOTAL_TAX}.total_other_taxes", "target": "taxes.total_other_taxes_amount"},
    {"source": f"{_TOTAL_TAX}.total_tax_amount", "target": "taxes.total_tax_amount"},
    {"source": f"{_REFUND}.total_withholding", "target": "payments.total_withholding_amount"},
    {"source": f"{_REFUND}.total_payments", "target": "payments.total_payments_amount"},
    {"source": f"{_REFUND}.overpaid_amount", "target": "refund.overpaid_amount"},
    {"source": f"{_REFUND}.refund_amount", "target": "refund.refund_amount"},
    {"source": f"{_AMOUNT_OWED}.amount_owed", "target": "refund.amount_owed"},
]

_CALC_RULES_ORDER = [
    "calc_form_1040_agi_worksheet_w2_wages_aggregate",
    "calc_form_1040_agi_worksheet_total_income_before_adjustments",
    "calc_form_1040_agi_worksheet_adjusted_gross_income",
    "calc_form_1040_taxable_income_worksheet_total_deductions",
    "calc_form_1040_taxable_income_worksheet_taxable_income",
    "calc_form_1040_total_tax_worksheet_income_tax_amount",
    "calc_form_1040_total_tax_worksheet_total_tax_before_credits",
    "calc_form_1040_total_tax_worksheet_total_nonrefundable_credits",
    "calc_form_1040_total_tax_worksheet_tax_after_nonrefundable_credits",
    "calc_form_1040_total_tax_worksheet_total_other_taxes",
    "calc_form_1040_total_tax_worksheet_total_tax_amount",
    "calc_form_1040_refund_worksheet_total_withholding",
    "calc_form_1040_refund_worksheet_total_payments",
    "calc_form_1040_refund_worksheet_overpaid_amount",
    "calc_form_1040_refund_worksheet_refund_amount",
    "calc_form_1040_amount_owed_worksheet_amount_owed",
]

_SKIP_STUB = frozenset(
    {
        "form_1040_line_17",
        "form_1040_line_19",
        "form_1040_line_20",
        "form_1040_line_27a",
        "form_1040_line_28",
        "form_1040_line_29",
        "form_1040_line_30",
        "form_1040_line_31",
        "form_1040_line_32",
        "form_1040_line_36",
        "form_1040_line_38",
    }
)

_SKIP_EXPORT = frozenset(
    {
        "form_1040_line_1a",
        "form_1040_line_25a",
        "form_1040_line_8",
        "form_1040_line_10",
        "form_1040_line_13b",
    }
)

SPEC_1040 = FormSpec(
    form="1040",
    form_type="irs_1040",
    display_label="Personal Return (Base)",
    module_id="form_1040_base",
    worksheet_key=_AGI,
    worksheets=_WORKSHEETS,
    field_name_map=_FIELD_NAME_MAP,
    cross_form_field_map=_CROSS_FORM_FIELD_MAP,
    rule_projections=_RULE_PROJECTIONS,
    skip_stub_rule_ids=_SKIP_STUB,
    skip_export_rule_ids=_SKIP_EXPORT,
    calculation_schema_merge_mode="upsert_worksheet_leaves",
    form_mapping_merge_mode="upsert_by_canonical_field",
    module_description=(
        "Core Form 1040 pilot: AGI, taxable income, tax table Line 16, "
        "total tax, withholding, refund/amount owed (AI_TAX_ENGINE projection)."
    ),
    import_decision=(
        "REPLACE form_1040_base calc_rules for this pilot chain; MERGE "
        "form_mapping and metadata by canonical_field. Do NOT wipe TaxCore's "
        "other 1040 leaves. W-2 lines 1a/25a owned by w2_income package. "
        "Schedule carryovers (8/10/13b) read canonical schedule paths."
    ),
    canonical_inputs=[
        "taxpayer.filing_status",
        "income.wages_salaries_tips",
        "income.household_employee_wages_amount",
        "income.tip_income_amount",
        "income.medicaid_waiver_payment_not_reported_w2_amount",
        "income.taxable_dependent_care_benefits_amount",
        "income.taxable_adoption_benefits_amount",
        "income.form_8919_wages_amount",
        "income.other_earned_income_amount",
        "income.taxable_interest",
        "income.ordinary_dividends",
        "income.ira_distributions_taxable",
        "income.pensions_annuities_taxable",
        "income.taxable_social_security_amount",
        "income.capital_gain_loss_amount",
        "income.total_additional_income_amount",
        "adjustments.total_adjustments_amount",
        "deductions.standard_deduction_amount",
        "deductions.qualified_business_income_amount",
        "adjustments.total_additional_deductions_amount",
        "payments.form_1099_withholding_amount",
        "payments.other_withholding_amount",
        "payments.estimated_tax_payments_amount",
    ],
    must_promote=_MUST_PROMOTE,
    output_mappings=_OUTPUT_MAPPINGS,
    calc_rules_order=_CALC_RULES_ORDER,
    canonical_schema_additions={
        "taxpayer": {"filing_status": "string"},
        "income_calculated": {
            "total_wages_salaries_tips_amount": "currency",
            "total_income_amount": "currency",
            "adjusted_gross_income_amount": "currency",
            "taxable_income_amount": "currency",
        },
        "taxes": {
            "income_tax_amount": "currency",
            "total_before_credits_amount": "currency",
            "total_nonrefundable_credits_amount": "currency",
            "tax_less_credits_amount": "currency",
            "total_other_taxes_amount": "currency",
            "total_tax_amount": "currency",
        },
        "payments": {
            "total_withholding_amount": "currency",
            "total_payments_amount": "currency",
        },
        "refund": {
            "overpaid_amount": "currency",
            "refund_amount": "currency",
            "amount_owed": "currency",
        },
    },
    metadata_overrides={
        "income.wages_salaries_tips": {
            "computed_by": "calc_w2_employer_use_worksheet_aggregate_w2_wages",
            "notes": "Promoted from w2_income module; not written by 1040 export.",
        },
        "payments.w2_withholding_amount": {
            "computed_by": "calc_w2_employer_use_worksheet_aggregate_w2_federal_withholding",
            "notes": "Promoted from w2_income module; not written by 1040 export.",
        },
        "deductions.standard_deduction_amount": {
            "mutable": False,
            "source": "calculated",
            "computed_by": None,
            "notes": (
                "Our engine uses CONDITION_FIELDS standard_deduction on "
                "form_1040_line_12e; TaxCore uses taxable_income_worksheet "
                "greater_deduction chain — pilot maps to canonical path only."
            ),
        },
    },
    extra_rule_dependencies={
        "calc_form_1040_agi_worksheet_adjusted_gross_income": [
            "calc_form_1040_agi_worksheet_total_adjustments",
        ],
    },
    retire_rule_id_prefixes=[
        "calc_form_1040_agi_worksheet_",
        "calc_form_1040_taxable_income_worksheet_",
        "calc_form_1040_total_tax_worksheet_",
        "calc_form_1040_refund_worksheet_",
        "calc_form_1040_amount_owed_worksheet_",
    ],
    collide_canonical_targets=list(_MUST_PROMOTE),
    open_risks=[
        "Export projection only — DB/UI/goldens keep form_1040_line_* names.",
        "Lines 1a/25a omitted; w2_income module owns wages/withholding aggregates.",
        "Lines 8/10/13b omitted as rules; operands rewrite to schedule canonical paths.",
        "Line 12e standard deduction: condition field in our engine, not a calc rule.",
        "Line 16 uses tax_table (provisional in our engine); QDCG worksheet not modeled.",
        "Stub lines 17/19/20/27a-31/36/38 exported as skipped constant-$0 rules.",
        "TaxCore form_1040_base has ~79 rules; this pilot replaces 16 calc rules only.",
        "Schedule 2 line 21 operand reads schedule_2 worksheet — schedule_2 module must run.",
    ],
    target_tree_extras={
        "multi_worksheet": True,
        "worksheet_keys": list(_WORKSHEETS.keys()),
        "field_name_map": _FIELD_NAME_MAP,
        "cross_form_field_map": _CROSS_FORM_FIELD_MAP,
        "w2_owned_rules": ["form_1040_line_1a", "form_1040_line_25a"],
        "skipped_carryover_rules": ["form_1040_line_8", "form_1040_line_10", "form_1040_line_13b"],
    },
)
