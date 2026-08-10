"""Schedule C (Form 1040) — TaxCore export projection.

Pilot: net profit chain (lines 3–31) with standard mileage line 9,
Part V carryovers (4, 27b), and explicit $0 stubs for COGS (42) and
home office (30).
"""
from __future__ import annotations

from build.export.taxcore_targets.spec import FormSpec

_WS = "schedule_c_net_profit_worksheet"

_FIELD_NAME_MAP: dict[str, str] = {
    "form_1040sc_line_1": f"{_WS}.gross_receipts_or_sales",
    "form_1040sc_line_2": f"{_WS}.returns_and_allowances",
    "form_1040sc_line_3": f"{_WS}.net_receipts",
    "form_1040sc_line_4": f"{_WS}.cost_of_goods_sold",
    "form_1040sc_line_5": f"{_WS}.gross_profit",
    "form_1040sc_line_6": f"{_WS}.other_business_income",
    "form_1040sc_line_7": f"{_WS}.total_gross_income",
    "form_1040sc_line_8": f"{_WS}.advertising_expense",
    "form_1040sc_line_9": f"{_WS}.car_and_truck_expense",
    "form_1040sc_line_10": f"{_WS}.commissions_fees_expense",
    "form_1040sc_line_11": f"{_WS}.contract_labor_expense",
    "form_1040sc_line_12": f"{_WS}.depletion_expense",
    "form_1040sc_line_13": f"{_WS}.depreciation_section_179",
    "form_1040sc_line_14": f"{_WS}.employee_benefit_programs",
    "form_1040sc_line_15": f"{_WS}.insurance_other_than_health",
    "form_1040sc_line_16a": f"{_WS}.mortgage_interest_expense",
    "form_1040sc_line_16b": f"{_WS}.other_interest_expense",
    "form_1040sc_line_17": f"{_WS}.legal_and_professional_fees",
    "form_1040sc_line_18": f"{_WS}.office_expense",
    "form_1040sc_line_19": f"{_WS}.pension_profit_sharing_plans",
    "form_1040sc_line_20a": f"{_WS}.rent_lease_vehicles_equipment",
    "form_1040sc_line_20b": f"{_WS}.rent_lease_other_property",
    "form_1040sc_line_21": f"{_WS}.repairs_and_maintenance",
    "form_1040sc_line_22": f"{_WS}.supplies_expense",
    "form_1040sc_line_23": f"{_WS}.taxes_and_licenses",
    "form_1040sc_line_24a": f"{_WS}.travel_expense",
    "form_1040sc_line_24b": f"{_WS}.meals_deduction",
    "form_1040sc_line_25": f"{_WS}.utilities_expense",
    "form_1040sc_line_26": f"{_WS}.wages_expense",
    "form_1040sc_line_27a": f"{_WS}.energy_efficient_buildings_deduction",
    "form_1040sc_line_27b": f"{_WS}.other_expenses",
    "form_1040sc_line_28": f"{_WS}.total_expenses",
    "form_1040sc_line_29": f"{_WS}.tentative_profit_loss",
    "form_1040sc_line_30": f"{_WS}.home_office_deduction",
    "form_1040sc_line_31": "income.schedule_c_net_profit_amount",
    "form_1040sc_line_42": f"{_WS}.other_expenses_detail_total",
    "form_1040sc_line_44a": "income.business_miles_count",
}

_CROSS_FORM_FIELD_MAP: dict[str, str] = {
    "form_1040sc_line_42": f"{_WS}.other_expenses_detail_total",
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
    "form_1040sc_line_3": _proj(
        "calc_schedule_c_net_profit_worksheet_net_receipts", "net_receipts", None
    ),
    "form_1040sc_line_5": _proj(
        "calc_schedule_c_net_profit_worksheet_gross_profit",
        "gross_profit",
        "income.gross_profit_amount",
    ),
    "form_1040sc_line_7": _proj(
        "calc_schedule_c_net_profit_worksheet_total_gross_income",
        "total_gross_income",
        None,
    ),
    "form_1040sc_line_28": _proj(
        "calc_schedule_c_net_profit_worksheet_total_expenses",
        "total_expenses",
        "income.operating_expenses_amount",
    ),
    "form_1040sc_line_29": _proj(
        "calc_schedule_c_net_profit_worksheet_tentative_profit_loss",
        "tentative_profit_loss",
        None,
    ),
    "form_1040sc_line_31": _proj(
        "calc_schedule_c_net_profit_worksheet_net_profit_loss",
        "net_profit_loss",
        "income.schedule_c_net_profit_amount",
    ),
}

_WORKSHEET_FIELDS: dict[str, str] = {
    "gross_receipts_or_sales": "currency",
    "returns_and_allowances": "currency",
    "net_receipts": "currency",
    "cost_of_goods_sold": "currency",
    "gross_profit": "currency",
    "other_business_income": "currency",
    "total_gross_income": "currency",
    "advertising_expense": "currency",
    "car_and_truck_expense": "currency",
    "total_expenses": "currency",
    "tentative_profit_loss": "currency",
    "home_office_deduction": "currency",
    "net_profit_loss": "currency",
    "other_expenses": "currency",
    "final_output_field": "income.schedule_c_net_profit_amount",
}

_SKIP_STUB = frozenset({"form_1040sc_line_30", "form_1040sc_line_42"})

_CALC_RULES_ORDER = [
    "calc_schedule_c_net_profit_worksheet_net_receipts",
    "calc_schedule_c_net_profit_worksheet_gross_profit",
    "calc_schedule_c_net_profit_worksheet_total_gross_income",
    "calc_schedule_c_net_profit_worksheet_total_expenses",
    "calc_schedule_c_net_profit_worksheet_tentative_profit_loss",
    "calc_schedule_c_net_profit_worksheet_net_profit_loss",
]

SPEC_1040SC = FormSpec(
    form="1040sc",
    form_type="irs_1040_schedule_c",
    display_label="Schedule C (Form 1040)",
    module_id="schedule_c",
    worksheet_key=_WS,
    worksheet_fields=_WORKSHEET_FIELDS,
    field_name_map=_FIELD_NAME_MAP,
    cross_form_field_map=_CROSS_FORM_FIELD_MAP,
    rule_projections=_RULE_PROJECTIONS,
    skip_stub_rule_ids=_SKIP_STUB,
    calculation_schema_merge_mode="upsert_worksheet_leaves",
    form_mapping_merge_mode="upsert_by_canonical_field",
    module_description=(
        "Schedule C pilot: sole-prop net profit/loss chain (AI_TAX_ENGINE projection)."
    ),
    import_decision=(
        "REPLACE schedule_c calc_rules for this pilot chain; MERGE form_mapping "
        "by canonical_field. COGS (L42) and home office (L30) export as skipped "
        "$0 stubs."
    ),
    canonical_inputs=[
        f"{_WS}.gross_receipts_or_sales",
        f"{_WS}.returns_and_allowances",
        f"{_WS}.other_business_income",
        "income.business_miles_count",
    ],
    must_promote=["income.schedule_c_net_profit_amount"],
    output_mappings=[
        {"source": f"{_WS}.net_profit_loss", "target": "income.schedule_c_net_profit_amount"},
    ],
    calc_rules_order=_CALC_RULES_ORDER,
    canonical_schema_additions={
        "income": {
            "schedule_c_net_profit_amount": "currency",
            "gross_profit_amount": "currency",
            "operating_expenses_amount": "currency",
            "business_miles_count": "currency",
        },
    },
    metadata_overrides={
        "income.schedule_c_net_profit_amount": {
            "computed_by": "calc_schedule_c_net_profit_worksheet_net_profit_loss",
        },
    },
    retire_rule_id_prefixes=["calc_schedule_c_net_profit_worksheet_"],
    collide_canonical_targets=["income.schedule_c_net_profit_amount"],
    open_risks=[
        "Export projection only — DB/UI/goldens keep form_1040sc_line_* names.",
        "Line 9: business miles × $0.70 standard rate (2025).",
        "Lines 30/42 constant-$0 stubs (home office / COGS deferred).",
        "Line 28 sums Part II expenses; TaxCore total_expenses uses a narrower leaf set.",
    ],
    target_tree_extras={
        "field_name_map": _FIELD_NAME_MAP,
        "skipped_stub_rules": list(_SKIP_STUB),
    },
)
