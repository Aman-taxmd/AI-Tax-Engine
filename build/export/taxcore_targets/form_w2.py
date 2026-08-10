"""Form W-2 — multi-instance TaxCore export projection.

Our engine keeps parallel list inputs (`intake_w2_*`); TaxCore stores nested
records (`multi_instance.w2_records[]`). This FormSpec projects at export time
only — DB/UI/goldens unchanged.

Box 12W aggregate writer lives in the 8889 package (module `hsa`); this package
owns the record leaf + documents the split.
"""
from __future__ import annotations

from build.export.taxcore_targets.spec import FormSpec

_WORKSHEET = "w2_employer_use_worksheet"

_FIELD_NAME_MAP: dict[str, str] = {
    "intake_w2_box1_wages": "multi_instance.w2_records.wages_amount",
    "intake_w2_box2_fed_withholding": "multi_instance.w2_records.federal_tax_withheld",
    "intake_w2_box3_ss_wages": "multi_instance.w2_records.social_security_wages_amount",
    "intake_w2_box5_medicare_wages": "multi_instance.w2_records.medicare_wages_amount",
    "intake_w2_box12w_hsa_employer_contrib": "multi_instance.w2_records.box12_code_w_amount_cents",
    "intake_w2_employer_name": "multi_instance.w2_records.employer_name",
    "intake_w2_box12_code_w_label": "multi_instance.w2_records.employers_use_code",
}

_FIELD_EXPORT_ORDER: list[str] = [
    "intake_w2_employer_name",
    "intake_w2_box1_wages",
    "intake_w2_box2_fed_withholding",
    "intake_w2_box3_ss_wages",
    "intake_w2_box5_medicare_wages",
    "intake_w2_box12_code_w_label",
    "intake_w2_box12w_hsa_employer_contrib",
]

# TaxCore XSD / form_view (from form_mapping_irs_w2.json).
_FIELD_MAPPING_XSD: dict[str, dict] = {
    "intake_w2_employer_name": {
        "xsd_element": "EmployerName",
        "registry_key": "EmployerName",
        "xsd_path": "IRSW2/EmployerName",
        "xsd_type": "BusinessNameType",
        "parse_strategy": "simple_field",
        "display_label": "Employer name",
        "data_type": "string",
    },
    "intake_w2_box1_wages": {
        "xsd_element": "WagesAmt",
        "registry_key": "WagesAmt",
        "xsd_path": "IRSW2/WagesAmt",
        "xsd_type": "USAmountNNType",
        "parse_strategy": "currency_parser",
        "display_label": "Wages amount",
        "data_type": "currency",
    },
    "intake_w2_box2_fed_withholding": {
        "xsd_element": "WithholdingAmt",
        "registry_key": "WithholdingAmt",
        "xsd_path": "IRSW2/WithholdingAmt",
        "xsd_type": "USAmountType",
        "parse_strategy": "currency_parser",
        "display_label": "Withholding amount",
        "data_type": "currency",
    },
    "intake_w2_box3_ss_wages": {
        "xsd_element": "SocialSecurityWagesAmt",
        "registry_key": "SocialSecurityWagesAmt",
        "xsd_path": "IRSW2/SocialSecurityWagesAmt",
        "xsd_type": "USAmountType",
        "parse_strategy": "currency_parser",
        "display_label": "Social Security wages amount",
        "data_type": "currency",
    },
    "intake_w2_box5_medicare_wages": {
        "xsd_element": "MedicareWagesAndTipsAmt",
        "registry_key": "MedicareWagesAndTipsAmt",
        "xsd_path": "IRSW2/MedicareWagesAndTipsAmt",
        "xsd_type": "USAmountType",
        "parse_strategy": "currency_parser",
        "display_label": "Medicare wages and tips amount",
        "data_type": "currency",
    },
    "intake_w2_box12_code_w_label": {
        "xsd_element": "EmployersUseCd",
        "registry_key": "EmployersUseCd",
        "xsd_path": "IRSW2/EmployersUseGrp/EmployersUseCd",
        "xsd_type": "xsd:string",
        "parse_strategy": "simple_field",
        "display_label": "Employer's Use Code",
        "data_type": "string",
    },
    "intake_w2_box12w_hsa_employer_contrib": {
        "xsd_element": "EmployersUseAmt",
        "registry_key": "EmployersUseAmt",
        "xsd_path": "IRSW2/EmployersUseGrp/EmployersUseAmt",
        "xsd_type": "USAmountNNType",
        "parse_strategy": "currency_parser",
        "display_label": "Employer's Use Amount",
        "data_type": "currency",
        "notes": (
            "Pilot maps Box 12 Code W amount to EmployersUseAmt; full Box 12 "
            "multi-code modeling is out of scope."
        ),
    },
}

_WORKSHEET_FIELDS: dict[str, str] = {
    "aggregate_w2_wages": "currency",
    "aggregate_w2_federal_withholding": "currency",
    "prior_userra_contribution_year": "integer",
    "final_output_field": "income.wages_salaries_tips",
}

_OUTPUT_MAPPINGS = [
    {
        "source": "w2_employer_use_worksheet.aggregate_w2_wages",
        "target": "income.wages_salaries_tips",
    },
    {
        "source": "w2_employer_use_worksheet.aggregate_w2_federal_withholding",
        "target": "payments.w2_withholding_amount",
    },
]

_CALC_RULES_ORDER = [
    "calc_w2_employer_use_worksheet_aggregate_w2_wages",
    "calc_w2_employer_use_worksheet_aggregate_w2_federal_withholding",
]


def _synthetic_rules(tax_year: int) -> list[dict]:
    version = f"{tax_year}.1.0"
    base_meta = {
        "version": version,
        "last_updated": "2026-08-06",
        "source": "AI_TAX_ENGINE",
        "tags": ["w2", "aggregate", "ai_tax_engine"],
        "storage_unit": "dollars",
    }
    return [
        {
            "rule_id": "calc_w2_employer_use_worksheet_aggregate_w2_wages",
            "version": version,
            "description": (
                "Aggregate W-2 Box 1 wages across all employer records and write "
                "total to income.wages_salaries_tips (Form 1040 Line 1a feed)."
            ),
            "output_field": "w2_employer_use_worksheet.aggregate_w2_wages",
            "canonical_target": "income.wages_salaries_tips",
            "formula": {
                "type": "aggregate",
                "source": "multi_instance.w2_records",
                "field_path": "wages_amount",
                "aggregate_operation": "sum",
            },
            "dependencies": {
                "required_rules": [],
                "required_mutable_fields": [],
                "required_computed_fields": [],
                "required_schedule_types": [],
                "optional_fields": [],
            },
            "execution_priority": 0,
            "filing_status_applicable": [],
            "validation": {"min_value": 0, "must_be_positive": True},
            "irs_reference": "Form 1040, Line 1a",
            "metadata": {
                **base_meta,
                "source_rule_id": "form_1040_line_1a",
                "translation_notes": [
                    "Our engine uses sum_instances over intake_w2_box1_wages; "
                    "TaxCore uses aggregate over multi_instance.w2_records.wages_amount.",
                ],
            },
        },
        {
            "rule_id": "calc_w2_employer_use_worksheet_aggregate_w2_federal_withholding",
            "version": version,
            "description": (
                "Aggregate W-2 Box 2 federal withholding across all employer records "
                "and write total to payments.w2_withholding_amount (Form 1040 Line 25a feed)."
            ),
            "output_field": "w2_employer_use_worksheet.aggregate_w2_federal_withholding",
            "canonical_target": "payments.w2_withholding_amount",
            "formula": {
                "type": "aggregate",
                "source": "multi_instance.w2_records",
                "field_path": "federal_tax_withheld",
                "aggregate_operation": "sum",
            },
            "dependencies": {
                "required_rules": [],
                "required_mutable_fields": [],
                "required_computed_fields": [],
                "required_schedule_types": [],
                "optional_fields": [],
            },
            "execution_priority": 0,
            "filing_status_applicable": [],
            "validation": {"min_value": 0, "must_be_positive": True},
            "irs_reference": "Form 1040, Line 25a",
            "metadata": {
                **base_meta,
                "source_rule_id": "form_1040_line_25a",
                "translation_notes": [
                    "Our engine uses sum_instances over intake_w2_box2_fed_withholding; "
                    "TaxCore uses aggregate over multi_instance.w2_records.federal_tax_withheld.",
                ],
            },
        },
    ]


# Resolved at import time; tax_year applied in exporter via synthetic_rules_factory.
SPEC_W2 = FormSpec(
    form="w2",
    form_type="irs_w2",
    display_label="W-2 Wage Income",
    module_id="w2_income",
    worksheet_key=_WORKSHEET,
    rule_id_template="calc_w2_employer_use_worksheet_{leaf}",
    worksheet_fields=_WORKSHEET_FIELDS,
    source_field_pattern="intake_w2_%",
    field_name_map=_FIELD_NAME_MAP,
    field_export_order=_FIELD_EXPORT_ORDER,
    field_mapping_xsd=_FIELD_MAPPING_XSD,
    export_db_rules=False,
    instance_type="multi",
    multi_instance_key="w2_records",
    form_mapping_merge_mode="upsert_by_canonical_field",
    calculation_schema_merge_mode="upsert_worksheet_leaves",
    module_description=(
        "One record per employer W-2. Aggregated Box 1 → income.wages_salaries_tips; "
        "Box 2 → payments.w2_withholding_amount (AI_TAX_ENGINE projection)."
    ),
    import_decision=(
        "REPLACE w2_income module aggregate rules for wages/withholding; MERGE "
        "form_mapping and metadata by canonical_field (pilot 7 leaves only). "
        "Do NOT wipe TaxCore's other ~41 W-2 leaves. Leave USERRA rule alone. "
        "Box 12W HSA aggregate writer stays in 8889/hsa package."
    ),
    canonical_inputs=list(_FIELD_NAME_MAP.values()),
    must_promote=[
        "income.wages_salaries_tips",
        "payments.w2_withholding_amount",
    ],
    output_mappings=_OUTPUT_MAPPINGS,
    calc_rules_order=_CALC_RULES_ORDER,
    synthetic_rules=_synthetic_rules(2025),
    metadata_overrides={
        "multi_instance.w2_records.wages_amount": {
            "mutable": True,
            "source": "document_extraction",
            "question_type": "currency",
            "document_source": "W-2 Wage and Tax Statement",
            "can_skip_if_document": True,
            "aggregation_method": "sum",
            "aggregation_target": "income.wages_salaries_tips",
            "storage_unit": "dollars",
        },
        "multi_instance.w2_records.federal_tax_withheld": {
            "mutable": False,
            "source": "document_extraction",
            "question_type": "currency",
            "document_source": "W-2 Wage and Tax Statement",
            "can_skip_if_document": True,
            "aggregation_method": "sum",
            "aggregation_target": "payments.w2_withholding_amount",
            "storage_unit": "dollars",
        },
        "multi_instance.w2_records.employer_name": {
            "mutable": True,
            "source": "document_extraction",
            "question_type": "text",
            "document_source": "W-2 Wage and Tax Statement",
            "can_skip_if_document": True,
        },
        "multi_instance.w2_records.box12_code_w_amount_cents": {
            "mutable": False,
            "source": "document_extraction",
            "question_type": "currency",
            "document_source": "W-2 Wage and Tax Statement",
            "storage_unit": "dollars",
            "notes": (
                "Field name says cents; AI_TAX_ENGINE stores dollars. HSA aggregate "
                "writer is in 8889 export (module hsa), not duplicated here."
            ),
        },
    },
    extra_metadata_fields={
        "multi_instance.w2_records": {
            "mutable": True,
            "source": "document_extraction",
            "section": "multi_instance",
            "question_type": "repeatable_group",
            "display_label": "W-2 records",
            "document_source": "W2",
            "can_skip_if_document": True,
            "is_array_field": True,
            "storage_unit": None,
            "computed_by": None,
            "bookmarkable": True,
            "gdpr_erasure_category": "financial",
            "irs_pub_1075_fti": True,
        },
        "income.wages_salaries_tips": {
            "mutable": True,
            "source": "user_input",
            "section": "income",
            "question_type": "currency",
            "display_label": "Wages, salaries, tips",
            "storage_unit": "dollars",
            "computed_by": "calc_w2_employer_use_worksheet_aggregate_w2_wages",
            "notes": "Promoted from w2_employer_use_worksheet; also metadata-aggregated in TaxCore.",
        },
        "payments.w2_withholding_amount": {
            "mutable": False,
            "source": "calculated",
            "section": "payments",
            "question_type": "currency",
            "display_label": "W-2 federal withholding",
            "storage_unit": "dollars",
            "computed_by": "calc_w2_employer_use_worksheet_aggregate_w2_federal_withholding",
        },
    },
    canonical_schema_additions={
        "multi_instance": {
            "w2_records": {
                "wages_amount": "currency",
                "federal_tax_withheld": "currency",
                "social_security_wages_amount": "currency",
                "medicare_wages_amount": "currency",
                "box12_code_w_amount_cents": "currency",
                "employer_name": "string",
                "employers_use_code": "string",
            },
        },
        "income": {
            "wages_salaries_tips": "currency",
        },
        "payments": {
            "w2_withholding_amount": "currency",
        },
    },
    retire_rule_id_prefixes=[
        "calc_w2_employer_use_worksheet_aggregate_w2_wages",
    ],
    collide_canonical_targets=[
        "income.wages_salaries_tips",
        "payments.w2_withholding_amount",
    ],
    wrappers_to_revisit=[],
    scenarios_do_not_overwrite=[],
    open_risks=[
        "Pilot covers 7 intake fields only; TaxCore has ~41 W-2 leaves — merge, don't replace.",
        "box12_code_w_amount_cents naming vs dollars storage — confirm at TaxCore smoke test.",
        "Box 12W aggregate rule lives in 8889/hsa export; do not duplicate on import.",
        "USERRA prior_userra_contribution_year rule left to existing TaxCore chain.",
        "Our engine still uses intake_w2_* lists; this package is export projection only.",
    ],
    target_tree_extras={
        "multi_instance_key": "w2_records",
        "source_field_pattern": "intake_w2_%",
        "field_name_map": _FIELD_NAME_MAP,
        "box12w_aggregate_owned_by": "8889/module_hsa",
    },
)
