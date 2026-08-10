#!/usr/bin/env python3
"""Compare AI_TAX_ENGINE taxcore_bundle artifacts vs TaxMD-TaxCore on disk.

Usage:
  python scripts/compare_taxcore_bundle.py --form w2
  python scripts/compare_taxcore_bundle.py --form 8889 --taxcore-root ../TaxMD-TaxCore
  python scripts/compare_taxcore_bundle.py --all
"""
from __future__ import annotations

import argparse
import json
from pathlib import Path

BUNDLE_ROOT = Path(__file__).resolve().parent.parent / "output" / "ty2025" / "taxcore_bundle"
FORM_ORDER = ("w2", "8889", "1040sc", "1040sse", "1040s1", "1040s2", "1040s1a", "1040")


def _load(path: Path) -> dict:
    return json.loads(path.read_text())


def _rule_glob_for_form(form: str) -> str:
    mapping = {
        "w2": "calc_w2_*.json",
        "8889": "calc_form_8889_*.json",
        "1040": "calc_form_1040_*.json",
        "1040s1": "calc_form_1040s1_*.json",
        "1040s2": "calc_form_1040s2_*.json",
        "1040s1a": "calc_form_1040s1a_*.json",
        "1040sc": "calc_form_1040sc_*.json",
        "1040sse": "calc_form_1040sse_*.json",
    }
    return mapping[form]


def _form_type(form: str) -> str:
    from build.export.taxcore_targets import get_form_spec

    spec = get_form_spec(form)
    return spec.form_type if spec else f"irs_{form}"


def compare_rules(form: str, bundle_dir: Path, taxcore_root: Path) -> list[str]:
    lines: list[str] = []
    glob_pat = _rule_glob_for_form(form)
    bundle_rules = sorted((bundle_dir / "calculation_rules").glob(glob_pat))
    taxcore_rules = taxcore_root / "data" / "schema" / "rules"

    for src in bundle_rules:
        dst = taxcore_rules / src.name
        if not dst.is_file():
            lines.append(f"  MISSING in TaxCore: {src.name}")
            continue
        b = _load(src)
        t = _load(dst)
        for key in ("rule_id", "output_field", "canonical_target", "formula"):
            if b.get(key) != t.get(key):
                lines.append(f"  DIFF {src.name} key={key}")
                lines.append(f"    bundle : {json.dumps(b.get(key), sort_keys=True)[:200]}")
                lines.append(f"    taxcore: {json.dumps(t.get(key), sort_keys=True)[:200]}")
        if b == t:
            lines.append(f"  OK     {src.name}")
    return lines


def compare_metadata_keys(form: str, bundle_dir: Path, taxcore_root: Path) -> list[str]:
    lines: list[str] = []
    patch = bundle_dir.parent / "taxcore" / form / f"canonical_field_metadata_patch_{form}.json"
    if not patch.is_file():
        return [f"  (no per-form metadata patch at {patch})"]

    patch_fields = _load(patch).get("fields") or {}
    live_path = taxcore_root / "data/schema/canonical/canonical_field_metadata_2026.json"
    live_fields = _load(live_path).get("fields") or {}

    for key in sorted(patch_fields):
        if key not in live_fields:
            lines.append(f"  MISSING metadata key: {key}")
            continue
        p = patch_fields[key]
        l = live_fields[key]
        # Compare a few high-signal keys only.
        for sub in ("computed_by", "display_label", "aggregation_method", "aggregation_target"):
            if p.get(sub) != l.get(sub):
                lines.append(f"  DIFF {key}.{sub}: patch={p.get(sub)!r} live={l.get(sub)!r}")
        if key.startswith("multi_instance.") and p.get("question_type") == "repeatable_group":
            pc = len(p.get("children") or [])
            lc = len(l.get("children") or [])
            if pc != lc:
                lines.append(f"  DIFF {key} children count: patch={pc} live={lc}")
    return lines or ["  (all patch keys present in live metadata)"]


def compare_form(form: str, bundle_dir: Path, taxcore_root: Path) -> None:
    print(f"\n=== {form} ===")
    print("Rules (bundle vs TaxCore data/schema/rules):")
    for line in compare_rules(form, bundle_dir, taxcore_root):
        print(line)

    print("Metadata patch keys (per-form patch vs TaxCore live):")
    for line in compare_metadata_keys(form, bundle_dir, taxcore_root):
        print(line)

    adapter = bundle_dir / "taxcore_adapter" / f"{form}.json"
    if adapter.is_file():
        retire = _load(adapter).get("retire_rules") or {}
        print(f"Import contract retire_rules.mode={retire.get('mode')!r}")


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--bundle", type=Path, default=BUNDLE_ROOT)
    parser.add_argument("--taxcore-root", type=Path, default=Path(__file__).resolve().parent.parent.parent / "TaxMD-TaxCore")
    parser.add_argument("--form", choices=FORM_ORDER)
    parser.add_argument("--all", action="store_true")
    args = parser.parse_args()

    forms = list(FORM_ORDER) if args.all else ([args.form] if args.form else [])
    if not forms:
        parser.error("Pass --form NAME or --all")

    for form in forms:
        compare_form(form, args.bundle, args.taxcore_root)


if __name__ == "__main__":
    main()
