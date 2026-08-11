"""Register instance-agnostic projection canonical fields for PDF form view.

Derived from cost_seg_field_templates.projection_pdf_slots() — values bound at
render time from engine output (cost_seg.{tax_activity_id}.*).
"""
from __future__ import annotations

from sqlalchemy import select

from build.consolidation.cost_seg_field_templates import projection_pdf_slots
from db.models import CanonicalField
from db.session import get_session


def _ensure_field(
    session, name: str, line: str, section: str, data_type: str, tax_year: int
) -> CanonicalField:
    existing = session.execute(
        select(CanonicalField).where(
            CanonicalField.field_name == name, CanonicalField.tax_year == tax_year
        )
    ).scalars().first()
    desc = f"PDF projection slot — {section} line {line} (render-time only)."
    if existing:
        existing.description = desc
        existing.data_type = data_type
        existing.section = section
        existing.source_form_line = line
        return existing
    field = CanonicalField(
        field_name=name,
        section=section,
        description=desc,
        data_type=data_type,
        tax_year=tax_year,
        cardinality="single",
        source_form_line=line,
    )
    session.add(field)
    session.flush()
    return field


def run_cost_seg_projection_fields_bridge(tax_year: int = 2025) -> None:
    with get_session() as session:
        count = 0
        for name, line, section, dtype in projection_pdf_slots():
            _ensure_field(session, name, line, section, dtype, tax_year)
            count += 1
        session.commit()
    print(f"cost_seg_projection_fields_bridge: {count} projection canonical fields for tax_year={tax_year}")
