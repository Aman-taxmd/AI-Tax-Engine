"""Build-time form mapping export.

Answers, for every canonical field on a form: *which exact line does this
live on, and where does its value go next?* — the piece that's implicit
elsewhere (spread across `canonical_fields.source_form_line`,
`calc_rules.carryover_target`, and `dependency_edges`) but not collected
anywhere into one place. One row per canonical field; `flows_to` is only
set when a calc rule names an explicit downstream destination (Phase 7/the
cross-form bridge), so it's easy to eyeball the whole HSA chain in one file:
adjustments.health_savings_account_deduction_amount (Form 8889 line 13,
renamed to TaxCore's dot-notation -- see docs/adr/0010) -> flows_to Schedule
1 line 13 -> flows_to (via form_1040s1_line_26) Form 1040 line 10.

`pdf_field_code` (null unless build/synthesis/pdf_field_mapper.py has been
run for this form) is the real IRS PDF's AcroForm field code this canonical
field maps to — see PdfFieldMapping / docs/adr/0008.
"""
from __future__ import annotations

import json
import re
from pathlib import Path

from sqlalchemy import select

from build.export.json_export import _field_condition
from db.models import CalcRule, CanonicalField, PdfFieldMapping
from db.session import get_session

OUTPUT_ROOT = Path(__file__).resolve().parent.parent.parent / "output"


def _sort_key(line_ref: str | None) -> tuple:
    if not line_ref:
        return (float("inf"), "")
    m = re.match(r"^(\d+)", line_ref)
    return (int(m.group(1)) if m else float("inf"), line_ref)


def run_form_mapping_export(form: str, tax_year: int = 2025) -> None:
    out_dir = OUTPUT_ROOT / f"ty{tax_year}" / "form_mappings"
    out_dir.mkdir(parents=True, exist_ok=True)

    with get_session() as session:
        fields = session.execute(
            select(CanonicalField).where(
                _field_condition(CanonicalField.field_name, form), CanonicalField.tax_year == tax_year
            )
        ).scalars().all()
        rules_by_field_id = {
            r.canonical_field_id: r
            for r in session.execute(
                select(CalcRule).where(
                    _field_condition(CalcRule.rule_id, form), CalcRule.tax_year == tax_year
                )
            ).scalars().all()
        }
        pdf_mappings_by_field_id = {
            m.canonical_field_id: m
            for m in session.execute(
                select(PdfFieldMapping).where(
                    PdfFieldMapping.form_number == form, PdfFieldMapping.tax_year == tax_year
                )
            ).scalars().all()
        }

        mappings = []
        for field in sorted(fields, key=lambda f: _sort_key(f.source_form_line)):
            rule = rules_by_field_id.get(field.id)
            pdf_mapping = pdf_mappings_by_field_id.get(field.id)
            mappings.append({
                "canonical_field": field.field_name,
                "form": form,
                "line": field.source_form_line,
                "part_or_section": field.section,
                "xsd_element": field.source_xsd_element,
                "data_type": field.data_type,
                "cardinality": field.cardinality,
                "instance_dimension": field.instance_dimension,
                "is_input_field": rule is None,
                "calc_rule_id": rule.rule_id if rule else None,
                "formula_type": (rule.formula or {}).get("type") if rule else None,
                "depends_on": (rule.formula or {}).get("operand_names", []) if rule else [],
                "flows_to": rule.carryover_target if rule else None,
                "rule_status": rule.status if rule else None,
                "pdf_field_code": pdf_mapping.pdf_field_code if pdf_mapping else None,
                "pdf_field_confidence": pdf_mapping.confidence if pdf_mapping else None,
            })

    payload = {"form": form, "tax_year": tax_year, "field_count": len(mappings), "field_mappings": mappings}
    out_path = out_dir / f"form_mapping_{form}.json"
    out_path.write_text(json.dumps(payload, indent=2) + "\n")
    print(f"form mapping export complete (form={form}): {len(mappings)} fields -> {out_path}")
