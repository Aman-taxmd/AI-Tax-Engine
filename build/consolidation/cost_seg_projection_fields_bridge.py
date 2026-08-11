"""Register instance-agnostic projection canonical fields for PDF form view.

These fields exist so PdfFieldMapping rows have FK targets. Values are bound
at render time from engine output (cost_seg.{tax_activity_id}.*), not from
new calc rules — same pattern as W-2 intake display fields.
"""
from __future__ import annotations

from sqlalchemy import select

from db.models import CanonicalField
from db.session import get_session

_F4562_FIELDS: list[tuple[str, str, str, str]] = [
    ("cost_seg_projection.form_4562.special_allowance_amount", "14", "Part II", "USAmountType"),
    ("cost_seg_projection.form_4562.macrs_5_year_amount", "19", "Part III", "USAmountType"),
    ("cost_seg_projection.form_4562.macrs_7_year_amount", "19", "Part III", "USAmountType"),
    ("cost_seg_projection.form_4562.macrs_15_year_amount", "19", "Part III", "USAmountType"),
    (
        "cost_seg_projection.form_4562.residential_real_property_amount",
        "19",
        "Part III",
        "USAmountType",
    ),
    (
        "cost_seg_projection.form_4562.nonresidential_real_property_amount",
        "19",
        "Part III",
        "USAmountType",
    ),
    ("cost_seg_projection.form_4562.total_depreciation_amount", "22", "Part IV", "USAmountType"),
]

_SCHEDULE_E_FIELDS: list[tuple[str, str, str, str]] = [
    ("cost_seg_projection.schedule_e.depreciation_expense_a", "18", "Part I Column A", "USAmountType"),
    ("cost_seg_projection.schedule_e.depreciation_expense_b", "18", "Part I Column B", "USAmountType"),
    ("cost_seg_projection.schedule_e.depreciation_expense_c", "18", "Part I Column C", "USAmountType"),
]


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
        for name, line, section, dtype in _F4562_FIELDS + _SCHEDULE_E_FIELDS:
            _ensure_field(session, name, line, section, dtype, tax_year)
            count += 1
        session.commit()
    print(f"cost_seg_projection_fields_bridge: {count} projection canonical fields for tax_year={tax_year}")
