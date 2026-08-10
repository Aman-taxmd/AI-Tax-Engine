"""Schedule SE (Form 1040) — TaxCore export projection.

Pilot: Part I regular-method SE tax (lines 1a–13). Farm/church/optional
methods deferred as explicit $0 stubs. Line 8a aggregates W-2 Box 3 across
instances. Half-SE-tax deduction promotes to adjustments.deductible_self_employment_tax_amount.
"""
from __future__ import annotations

from build.export.taxcore_targets.spec import FormSpec

_SE = "schedule_se_self_employment_tax_worksheet"
_DED = "schedule_se_deductible_portion_worksheet"

_FIELD_NAME_MAP: dict[str, str] = {
    "form_1040sse_line_1a": f"{_SE}.schedule_f_net_profit_amount",
    "form_1040sse_line_1b": f"{_SE}.conservation_reserve_program_amount",
    "form_1040sse_line_2": f"{_SE}.schedule_c_net_profit_amount",
    "form_1040sse_line_3": f"{_SE}.total_self_employment_income_amount",
    "form_1040sse_line_4a": f"{_SE}.net_se_income_amount",
    "form_1040sse_line_4b": f"{_SE}.optional_method_amount",
    "form_1040sse_line_4c": f"{_SE}.combined_net_earnings_amount",
    "form_1040sse_line_5a": f"{_SE}.church_employee_income_amount",
    "form_1040sse_line_5b": f"{_SE}.church_employee_net_earnings_amount",
    "form_1040sse_line_6": f"{_SE}.se_taxable_income_amount",
    "form_1040sse_line_7": f"{_SE}.oasdi_wage_base_amount",
    "form_1040sse_line_8a": f"{_SE}.total_social_security_wages_amount",
    "form_1040sse_line_8b": f"{_SE}.unreported_tips_amount",
    "form_1040sse_line_8c": f"{_SE}.form_8919_wages_amount",
    "form_1040sse_line_8d": f"{_SE}.combined_ss_wages_amount",
    "form_1040sse_line_9": f"{_SE}.remaining_oasdi_base_amount",
    "form_1040sse_line_10": f"{_SE}.oasdi_tax_amount",
    "form_1040sse_line_11": f"{_SE}.medicare_tax_amount",
    "form_1040sse_line_12": "taxes.self_employment_tax_amount",
    "form_1040sse_line_13": "adjustments.deductible_self_employment_tax_amount",
}

_CROSS_FORM_FIELD_MAP: dict[str, str] = {
    "form_1040sc_line_31": "income.schedule_c_net_profit_amount",
    "intake_w2_box3_ss_wages": "multi_instance.w2_records.social_security_wages_amount",
}

_FORMULA_OVERRIDES: dict[str, dict] = {
    "form_1040sse_line_13": {
        "type": "multiply",
        "operands": [
            {
                "type": "field",
                "field": "taxes.self_employment_tax_amount",
                "default_value": 0,
            },
            {"type": "constant", "constant": 0.5},
        ],
        "rounding": "nearest",
        "decimal_places": 0,
    },
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
    "form_1040sse_line_2": _proj(
        "calc_schedule_se_self_employment_tax_worksheet_schedule_c_net_profit_amount",
        _SE,
        "schedule_c_net_profit_amount",
        None,
    ),
    "form_1040sse_line_3": _proj(
        "calc_schedule_se_self_employment_tax_worksheet_total_self_employment_income_amount",
        _SE,
        "total_self_employment_income_amount",
        "income.total_self_employment_income_amount",
    ),
    "form_1040sse_line_12": _proj(
        "calc_schedule_se_self_employment_tax_worksheet_total_self_employment_tax_amount",
        _SE,
        "total_self_employment_tax_amount",
        "taxes.self_employment_tax_amount",
    ),
    "form_1040sse_line_13": _proj(
        "calc_schedule_se_deductible_portion_worksheet_deductible_self_employment_tax_amount",
        _DED,
        "deductible_self_employment_tax_amount",
        "adjustments.deductible_self_employment_tax_amount",
    ),
}

_WORKSHEETS: dict[str, dict[str, str]] = {
    _SE: {
        "schedule_c_net_profit_amount": "currency",
        "total_self_employment_income_amount": "currency",
        "net_se_income_amount": "currency",
        "combined_net_earnings_amount": "currency",
        "se_taxable_income_amount": "currency",
        "oasdi_wage_base_amount": "currency",
        "total_social_security_wages_amount": "currency",
        "combined_ss_wages_amount": "currency",
        "remaining_oasdi_base_amount": "currency",
        "oasdi_tax_amount": "currency",
        "medicare_tax_amount": "currency",
        "total_self_employment_tax_amount": "currency",
        "final_output_field": "taxes.self_employment_tax_amount",
    },
    _DED: {
        "total_self_employment_tax_amount": "currency",
        "deductible_self_employment_tax_amount": "currency",
        "final_output_field": "adjustments.deductible_self_employment_tax_amount",
    },
}

_MUST_PROMOTE = [
    "taxes.self_employment_tax_amount",
    "adjustments.deductible_self_employment_tax_amount",
]

_OUTPUT_MAPPINGS = [
    {
        "source": f"{_SE}.total_self_employment_tax_amount",
        "target": "taxes.self_employment_tax_amount",
    },
    {
        "source": f"{_DED}.deductible_self_employment_tax_amount",
        "target": "adjustments.deductible_self_employment_tax_amount",
    },
]

_SKIP_STUB = frozenset(
    {
        "form_1040sse_line_1a",
        "form_1040sse_line_1b",
        "form_1040sse_line_4b",
        "form_1040sse_line_5a",
        "form_1040sse_line_5b",
        "form_1040sse_line_8b",
        "form_1040sse_line_8c",
    }
)

_SKIP_EXPORT = frozenset({"form_1040s1_line_15"})

_CALC_RULES_ORDER = [
    "calc_schedule_se_self_employment_tax_worksheet_schedule_c_net_profit_amount",
    "calc_schedule_se_self_employment_tax_worksheet_total_self_employment_income_amount",
    "calc_schedule_se_self_employment_tax_worksheet_total_self_employment_tax_amount",
    "calc_schedule_se_deductible_portion_worksheet_deductible_self_employment_tax_amount",
]

SPEC_1040SSE = FormSpec(
    form="1040sse",
    form_type="irs_1040_schedule_se",
    display_label="Schedule SE (Form 1040)",
    module_id="schedule_se",
    worksheet_key=_SE,
    worksheets=_WORKSHEETS,
    field_name_map=_FIELD_NAME_MAP,
    cross_form_field_map=_CROSS_FORM_FIELD_MAP,
    rule_projections=_RULE_PROJECTIONS,
    formula_overrides=_FORMULA_OVERRIDES,
    skip_stub_rule_ids=_SKIP_STUB,
    skip_export_rule_ids=_SKIP_EXPORT,
    calculation_schema_merge_mode="upsert_worksheet_leaves",
    form_mapping_merge_mode="upsert_by_canonical_field",
    module_description=(
        "Schedule SE pilot: regular-method self-employment tax (AI_TAX_ENGINE projection)."
    ),
    import_decision=(
        "REPLACE schedule_se calc_rules for this pilot chain; MERGE form_mapping "
        "by canonical_field. Promotes SE tax + half-SE deduction. Schedule 1 L15 "
        "carryover rule owned by schedule_1 package."
    ),
    canonical_inputs=[],
    must_promote=_MUST_PROMOTE,
    output_mappings=_OUTPUT_MAPPINGS,
    calc_rules_order=_CALC_RULES_ORDER,
    canonical_schema_additions={
        "taxes": {"self_employment_tax_amount": "currency"},
        "adjustments": {"deductible_self_employment_tax_amount": "currency"},
        "income": {"total_self_employment_income_amount": "currency"},
    },
    metadata_overrides={
        "taxes.self_employment_tax_amount": {
            "computed_by": (
                "calc_schedule_se_self_employment_tax_worksheet_total_self_employment_tax_amount"
            ),
        },
        "adjustments.deductible_self_employment_tax_amount": {
            "computed_by": (
                "calc_schedule_se_deductible_portion_worksheet_deductible_self_employment_tax_amount"
            ),
        },
    },
    retire_rule_id_prefixes=[
        "calc_schedule_se_self_employment_tax_worksheet_",
        "calc_schedule_se_deductible_portion_worksheet_",
    ],
    collide_canonical_targets=_MUST_PROMOTE,
    open_risks=[
        "Export projection only — DB/UI/goldens keep form_1040sse_line_* names.",
        "Line-by-line Part I chain; TaxCore uses a simplified SE worksheet model.",
        "Farm/church/optional/4137/8919 paths deferred as $0 stubs.",
        "$400 filing threshold on line 4c not special-cased.",
        "Line 8a sums W-2 Box 3 only (Box 7 tips not modeled).",
        "form_1040s1_line_15 carryover skipped — schedule_1 reads SE canonical path.",
    ],
    target_tree_extras={
        "multi_worksheet": True,
        "worksheet_keys": list(_WORKSHEETS.keys()),
        "field_name_map": _FIELD_NAME_MAP,
        "cross_form_field_map": _CROSS_FORM_FIELD_MAP,
        "skipped_rules": list(_SKIP_EXPORT),
    },
)
