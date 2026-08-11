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
    from sqlalchemy import select

    from db.models import CanonicalField, CostSegFieldTemplate, PdfFieldMapping
    from db.session import get_session

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

    provenance: dict = {"tax_year": tax_year, "fields": []}
    with get_session() as session:
        tpl_rows = session.execute(
            select(CostSegFieldTemplate).where(CostSegFieldTemplate.tax_year == tax_year)
        ).scalars().all()
        synth_by_id = {
            f.id: f
            for f in session.execute(
                select(CanonicalField).where(CanonicalField.tax_year == tax_year)
            ).scalars().all()
        }
        pdf_by_field = {
            m.canonical_field_id: m
            for m in session.execute(
                select(PdfFieldMapping).where(
                    PdfFieldMapping.tax_year == tax_year,
                    PdfFieldMapping.form_number.in_(("4562", "1040se")),
                )
            ).scalars().all()
        }
        for row in tpl_rows:
            synth = synth_by_id.get(row.synthesized_canonical_field_id) if row.synthesized_canonical_field_id else None
            provenance["fields"].append({
                "template_id": row.template_id,
                "relative_field": row.relative_field,
                "xsd_element": row.source_xsd_element,
                "synthesized_field_name": synth.field_name if synth else None,
                "computation_source": "engine" if row.instance_group and not row.projection else (
                    "projection" if row.projection else "analytics"
                ),
            })
        provenance["projection_pdf"] = [
            {
                "field_name": f.field_name,
                "pdf_field_code": pdf_by_field[f.id].pdf_field_code,
                "model_version": pdf_by_field[f.id].model_version,
            }
            for f in session.execute(
                select(CanonicalField).where(
                    CanonicalField.tax_year == tax_year,
                    CanonicalField.field_name.like("cost_seg_projection.%"),
                )
            ).scalars().all()
            if f.id in pdf_by_field
        ]
    (out_cost_seg / "provenance.json").write_text(json.dumps(provenance, indent=2) + "\n")

    print(
        f"cost_seg_export complete: {len(templates)} templates, "
        f"4562={len(templates_for_form('4562'))}, 1040se={len(templates_for_form('1040se'))} "
        f"-> {OUTPUT_ROOT / f'ty{tax_year}'}"
    )


def per_activity_templates():
    return [t for t in all_templates() if t.instance_group]
