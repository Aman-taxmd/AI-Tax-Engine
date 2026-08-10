"""Form 8889 — HSA target tree for TaxCore import.

Two trees:
  canonical_data          = durable taxpayer truth (inputs + promoted finals)
  calculation_results     = form_8889_hsa_deduction_worksheet.* scratchpad

Rules write worksheets only. Avatar module `hsa` promotes via output_mappings.
Replace TaxCore's old HSA chain — do not run both.
"""
from __future__ import annotations

from build.export.taxcore_targets.spec import FormSpec

_WORKSHEET = "form_8889_hsa_deduction_worksheet"

# Line-aligned worksheet leaves (checklist §3).
_WORKSHEET_FIELDS: dict[str, str] = {
    "is_hdhp_self_only_coverage": "boolean",  # L1 preferred input
    "is_hdhp_family_coverage": "boolean",  # L1 preferred input
    "hdhp_coverage_type": "string",  # L1 compat mirror only (not form-mapping primary)
    "hsa_contribution_amount": "currency",  # L2
    "hsa_limited_annual_deductible_amount": "currency",  # L3
    "total_archer_msa_contribution_amount": "currency",  # L4
    "hsa_limited_deductible_allowed_amount": "currency",  # L5 computed
    "hsa_family_deductible_amount": "currency",  # L6 computed
    "hsa_additional_contribution_amount": "currency",  # L7
    "hsa_limited_gross_contribution_amount": "currency",  # L8 computed
    "hsa_employer_contribution_amount": "currency",  # L9 computed from W-2
    "hsa_qualified_funding_distribution_amount": "currency",  # L10
    "total_hsa_contribution_amount": "currency",  # L11 computed
    "hsa_limited_contribution_amount": "currency",  # L12 computed
    "health_savings_account_deduction_amount": "currency",  # L13 ★
    "total_hsa_distribution_amount": "currency",  # L14a
    "hsa_distribution_rollover_amount": "currency",  # L14b
    "hsa_net_distribution_amount": "currency",  # L14c computed
    "unreimbursed_qualified_medical_dental_expenses_amount": "currency",  # L15
    "taxable_hsa_distribution_amount": "currency",  # L16 computed
    "is_hsa_distribution_additional_tax_exception": "boolean",  # L17a
    "hsa_distribution_additional_percent_tax_amount": "currency",  # L17b ★
    "hdhp_coverage_fail_partial_year_amount": "currency",  # L18
    "hdhp_coverage_fail_fund_distribution_amount": "currency",  # L19
    "hdhp_coverage_income_amount": "currency",  # L20 computed
    "hdhp_coverage_additional_tax_amount": "currency",  # L21 ★
    "final_output_field": "adjustments.health_savings_account_deduction_amount",
}


def _l1_boolean_mapping(
    *,
    canonical_field: str,
    description: str,
    xsd_element: str,
    pdf_field_code: str,
) -> dict:
    return {
        "canonical_field": canonical_field,
        "data_type": "boolean",
        "description": description,
        "form_view": {
            "registry_key": f"Form8889Data/{xsd_element}",
            "xsd_element": xsd_element,
            "xsd_type": "BooleanType",
            "xsd_path": "",
            "xsd_file": "IRS8889.xsd",
            "xsl_xpath": None,
            "xsl_leaf": None,
            "mef_element_path": None,
            "source_origin": "ai_tax_engine",
            "display_label": xsd_element,
            "pdf_field_code": pdf_field_code,
            "pdf_field_confidence": 1.0,
        },
        "source_mappings": {
            "2025": {
                "sources": [
                    {
                        "form": "irs_8889",
                        "lines": ["1"],
                        "field_identifier": xsd_element,
                        "field_label": xsd_element,
                        "ocr_strategy": "key_value_pair",
                        "parse_strategy": "checkbox_parser",
                        "required": False,
                    }
                ]
            }
        },
        "target_line": {
            "2025": {
                "line": "1",
                "line_label": description,
                "calculation": "direct_copy",
            }
        },
        "storage_unit": None,
    }


_FORM_MAPPING_EXTRAS = [
    _l1_boolean_mapping(
        canonical_field="deductions.is_hdhp_self_only_coverage",
        description="HDHP self-only coverage (Form 8889 Line 1)",
        xsd_element="HDHPSelfOnlyCoverageInd",
        pdf_field_code="topmostSubform[0].Page1[0].c1_1[0]",
    ),
    _l1_boolean_mapping(
        canonical_field="deductions.is_hdhp_family_coverage",
        description="HDHP family coverage (Form 8889 Line 1)",
        xsd_element="HDHPFamilyCoverageInd",
        pdf_field_code="topmostSubform[0].Page1[0].c1_1[1]",
    ),
]

_MUST_PROMOTE = [
    "adjustments.health_savings_account_deduction_amount",  # L13 → Sch 1 / AGI
    "taxes.hsa_distribution_additional_percent_tax_amount",  # L17b
    "taxes.hdhp_coverage_additional_tax_amount",  # L21
]

_FORM_VIEW_PROMOTE = [
    "adjustments.hsa_limited_deductible_allowed_amount",  # L5
    "adjustments.hsa_family_deductible_amount",  # L6
    "adjustments.hsa_limited_gross_contribution_amount",  # L8
    "adjustments.hsa_employer_contribution_amount",  # L9
    "adjustments.total_hsa_contribution_amount",  # L11
    "adjustments.hsa_limited_contribution_amount",  # L12
    "income.hsa_net_distribution_amount",  # L14c
    "income.taxable_hsa_distribution_amount",  # L16
    "income.hdhp_coverage_income_amount",  # L20
]

_CALC_RULES_ORDER = [
    "calc_form_8889_hsa_deduction_worksheet_hsa_limited_deductible_allowed_amount",
    "calc_form_8889_hsa_deduction_worksheet_hsa_family_deductible_amount",
    "calc_form_8889_hsa_deduction_worksheet_hsa_limited_gross_contribution_amount",
    "calc_form_8889_hsa_deduction_worksheet_hsa_employer_contribution_amount",
    "calc_form_8889_hsa_deduction_worksheet_total_hsa_contribution_amount",
    "calc_form_8889_hsa_deduction_worksheet_hsa_limited_contribution_amount",
    "calc_form_8889_hsa_deduction_worksheet_health_savings_account_deduction_amount",
    "calc_form_8889_hsa_deduction_worksheet_hsa_net_distribution_amount",
    "calc_form_8889_hsa_deduction_worksheet_taxable_hsa_distribution_amount",
    "calc_form_8889_hsa_deduction_worksheet_hsa_distribution_additional_percent_tax_amount",
    "calc_form_8889_hsa_deduction_worksheet_hdhp_coverage_income_amount",
    "calc_form_8889_hsa_deduction_worksheet_hdhp_coverage_additional_tax_amount",
]

# TaxCore-native W-2 Box 12 Code W aggregate (replaces our intake_w2_* path).
_EMPLOYER_HSA_FORMULA = {
    "type": "aggregate",
    "source": "schedule_line_items",
    "filter": {"schedule_type": "w2_record"},
    "confirmed_only": True,
    "aggregate_operation": "sum",
    "field_path": "definition.box12_code_w_amount_cents",
    "rounding": "nearest",
    "decimal_places": 2,
}

SPEC_8889 = FormSpec(
    form="8889",
    form_type="irs_8889",
    display_label="Form 8889 — HSA",
    module_id="hsa",
    worksheet_key=_WORKSHEET,
    rule_id_template="calc_form_{form}_hsa_deduction_worksheet_{leaf}",
    worksheet_fields=_WORKSHEET_FIELDS,
    form_mapping_exclude=frozenset({"deductions.hdhp_coverage_type"}),
    form_mapping_extras=_FORM_MAPPING_EXTRAS,
    canonical_inputs=[
        "deductions.is_hdhp_self_only_coverage",
        "deductions.is_hdhp_family_coverage",
        "adjustments.hsa_contribution_amount",
        "adjustments.hsa_limited_annual_deductible_amount",
        "adjustments.total_archer_msa_contribution_amount",
        "adjustments.hsa_additional_contribution_amount",
        "adjustments.hsa_qualified_funding_distribution_amount",
        "income.total_hsa_distribution_amount",
        "adjustments.hsa_distribution_rollover_amount",
        "deductions.unreimbursed_qualified_medical_dental_expenses_amount",
        "income.is_hsa_distribution_additional_tax_exception",
        "deductions.hdhp_coverage_fail_partial_year_amount",
        "adjustments.hdhp_coverage_fail_fund_distribution_amount",
    ],
    must_promote=_MUST_PROMOTE,
    form_view_promote=_FORM_VIEW_PROMOTE,
    calc_rules_order=_CALC_RULES_ORDER,
    skip_stub_rule_ids=frozenset({
        # Constant-$0 stubs in our DB; TaxCore should take these as user inputs
        # for Part III until a real failure/excess calc lands.
        "deductions.hdhp_coverage_fail_partial_year_amount",
        "adjustments.hdhp_coverage_fail_fund_distribution_amount",
    }),
    formula_overrides={
        "adjustments.hsa_employer_contribution_amount": _EMPLOYER_HSA_FORMULA,
    },
    formula_override_notes={
        "adjustments.hsa_employer_contribution_amount": [
            "W-2 path remapped: intake_w2_box12w_hsa_employer_contrib → "
            "multi_instance.w2_records[].box12_code_w_amount_cents via "
            "schedule_line_items aggregate (TaxCore-native shape).",
            "Field name says cents; confirm engine dollars-vs-cents at import. "
            "AI_TAX_ENGINE storage_unit remains dollars.",
        ],
    },
    metadata_overrides={
        "deductions.hdhp_coverage_type": {
            # Compat / engine mirror only — L1 primary inputs are the two booleans.
            "mutable": False,
            "source": "calculated",
            "question_type": "single_select",
            "enum_values": ["self_only", "family"],
            "ask_user_prompt": None,
            "notes": (
                "Not the Form 8889 Line 1 primary model. Derive from "
                "deductions.is_hdhp_self_only_coverage / is_hdhp_family_coverage "
                "(or keep for AI_TAX_ENGINE PDF checkbox-group rendering)."
            ),
        },
        "income.is_hsa_distribution_additional_tax_exception": {
            "mutable": True,
            "source": "user_input",
            "question_type": "boolean",
        },
        "adjustments.hsa_limited_annual_deductible_amount": {
            # Checklist treats L3 as input; our engine also derives via condition.
            "mutable": True,
            "source": "user_input",
            "question_type": "currency",
            "notes": (
                "Age-55 catch-up / married-family Line 3 vs Line 7 split is not "
                "fully modeled in the new form-arithmetic chain — verify against "
                "TaxCore hsa-form-8889-field-gaps.md before calling 8889 done."
            ),
        },
        "adjustments.hsa_additional_contribution_amount": {
            "mutable": True,
            "source": "user_input",
            "question_type": "currency",
        },
        "adjustments.total_archer_msa_contribution_amount": {
            "mutable": True,
            "source": "user_input",
            "question_type": "currency",
        },
        "adjustments.hsa_qualified_funding_distribution_amount": {
            "mutable": True,
            "source": "user_input",
            "question_type": "currency",
        },
        "deductions.hdhp_coverage_fail_partial_year_amount": {
            "mutable": True,
            "source": "user_input",
            "question_type": "currency",
            "computed_by": None,
        },
        "adjustments.hdhp_coverage_fail_fund_distribution_amount": {
            "mutable": True,
            "source": "user_input",
            "question_type": "currency",
            "computed_by": None,
        },
    },
    extra_metadata_fields={
        "deductions.is_hdhp_self_only_coverage": {
            "mutable": True,
            "source": "user_input",
            "section": "deductions",
            "question_type": "boolean",
            "display_label": "HDHP self-only coverage",
            "comparison_label": None,
            "document_source": None,
            "can_skip_if_document": False,
            "is_array_field": False,
            "storage_unit": None,
            "computed_by": None,
            "bookmarkable": True,
            "gdpr_erasure_category": "financial",
            "irs_pub_1075_fti": True,
            "enum_values": None,
            "children": None,
            "is_engine_question": False,
            "default_config": None,
            "source_form_line": "1",
            "source_xsd_element": "HDHPSelfOnlyCoverageInd",
            "ask_user_prompt": (
                "Did you have self-only HDHP coverage on the first day of "
                "the last month of the tax year? (Form 8889 Line 1)"
            ),
            "notes": (
                "Primary Form 8889 Line 1 input (with is_hdhp_family_coverage). "
                "Mutually exclusive with family coverage."
            ),
        },
        "deductions.is_hdhp_family_coverage": {
            "mutable": True,
            "source": "user_input",
            "section": "deductions",
            "question_type": "boolean",
            "display_label": "HDHP family coverage",
            "comparison_label": None,
            "document_source": None,
            "can_skip_if_document": False,
            "is_array_field": False,
            "storage_unit": None,
            "computed_by": None,
            "bookmarkable": True,
            "gdpr_erasure_category": "financial",
            "irs_pub_1075_fti": True,
            "enum_values": None,
            "children": None,
            "is_engine_question": False,
            "default_config": None,
            "source_form_line": "1",
            "source_xsd_element": "HDHPFamilyCoverageInd",
            "ask_user_prompt": (
                "Did you have family HDHP coverage on the first day of "
                "the last month of the tax year? (Form 8889 Line 1)"
            ),
            "notes": (
                "Primary Form 8889 Line 1 input (with is_hdhp_self_only_coverage). "
                "Mutually exclusive with self-only coverage."
            ),
        },
    },
    canonical_schema_additions={
        # Already present in TaxCore for TY2026; listed so importers can upsert
        # safely if a year slice is missing them.
        "deductions": {
            "is_hdhp_self_only_coverage": "boolean",
            "is_hdhp_family_coverage": "boolean",
            "hdhp_coverage_type": "string",
            "hdhp_coverage_fail_partial_year_amount": "currency",
            "unreimbursed_qualified_medical_dental_expenses_amount": "currency",
        },
        "adjustments": {
            "hsa_contribution_amount": "currency",
            "hsa_limited_annual_deductible_amount": "currency",
            "total_archer_msa_contribution_amount": "currency",
            "hsa_limited_deductible_allowed_amount": "currency",
            "hsa_family_deductible_amount": "currency",
            "hsa_additional_contribution_amount": "currency",
            "hsa_limited_gross_contribution_amount": "currency",
            "hsa_employer_contribution_amount": "currency",
            "hsa_qualified_funding_distribution_amount": "currency",
            "total_hsa_contribution_amount": "currency",
            "hsa_limited_contribution_amount": "currency",
            "health_savings_account_deduction_amount": "currency",
            "hsa_distribution_rollover_amount": "currency",
            "hdhp_coverage_fail_fund_distribution_amount": "currency",
        },
        "income": {
            "total_hsa_distribution_amount": "currency",
            "hsa_net_distribution_amount": "currency",
            "taxable_hsa_distribution_amount": "currency",
            "is_hsa_distribution_additional_tax_exception": "boolean",
            "hdhp_coverage_income_amount": "currency",
        },
        "taxes": {
            "hsa_distribution_additional_percent_tax_amount": "currency",
            "hdhp_coverage_additional_tax_amount": "currency",
        },
        "multi_instance": {
            "w2_records": {
                "box12_code_w_amount_cents": "currency",
            }
        },
    },
    retire_rule_id_prefixes=[
        # Prior AI_TAX_ENGINE export used the short worksheet rule_id prefix.
        "calc_form_8889_worksheet_",
        # Old TaxCore stub leaves under the same worksheet prefix but different
        # leaf names (e.g. hsa_allowable_deduction) — disable any rule_id with
        # this prefix that is NOT in this package's rule_ids list.
        "calc_form_8889_hsa_deduction_worksheet_",
    ],
    collide_canonical_targets=[
        "adjustments.health_savings_account_deduction_amount",
        "adjustments.hsa_employer_contribution_amount",
        "adjustments.hsa_limited_contribution_amount",
        "adjustments.total_hsa_contribution_amount",
        "taxes.hsa_distribution_additional_percent_tax_amount",
        "taxes.hdhp_coverage_additional_tax_amount",
    ],
    wrappers_to_revisit=[
        "calc_adjustments_worksheet_hsa_deduction_amount",
        "calc_adjustments_worksheet_total_hsa_contribution_amount",
    ],
    # Scenario prefix owns Lines 3/7/10 inputs; Form 8889 rules must wait for them.
    scenario_rule_dependencies={
        "calc_form_8889_hsa_deduction_worksheet_hsa_limited_deductible_allowed_amount": [
            "calc_scenario_health_savings_account_prorated_limit",
        ],
        "calc_form_8889_hsa_deduction_worksheet_hsa_limited_gross_contribution_amount": [
            "calc_scenario_health_savings_account_additional_contribution_amount",
        ],
        "calc_form_8889_hsa_deduction_worksheet_total_hsa_contribution_amount": [
            "calc_scenario_health_savings_account_qualified_funding_distribution",
        ],
    },
    scenario_computed_field_dependencies={
        "calc_form_8889_hsa_deduction_worksheet_hsa_limited_deductible_allowed_amount": [
            "adjustments.hsa_limited_annual_deductible_amount",
        ],
        "calc_form_8889_hsa_deduction_worksheet_hsa_limited_gross_contribution_amount": [
            "adjustments.hsa_additional_contribution_amount",
        ],
        "calc_form_8889_hsa_deduction_worksheet_total_hsa_contribution_amount": [
            "adjustments.hsa_qualified_funding_distribution_amount",
        ],
    },
    scenarios_do_not_overwrite=[
        "scenario_health_savings_account",
    ],
    open_risks=[
        "Age-55 / married+family catch-up (Line 3 vs Line 7) is closer to form "
        "arithmetic than TaxCore's gaps doc — verify before calling 8889 done.",
        "W-2 Box 12W field is named *_cents in TaxCore; AI_TAX_ENGINE exports "
        "dollars — confirm unit at import smoke test.",
        "Part III L18/L19 exported as mutable inputs (our DB stubs were $0).",
        "Replace old avatar module hsa calc_rules entirely; do not append.",
    ],
)
