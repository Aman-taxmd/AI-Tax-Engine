"""DEPRECATED — regression reference for PDF ground truth (ADR 0012).

Prefer: map-pdf-fields + promote-pdf-ground-truth --form 1040se
"""
from __future__ import annotations

from build.consolidation.cost_seg_pdf_common import get_catalogued_form_pdf_meta, upsert_pdf_mappings

_MAPPINGS: list[tuple[str, str, int]] = [
    (
        "cost_seg_projection.schedule_e.depreciation_expense_a",
        "topmostSubform[0].Page1[0].Table_Expenses[0].Line18[0].f1_61[0]",
        0,
    ),
    (
        "cost_seg_projection.schedule_e.depreciation_expense_b",
        "topmostSubform[0].Page1[0].Table_Expenses[0].Line18[0].f1_62[0]",
        0,
    ),
    (
        "cost_seg_projection.schedule_e.depreciation_expense_c",
        "topmostSubform[0].Page1[0].Table_Expenses[0].Line18[0].f1_63[0]",
        0,
    ),
]


def run_schedule_e_pdf_bridge(tax_year: int = 2025) -> None:
    _path, revision, content_hash = get_catalogued_form_pdf_meta("1040se")
    if _path is None:
        print("schedule_e_pdf_bridge: no catalogued PDF — run discover --form 1040se first")
        return
    created, skipped = upsert_pdf_mappings(
        "1040se", _MAPPINGS, tax_year, revision, content_hash
    )
    print(
        f"schedule_e_pdf_bridge: {created} mappings upserted, {skipped} skipped "
        f"(revision={revision!r}, hash={content_hash[:12] if content_hash else None})"
    )
