"""TaxCore runtime overrides — product wiring AI export cannot infer from IRS math.

These patches are merged into ``taxcore_adapter/{form}.json`` in the bundle.
TaxMD-TaxCore's ``import_ai_tax_engine_bundle.py`` executes them verbatim;
nothing outside this contract is modified.
"""
from __future__ import annotations

from typing import Any

# Per-form TaxCore product decisions layered on top of FormSpec import notes.
TAXCORE_RUNTIME_OVERRIDES: dict[str, dict[str, Any]] = {
    "8889": {
        "runtime_ownership": {
            "scenario_health_savings_account.calculation_sequence": (
                "Scenario prefix rules + all calc_form_8889_hsa_deduction_worksheet_* "
                "rules + calc_adjustments_worksheet_hsa_deduction_amount + 1040 cascade. "
                "Owned by TaxCore scenario JSON — importer does NOT rewrite this file."
            ),
            "avatar optional module hsa.calc_rules": (
                "Must stay empty — form registry / required_form_modules UI only."
            ),
            "avatar form_1040_base.calc_rules": (
                "Keeps calc_adjustments_worksheet_hsa_deduction_amount (Schedule 1 "
                "Line 13 slot; reads canonical, default 0 when HSA strategy not applied)."
            ),
            "scenario.form_calculation_sequence": (
                "Must stay empty — scenario inputs must run before Form 8889 rules."
            ),
        },
        "avatar_patches": [
            {
                "module_id": "hsa",
                "apply_to": "all_avatar_files",
                "action": "set_calc_rules",
                "calc_rules": [],
                "description": (
                    "Form 8889 calc runs in scenario_health_savings_account only. "
                    "Do NOT wire module_hsa.json calc_rules into avatar."
                ),
            }
        ],
        "scenario_patches": [],
        "scenarios_do_not_overwrite": ["scenario_health_savings_account"],
        "do_not_touch": [
            "data/schema/scenarios/component/scenario_health_savings_account.json",
            "apps/tax_returns/utils/hdhp_coverage_derivation.py",
            "data/schema/tax_constants/",
        ],
        "code_references": {
            "hdhp_sync": "apps/tax_returns/utils/hdhp_coverage_derivation.py::sync_hdhp_coverage_fields",
            "scenario_file": "data/schema/scenarios/component/scenario_health_savings_account.json",
            "smoke_tests": [
                "apps/calculations/tests/test_hsa_form_field_mapping.py",
                "apps/calculations/tests/test_hsa_contribution_strategy_2025.py",
                "apps/calculations/tests/test_hsa_schedule1_1040_cascade.py",
            ],
        },
        "retire_mode": "prefix",
    },
    "w2": {
        "retire_mode": "none",
        "avatar_patches": [
            {
                "module_id": "w2_income",
                "apply_to": "all_avatar_files",
                "action": "merge_calc_rules_from_module",
                "module_file": "modules/module_w2_income.json",
                "description": (
                    "Merge pilot aggregate rules into w2_income.calc_rules. "
                    "Retire-prefix rules removed; non-conflicting rules (e.g. USERRA) kept."
                ),
            }
        ],
        "scenario_patches": [],
        "scenarios_do_not_overwrite": [],
        "do_not_touch": [
            "data/schema/tax_constants/",
            "8889 Box 12W aggregate rule (owned by 8889 package)",
        ],
        "code_references": {
            "smoke_tests": [],
        },
    },
    "1040": {
        "retire_mode": "none",
        "avatar_patches": [
            {
                "module_id": "form_1040_base",
                "apply_to": "all_avatar_files",
                "action": "merge_calc_rules_from_module",
                "module_file": "modules/module_form_1040_base.json",
                "description": (
                    "Merge 16 pilot Form 1040 rules into form_1040_base.calc_rules. "
                    "Does NOT wipe ~79 existing TaxCore rules — only retires matching "
                    "worksheet prefixes and upserts pilot rule_ids."
                ),
            }
        ],
        "scenario_patches": [],
        "scenarios_do_not_overwrite": [],
        "do_not_touch": [
            "data/schema/tax_constants/",
            "schedule modules (schedule_2 line 21 operand dependency)",
        ],
        "code_references": {
            "smoke_tests": [],
        },
    },
    "1040s1": {"retire_mode": "none"},
    "1040s1a": {"retire_mode": "none"},
    "1040s2": {"retire_mode": "none"},
    "1040sc": {"retire_mode": "none"},
    "1040sse": {"retire_mode": "none"},
}
