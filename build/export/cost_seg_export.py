"""Template-based export for cost segregation fields (Phase 2).

Build-time artifacts describe each field once via template_id — not per taxpayer activity.
"""
from __future__ import annotations

import json
from pathlib import Path

from build.consolidation.cost_seg_field_templates import (
    all_templates,
    template_to_dict,
    templates_for_form,
)
from build.consolidation.cost_seg_bridge import _GOLDEN_ACTIVITY_IDS
from build.consolidation.cost_seg_field_templates import instance_field_name

OUTPUT_ROOT = Path(__file__).resolve().parent.parent.parent / "output"


def _template_form_mapping(form: str, tax_year: int) -> dict:
    templates = templates_for_form(form)
    mappings = []
    for tpl in templates:
        mappings.append({
            "template_id": tpl.template_id,
            "instance_group": tpl.instance_group,
            "relative_field": tpl.relative_field,
            "form": form,
            "line": tpl.source_form_line,
            "part_or_section": tpl.section,
            "xsd_element": tpl.source_xsd_element,
            "data_type": tpl.data_type,
            "projection": tpl.projection,
            "is_input_field": False,
            "calc_rule_type": tpl.calc_rule_type,
            "depends_on_relative": tpl.calc_rule_operand_relative,
            "depends_on": (
                [f"cost_seg.{{tax_activity_id}}.{tpl.calc_rule_operand_relative}"]
                if tpl.calc_rule_operand_relative
                else []
            ),
            "runtime_binding_pattern": f"cost_seg.{{tax_activity_id}}.{tpl.relative_field}",
        })
    return {
        "form": form,
        "tax_year": tax_year,
        "export_mode": "template_based",
        "field_count": len(mappings),
        "field_mappings": mappings,
    }


def run_cost_seg_export(tax_year: int = 2025) -> None:
    templates = all_templates()
    engine_templates = [t for t in templates if t.source_form_number is None and t.instance_group]

    out_cost_seg = OUTPUT_ROOT / f"ty{tax_year}" / "cost_seg"
    out_cost_seg.mkdir(parents=True, exist_ok=True)
    engine_path = out_cost_seg / "engine_field_templates.json"
    engine_path.write_text(
        json.dumps(
            {
                "tax_year": tax_year,
                "template_count": len(engine_templates),
                "templates": [template_to_dict(t) for t in engine_templates],
            },
            indent=2,
        )
        + "\n"
    )

    for form in ("4562", "1040se"):
        form_templates = templates_for_form(form)
        out_dir = OUTPUT_ROOT / f"ty{tax_year}" / form
        out_dir.mkdir(parents=True, exist_ok=True)
        tpl_path = out_dir / "field_templates.json"
        tpl_path.write_text(
            json.dumps(
                {
                    "form": form,
                    "tax_year": tax_year,
                    "export_mode": "template_based",
                    "template_count": len(form_templates),
                    "templates": [template_to_dict(t) for t in form_templates],
                },
                indent=2,
            )
            + "\n"
        )

        map_dir = OUTPUT_ROOT / f"ty{tax_year}" / "form_mappings"
        map_dir.mkdir(parents=True, exist_ok=True)
        map_path = map_dir / f"form_mapping_{form}.json"
        map_path.write_text(json.dumps(_template_form_mapping(form, tax_year), indent=2) + "\n")

    examples = {
        "tax_year": tax_year,
        "golden_activity_ids": list(_GOLDEN_ACTIVITY_IDS),
        "instance_examples": [
            instance_field_name(aid, t.relative_field)
            for aid in _GOLDEN_ACTIVITY_IDS
            for t in per_activity_templates()
        ],
    }
    (out_cost_seg / "instance_examples.json").write_text(json.dumps(examples, indent=2) + "\n")

    print(
        f"cost_seg_export complete: {len(templates)} templates, "
        f"4562={len(templates_for_form('4562'))}, 1040se={len(templates_for_form('1040se'))} "
        f"-> {OUTPUT_ROOT / f'ty{tax_year}'}"
    )


def per_activity_templates():
    return [t for t in all_templates() if t.instance_group]
