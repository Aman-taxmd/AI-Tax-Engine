"""Build machine-readable taxcore_adapter/{form}.json import contracts."""
from __future__ import annotations

import json
from pathlib import Path
from typing import Any

from build.export.taxcore_adapter.overrides import TAXCORE_RUNTIME_OVERRIDES
from build.export.taxcore_targets import get_form_spec
from build.export.taxcore_targets.spec import FormSpec

CONTRACT_VERSION = "1.0.0"

_FORM_RULE_PREFIXES: dict[str, str] = {
    "w2": "calc_w2_",
    "8889": "calc_form_8889_",
    "1040": "calc_form_1040_",
}


def _form_mapping_target(spec: FormSpec) -> str:
    return f"data/schema/canonical/form_mappings/form_mapping_{spec.form_type}.json"


def _artifact_contract(spec: FormSpec, *, tax_year: int) -> dict[str, Any]:
    """Files the TaxCore importer may copy — scoped per form."""
    year_suffix = str(tax_year + 1)  # TaxCore disk uses filing-year+1 slice (2025 → _2026)
    mapping_mode = spec.form_mapping_merge_mode
    return {
        "calculation_rules": {
            "action": "copy_additive",
            "source_dir": "calculation_rules/",
            "source_glob": f"{_FORM_RULE_PREFIXES.get(spec.form, f'calc_form_{spec.form}_')}*.json",
            "target_dir": "data/schema/rules",
            "description": "Upsert rule JSON; never delete unrelated TaxCore-authored rules.",
        },
        "form_mapping": {
            "action": "copy_replace" if mapping_mode == "replace" else "copy_merged",
            "source": f"form_mappings/form_mapping_{spec.form_type}.json",
            "target": _form_mapping_target(spec),
            "merge_mode": mapping_mode,
            "description": (
                "Bundle file is already baseline-merged when export used --taxcore-root."
            ),
        },
        "calculation_schema": {
            "action": "copy_replace_whole_file",
            "source": "calculation_schema.json",
            "target": f"data/schema/canonical/calculation_schema_{year_suffix}.json",
            "scope": f"worksheet key {spec.worksheet_key!r} (+ cross-form merge in bundle)",
            "description": (
                "Whole-file replace for load_schemas --type calculation-schema. "
                "Bundle merged TaxCore baseline + this form's patch."
            ),
        },
        "canonical_schema": {
            "action": "copy_replace_whole_file",
            "source": "canonical_schema.json",
            "target": f"data/schema/canonical/canonical_schema_{year_suffix}.json",
            "description": "Bundle merged baseline + canonical_schema_patch leaves.",
        },
        "field_metadata": {
            "action": "copy_replace_whole_file",
            "source": "field_metadata.json",
            "target": f"data/schema/canonical/canonical_field_metadata_{year_suffix}.json",
            "description": "Bundle merged baseline + canonical_field_metadata_patch fields.",
        },
    }


def build_form_adapter(
    form: str,
    *,
    tax_year: int,
    bundle_rule_ids: list[str] | None = None,
) -> dict[str, Any]:
    """Return import contract dict for one form."""
    spec = get_form_spec(form)
    if spec is None:
        raise ValueError(f"No FormSpec for form={form!r}")

    overrides = TAXCORE_RUNTIME_OVERRIDES.get(form, {})
    form_rule_ids = [
        rid
        for rid in (bundle_rule_ids or [])
        if rid.startswith(_FORM_RULE_PREFIXES.get(form, ""))
    ]
    retire_mode = overrides.get("retire_mode", "none")
    retire_prefixes = (
        list(spec.retire_rule_id_prefixes) if retire_mode == "prefix" else []
    )

    adapter: dict[str, Any] = {
        "contract_version": CONTRACT_VERSION,
        "source": "AI_TAX_ENGINE",
        "form": form,
        "tax_year": tax_year,
        "module_id": spec.module_id,
        "decision": spec.import_decision,
        "form_mapping_merge_mode": spec.form_mapping_merge_mode,
        "artifacts": _artifact_contract(spec, tax_year=tax_year),
        "retire_rules": {
            "mode": retire_mode,
            "scan_dir": "data/schema/rules",
            "prefixes": retire_prefixes,
            "keep_rule_ids": form_rule_ids,
            "action": "archive_and_disable_in_place",
            "retired_dir": f"data/schema/rules/_retired/ai_tax_engine/{form}",
            "description": (
                "mode=prefix: archive + enabled:false (full formula preserved) for rules "
                "matching prefixes not in keep_rule_ids. mode=none: skip prefix retire "
                "(pilot upsert only — TaxCore rules outside the bundle stay active)."
            ),
        },
        "collide_canonical_targets": list(spec.collide_canonical_targets),
        "wrappers_to_revisit": list(spec.wrappers_to_revisit),
        "avatar_patches": overrides.get("avatar_patches", []),
        "scenario_patches": overrides.get("scenario_patches", []),
        "scenarios_do_not_overwrite": list(
            spec.scenarios_do_not_overwrite
            or overrides.get("scenarios_do_not_overwrite", [])
        ),
        "do_not_touch": overrides.get("do_not_touch", []),
        "runtime_ownership": overrides.get("runtime_ownership", {}),
        "code_references": overrides.get("code_references", {}),
        "open_risks": list(spec.open_risks),
        "post_import": {
            "load_schemas_types": [
                "rules",
                "forms",
                "canonical-fields",
                "canonical-schema",
                "calculation-schema",
            ],
            "load_schemas_command": (
                "uv run python manage.py load_schemas --update-latest"
            ),
        },
    }
    return adapter


def write_form_adapter(
    form: str,
    out_dir: Path,
    *,
    tax_year: int,
    bundle_rule_ids: list[str] | None = None,
) -> Path:
    payload = build_form_adapter(form, tax_year=tax_year, bundle_rule_ids=bundle_rule_ids)
    out_dir.mkdir(parents=True, exist_ok=True)
    path = out_dir / f"{form}.json"
    path.write_text(json.dumps(payload, indent=2) + "\n")
    return path


def write_bundle_contract(
    bundle_dir: Path,
    *,
    tax_year: int,
    forms: list[str],
    rule_ids: list[str],
) -> Path:
    """Top-level README-style contract for the whole bundle."""
    adapters = {
        form: f"taxcore_adapter/{form}.json" for form in forms
    }
    payload = {
        "contract_version": CONTRACT_VERSION,
        "source": "AI_TAX_ENGINE",
        "tax_year": tax_year,
        "description": (
            "Machine-readable import contract for TaxMD-TaxCore. "
            "Only paths and actions declared in taxcore_adapter/*.json are modified. "
            "IRS-pure AI_TAX_ENGINE engine/DB/goldens are never touched by import."
        ),
        "importer": {
            "taxcore_script": "scripts/import_ai_tax_engine_bundle.py",
            "usage": (
                "python scripts/import_ai_tax_engine_bundle.py "
                f"--bundle {bundle_dir} --forms 8889 --dry-run"
            ),
            "parallel_automation_script": "scripts/deploy_generated_schemas.py",
        },
        "forms": forms,
        "adapters": adapters,
        "rule_ids_total": len(rule_ids),
        "rule_ids": sorted(rule_ids),
        "not_included": {
            "tax_constants": "data/schema/tax_constants/ (TaxCore-owned)",
            "field_registry": "TaxMD-Schema-Automation-New output/registry/ (optional)",
            "scenarios": "Only when explicitly listed in scenario_patches; 8889 is do-not-overwrite",
        },
    }
    path = bundle_dir / "TAXCORE_IMPORT_CONTRACT.json"
    path.write_text(json.dumps(payload, indent=2) + "\n")
    return path
