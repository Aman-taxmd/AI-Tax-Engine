"""Aggregate per-form TaxCore export packages into one integration-ready bundle.

Mirrors TaxMD-Schema-Automation-New's ``output/ty{year}/`` layout so TaxCore
can copy flat files + run ``load_schemas`` — without changing our DB, engine,
UI, or goldens (export projection only).

Per-form packages remain under ``output/ty{year}/taxcore/{form}/`` for review.
This module writes ``output/ty{year}/taxcore_bundle/`` with:

  calculation_rules/     flat calc_*.json (additive load)
  form_mappings/         form_mapping_irs_*.json (merged with TaxCore baseline)
  calculation_schema.json
  canonical_schema.json
  field_metadata.json    same content as canonical_field_metadata.json
  modules/               module_*.json (avatar wiring reference)
  taxcore_adapter/       per-form import contracts (machine-readable)
  TAXCORE_IMPORT_CONTRACT.json
  deploy_to_taxcore.sh   invokes TaxCore importer (preferred)
  MANIFEST.json / import_notes.json

Optional ``--taxcore-root`` reads TaxCore's existing ``data/schema/`` as
merge baseline so W-2 / 1040 form_mapping upserts and worksheet leaf upserts
do not wipe unrelated TaxCore fields.
"""
from __future__ import annotations

import json
import shutil
from datetime import date
from pathlib import Path
from typing import Any

from build.export.metadata_merge import (
    finalize_repeatable_groups,
    merge_metadata_field_entry,
    merge_metadata_fields,
    w2_child_order_from_spec,
)
from build.export.taxcore_adapter.build_adapter import (
    write_bundle_contract,
    write_form_adapter,
)
from build.export.taxcore_export import run_taxcore_export
from build.export.taxcore_targets import SPECS, get_form_spec

OUTPUT_ROOT = Path(__file__).resolve().parent.parent.parent / "output"

# Cross-form import order (W-2 aggregates feed 1040 / 8889; schedules feed 1040).
BUNDLE_FORM_ORDER: tuple[str, ...] = (
    "w2",
    "8889",
    "1040sc",
    "1040sse",
    "1040s1",
    "1040s2",
    "1040s1a",
    "1040",
)


def _default_taxcore_root() -> Path | None:
    sibling = OUTPUT_ROOT.parent / "TaxMD-TaxCore"
    if sibling.is_dir() and (sibling / "data" / "schema").is_dir():
        return sibling
    return None


def _load_json(path: Path) -> dict:
    return json.loads(path.read_text())


def _write_json(path: Path, payload: dict) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(json.dumps(payload, indent=2) + "\n")


def _find_baseline_file(canonical_dir: Path, stem: str, tax_year: int) -> Path | None:
    """Pick TaxCore canonical file, skipping patch/generated names."""
    candidates: list[Path] = [
        canonical_dir / f"{stem}_{tax_year}.json",
        canonical_dir / f"{stem}_2026.json",
    ]
    candidates.extend(sorted(canonical_dir.glob(f"{stem}*.json")))
    seen: set[Path] = set()
    for path in candidates:
        if path in seen or not path.is_file():
            continue
        seen.add(path)
        name = path.name.lower()
        if "patch" in name or "generated" in name or "bridge" in name:
            continue
        return path
    return None


def _metadata_archive_dirs(taxcore_root: Path, tax_year: int) -> list[Path]:
    """TaxCore year-stamped canonical dirs (often richer than live schema copy)."""
    dirs: list[Path] = []
    for suffix in (str(tax_year), "2026", "2025"):
        path = taxcore_root / "data" / suffix / "canonical"
        if path.is_dir() and path not in dirs:
            dirs.append(path)
    return dirs


def _enrich_repeatable_group_children(
    fields: dict[str, Any],
    taxcore_root: Path,
    tax_year: int,
) -> dict[str, Any]:
    """Restore nested ``children[]`` from TaxCore archive when live schema stripped them."""
    out = dict(fields)
    for archive_dir in _metadata_archive_dirs(taxcore_root, tax_year):
        meta_path = _find_baseline_file(
            archive_dir, "canonical_field_metadata", tax_year
        )
        if meta_path is None:
            continue
        archive_fields = _load_json(meta_path).get("fields") or {}
        for key, archive_meta in archive_fields.items():
            if not isinstance(archive_meta, dict):
                continue
            if archive_meta.get("question_type") != "repeatable_group":
                continue
            if not archive_meta.get("children"):
                continue
            existing = out.get(key)
            if isinstance(existing, dict) and existing.get("children"):
                continue
            out[key] = merge_metadata_field_entry(
                archive_meta,
                existing if isinstance(existing, dict) else {},
            )
    return out


def _merge_worksheet_structure(
    base_structure: dict[str, Any],
    patch_structure: dict[str, Any],
    merge_mode: str,
) -> dict[str, Any]:
    out = dict(base_structure)
    for ws_key, ws_leaves in patch_structure.items():
        if merge_mode == "upsert_worksheet_leaves" and ws_key in out:
            merged = dict(out[ws_key]) if isinstance(out[ws_key], dict) else {}
            merged.update(ws_leaves)
            out[ws_key] = merged
        else:
            out[ws_key] = dict(ws_leaves)
    return out


def _deep_upsert_leaves(base: dict, patch: dict) -> dict:
    out = json.loads(json.dumps(base))
    for section, leaves in patch.items():
        if section not in out:
            out[section] = leaves
            continue
        if isinstance(out[section], dict) and isinstance(leaves, dict):
            section_out = dict(out[section])
            for leaf_key, leaf_val in leaves.items():
                if isinstance(leaf_val, dict) and isinstance(section_out.get(leaf_key), dict):
                    section_out[leaf_key] = {**section_out[leaf_key], **leaf_val}
                else:
                    section_out[leaf_key] = leaf_val
            out[section] = section_out
        else:
            out[section] = leaves
    return out


def _upsert_field_mappings(
    base_entries: list[dict],
    patch_entries: list[dict],
) -> list[dict]:
    by_field = {e["canonical_field"]: e for e in base_entries}
    for entry in patch_entries:
        by_field[entry["canonical_field"]] = entry
    # Preserve baseline order, append new keys from patch at end.
    ordered_keys = [e["canonical_field"] for e in base_entries]
    for key in by_field:
        if key not in ordered_keys:
            ordered_keys.append(key)
    return [by_field[k] for k in ordered_keys if k in by_field]


def _merge_form_mapping(
    baseline: dict | None,
    exported: dict,
    merge_mode: str,
) -> dict:
    if baseline is None or merge_mode == "replace":
        return json.loads(json.dumps(exported))
    merged = json.loads(json.dumps(baseline))
    merged["field_mappings"] = _upsert_field_mappings(
        list(baseline.get("field_mappings") or []),
        list(exported.get("field_mappings") or []),
    )
    for key in ("metadata", "tax_year", "irs_schema_version"):
        if key in exported:
            merged[key] = exported[key]
    if exported.get("metadata"):
        merged["metadata"] = {
            **(baseline.get("metadata") or {}),
            **exported["metadata"],
            "ai_tax_engine_merge": merge_mode,
        }
    return merged


def _form_mapping_baseline_path(
    taxcore_root: Path | None,
    form_id: str,
) -> Path | None:
    if taxcore_root is None:
        return None
    mappings_dir = taxcore_root / "data" / "schema" / "canonical" / "form_mappings"
    for name in (f"form_mapping_{form_id}.json", f"form_mapping_irs_{form_id.replace('irs_', '')}.json"):
        path = mappings_dir / name
        if path.is_file():
            return path
    # form_id like irs_w2 -> form_mapping_irs_w2.json
    path = mappings_dir / f"form_mapping_{form_id}.json"
    return path if path.is_file() else None


def _write_deploy_script(bundle_dir: Path, tax_year: int) -> None:
    script = f"""#!/usr/bin/env bash
# Import AI_TAX_ENGINE taxcore_bundle into TaxMD-TaxCore via manifest-driven importer.
# Usage: ./deploy_to_taxcore.sh [TAXCORE_ROOT] [FORM ...]
#   ./deploy_to_taxcore.sh ../TaxMD-TaxCore 8889
#   ./deploy_to_taxcore.sh ../TaxMD-TaxCore          # all forms in bundle
set -euo pipefail

BUNDLE_DIR="$(cd "$(dirname "${{BASH_SOURCE[0]}}")" && pwd)"
TAXCORE_ROOT="${{1:-../TaxMD-TaxCore}}"
shift || true
FORMS=("$@")

if [[ ! -d "${{TAXCORE_ROOT}}/data/schema" ]]; then
  echo "TaxCore schema dir not found: ${{TAXCORE_ROOT}}/data/schema" >&2
  exit 1
fi

IMPORTER="${{TAXCORE_ROOT}}/scripts/import_ai_tax_engine_bundle.py"
if [[ ! -f "${{IMPORTER}}" ]]; then
  echo "TaxCore importer not found: ${{IMPORTER}}" >&2
  echo "Run from a TaxCore checkout that includes scripts/import_ai_tax_engine_bundle.py" >&2
  exit 1
fi

if ((${{#FORMS[@]}} == 0)); then
  echo "WARNING: no forms specified — importing entire bundle." >&2
  echo "         Prefer: ./deploy_to_taxcore.sh ${{TAXCORE_ROOT}} 8889" >&2
fi

CMD=(python "${{IMPORTER}}" --bundle "${{BUNDLE_DIR}}" --load-schemas)
if ((${{#FORMS[@]}})); then
  CMD+=(--forms "${{FORMS[@]}}")
fi

echo "Importing AI_TAX_ENGINE bundle (ty{tax_year}) -> ${{TAXCORE_ROOT}}"
echo "  contract: ${{BUNDLE_DIR}}/TAXCORE_IMPORT_CONTRACT.json"
echo "  command: ${{CMD[*]}}"
"${{CMD[@]}}"
"""
    path = bundle_dir / "deploy_to_taxcore.sh"
    path.write_text(script)
    path.chmod(0o755)


def run_taxcore_bundle(
    tax_year: int = 2025,
    *,
    taxcore_root: Path | None = None,
    forms: list[str] | None = None,
    skip_per_form_export: bool = False,
) -> Path:
    """Export all forms (unless skipped) and write integration bundle."""
    root = taxcore_root if taxcore_root is not None else _default_taxcore_root()
    form_list = forms or [f for f in BUNDLE_FORM_ORDER if f in SPECS]
    for f in form_list:
        if f not in SPECS:
            raise ValueError(f"No FormSpec registered for form={f!r}")

    per_form_root = OUTPUT_ROOT / f"ty{tax_year}" / "taxcore"
    bundle_dir = OUTPUT_ROOT / f"ty{tax_year}" / "taxcore_bundle"
    if bundle_dir.exists():
        shutil.rmtree(bundle_dir)
    rules_out = bundle_dir / "calculation_rules"
    mappings_out = bundle_dir / "form_mappings"
    modules_out = bundle_dir / "modules"
    rules_out.mkdir(parents=True)
    mappings_out.mkdir(parents=True)
    modules_out.mkdir(parents=True)

    if not skip_per_form_export:
        for form in form_list:
            run_taxcore_export(form, tax_year)

    canonical_baseline_dir = (
        root / "data" / "schema" / "canonical" if root is not None else None
    )
    calc_base: dict[str, Any] = {}
    canon_base: dict[str, Any] = {"structure": {}}
    meta_fields: dict[str, Any] = {}

    if canonical_baseline_dir is not None:
        calc_path = _find_baseline_file(canonical_baseline_dir, "calculation_schema", tax_year)
        canon_path = _find_baseline_file(canonical_baseline_dir, "canonical_schema", tax_year)
        meta_path = _find_baseline_file(
            canonical_baseline_dir, "canonical_field_metadata", tax_year
        )
        if calc_path is not None:
            calc_base = _load_json(calc_path)
        if canon_path is not None:
            canon_base = _load_json(canon_path)
        if meta_path is not None:
            meta_fields = dict(_load_json(meta_path).get("fields") or {})
        if root is not None:
            meta_fields = _enrich_repeatable_group_children(
                meta_fields, root, tax_year
            )

    all_rule_ids: list[str] = []
    form_summaries: list[dict] = []
    import_notes_by_form: dict[str, dict] = {}
    retire_prefixes: list[str] = []
    open_risks: list[str] = []

    for form in form_list:
        spec = get_form_spec(form)
        form_dir = per_form_root / form
        if not form_dir.is_dir():
            raise FileNotFoundError(f"Missing per-form export: {form_dir}")

        rule_files = sorted((form_dir / "rules").glob("*.json"))
        for src in rule_files:
            shutil.copy2(src, rules_out / src.name)
            all_rule_ids.append(_load_json(src)["rule_id"])

        form_id = spec.form_type if spec else f"irs_{form}"
        exported_mapping_path = form_dir / f"form_mapping_{form_id}.json"
        exported_mapping = _load_json(exported_mapping_path)
        merge_mode = spec.form_mapping_merge_mode if spec else "replace"
        baseline_path = _form_mapping_baseline_path(root, form_id)
        baseline_mapping = (
            _load_json(baseline_path) if baseline_path is not None else None
        )
        merged_mapping = _merge_form_mapping(
            baseline_mapping, exported_mapping, merge_mode
        )
        mapping_name = exported_mapping_path.name
        _write_json(mappings_out / mapping_name, merged_mapping)

        calc_patch_path = form_dir / f"calculation_schema_patch_{form}.json"
        if calc_patch_path.is_file():
            patch = _load_json(calc_patch_path)
            structure = calc_base.setdefault("structure", {})
            calc_base["structure"] = _merge_worksheet_structure(
                structure,
                patch.get("structure") or {},
                patch.get("merge_mode", "replace_worksheet_key"),
            )

        canon_patch_path = form_dir / f"canonical_schema_patch_{form}.json"
        if canon_patch_path.is_file():
            patch = _load_json(canon_patch_path)
            canon_base["structure"] = _deep_upsert_leaves(
                canon_base.get("structure") or {},
                patch.get("structure") or {},
            )

        meta_patch_path = form_dir / f"canonical_field_metadata_patch_{form}.json"
        if meta_patch_path.is_file():
            patch_fields = _load_json(meta_patch_path).get("fields") or {}
            meta_fields = merge_metadata_fields(meta_fields, patch_fields)

        module_files = list(form_dir.glob("module_*.json"))
        for mod in module_files:
            shutil.copy2(mod, modules_out / mod.name)

        notes_path = form_dir / f"import_notes_{form}.json"
        if notes_path.is_file():
            import_notes_by_form[form] = _load_json(notes_path)
            retire_prefixes.extend(import_notes_by_form[form].get("retire_rule_id_prefixes") or [])
            open_risks.extend(import_notes_by_form[form].get("open_risks") or [])

        manifest_path = form_dir / "MANIFEST.json"
        manifest = _load_json(manifest_path) if manifest_path.is_file() else {}
        form_summaries.append(
            {
                "form": form,
                "rules": len(rule_files),
                "form_mapping_merge_mode": merge_mode,
                "baseline_form_mapping": str(baseline_path) if baseline_path else None,
                "module_files": [p.name for p in module_files],
            }
        )

    w2_spec = get_form_spec("w2")
    group_child_order: dict[str, list[str]] = {}
    if w2_spec is not None:
        group_child_order["multi_instance.w2_records"] = w2_child_order_from_spec(
            w2_spec
        )
    meta_fields = finalize_repeatable_groups(
        meta_fields, group_child_order=group_child_order
    )

    version = f"{tax_year}.1.0"
    today = date.today().isoformat()

    calc_payload = {
        **calc_base,
        "version": calc_base.get("version", version),
        "tax_year": tax_year,
        "storage_destination": "calculation_results",
        "can_be_purged_after_filing": True,
        "metadata": {
            **(calc_base.get("metadata") or {}),
            "source": "AI_TAX_ENGINE",
            "bundle_generated_at": today,
            "forms": form_list,
            "baseline_taxcore_root": str(root) if root else None,
        },
    }
    _write_json(bundle_dir / "calculation_schema.json", calc_payload)

    canon_payload = {
        **canon_base,
        "version": canon_base.get("version", version),
        "tax_year": tax_year,
        "metadata": {
            **(canon_base.get("metadata") or {}),
            "source": "AI_TAX_ENGINE",
            "bundle_generated_at": today,
            "forms": form_list,
        },
    }
    _write_json(bundle_dir / "canonical_schema.json", canon_payload)

    meta_payload = {
        "version": version,
        "generated_at": today,
        "schema_version": version,
        "tax_year": tax_year,
        "fields": meta_fields,
        "metadata": {
            "source": "AI_TAX_ENGINE",
            "note": (
                "Merged bundle for load_schemas canonical-fields pass. "
                "Also written as field_metadata.json (Schema Automation naming)."
            ),
            "forms": form_list,
        },
    }
    _write_json(bundle_dir / "canonical_field_metadata.json", meta_payload)
    _write_json(bundle_dir / "field_metadata.json", meta_payload)

    load_order = [
        f"1. Review bundle at output/ty{tax_year}/taxcore_bundle/",
        "2. ./deploy_to_taxcore.sh [path/to/TaxMD-TaxCore]  OR copy files manually",
        "3. Wire modules/ into avatars + 8889 scenario (see per-form import_notes)",
        "4. cd TaxMD-TaxCore && uv run python manage.py load_schemas --update-latest",
        "5. Smoke tests (W-2 → 8889 → 1040 cross-form chain)",
    ]

    import_notes = {
        "source": "AI_TAX_ENGINE",
        "tax_year": tax_year,
        "bundle_layout": "Matches TaxMD-Schema-Automation-New output/ty{year}/ for TaxCore deploy",
        "per_form_packages": f"output/ty{tax_year}/taxcore/{{form}}/",
        "forms_included": form_list,
        "import_order": list(BUNDLE_FORM_ORDER),
        "taxcore_baseline_used": str(root) if root else None,
        "engine_unchanged": (
            "Our Postgres canonical fields, calc rules, UI, and goldens are NOT modified. "
            "This bundle is export projection only."
        ),
        "not_included": {
            "tax_constants": "Use TaxCore data/schema/tax_constants/ (IRS tables from TaxCore or automation)",
            "avatars": "Merge modules/*.json into data/schema/avatars/ manually",
            "scenarios": "8889: scenario_health_savings_account.calculation_sequence per import_notes_8889.json",
            "field_registry": "Owned by TaxMD-Schema-Automation-New output/registry/ (optional cross-reference)",
        },
        "load_order": load_order,
        "per_form_notes": import_notes_by_form,
        "retire_rule_id_prefixes": sorted(set(retire_prefixes)),
        "open_risks": list(dict.fromkeys(open_risks)),
    }
    _write_json(bundle_dir / "import_notes.json", import_notes)

    adapter_dir = bundle_dir / "taxcore_adapter"
    adapter_dir.mkdir(parents=True, exist_ok=True)
    for form in form_list:
        write_form_adapter(
            form,
            adapter_dir,
            tax_year=tax_year,
            bundle_rule_ids=all_rule_ids,
        )
    write_bundle_contract(
        bundle_dir,
        tax_year=tax_year,
        forms=form_list,
        rule_ids=all_rule_ids,
    )

    manifest = {
        "source": "AI_TAX_ENGINE",
        "tax_year": tax_year,
        "generated_at": today,
        "layout": "taxcore_bundle (Schema-Automation-compatible)",
        "forms": form_summaries,
        "rules_total": len(all_rule_ids),
        "rule_ids": sorted(all_rule_ids),
        "taxcore_baseline": str(root) if root else None,
        "artifacts": {
            "calculation_rules": f"calculation_rules/ ({len(all_rule_ids)} files)",
            "form_mappings": "form_mappings/",
            "calculation_schema.json": "Merged worksheets (baseline + patches)",
            "canonical_schema.json": "Merged structure leaves",
            "field_metadata.json": "Merged canonical field metadata",
            "modules/": "Avatar module wiring reference",
            "taxcore_adapter/": "Per-form import contracts (machine-readable)",
            "TAXCORE_IMPORT_CONTRACT.json": "Bundle-level import contract + importer usage",
            "deploy_to_taxcore.sh": "Run TaxCore scripts/import_ai_tax_engine_bundle.py",
        },
        "one_command_after_deploy": (
            "./deploy_to_taxcore.sh [TaxMD-TaxCore] [form ...]"
        ),
        "per_form_review": f"output/ty{tax_year}/taxcore/{{form}}/",
    }
    _write_json(bundle_dir / "MANIFEST.json", manifest)
    _write_deploy_script(bundle_dir, tax_year)

    print(
        f"taxcore bundle complete: {len(all_rule_ids)} rules, "
        f"{len(form_list)} forms -> {bundle_dir}"
    )
    if root is None:
        print(
            "  note: TaxMD-TaxCore sibling not found — bundle merged patches only "
            "(no baseline). Pass --taxcore-root for full W-2/1040 form_mapping merge."
        )
    else:
        print(f"  baseline: {root}")
    print(f"  deploy: {bundle_dir / 'deploy_to_taxcore.sh'}")
    return bundle_dir
