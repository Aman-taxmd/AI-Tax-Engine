"""DEPRECATED — regression reference for PDF ground truth (ADR 0012).

Prefer: map-pdf-fields + promote-pdf-ground-truth --form 4562
Ground truth codes live in hand_pdf_ground_truth.py.
"""
from __future__ import annotations

from build.consolidation.cost_seg_pdf_common import get_catalogued_form_pdf_meta, upsert_pdf_mappings

# (canonical_field_name, pdf_field_code, page_number)
_MAPPINGS: list[tuple[str, str, int]] = [
    (
        "cost_seg_projection.form_4562.special_allowance_amount",
        "topmostSubform[0].Page1[0].f1_22[0]",
        0,
    ),
    (
        "cost_seg_projection.form_4562.macrs_5_year_amount",
        "topmostSubform[0].Page1[0].SectionBTable[0].Line19b[0].f1_37[0]",
        0,
    ),
    (
        "cost_seg_projection.form_4562.macrs_7_year_amount",
        "topmostSubform[0].Page1[0].SectionBTable[0].Line19c[0].f1_43[0]",
        0,
    ),
    (
        "cost_seg_projection.form_4562.macrs_15_year_amount",
        "topmostSubform[0].Page1[0].SectionBTable[0].Line19e[0].f1_55[0]",
        0,
    ),
    (
        "cost_seg_projection.form_4562.residential_real_property_amount",
        "topmostSubform[0].Page1[0].SectionBTable[0].Line19i_1[0].f1_79[0]",
        0,
    ),
    (
        "cost_seg_projection.form_4562.nonresidential_real_property_amount",
        "topmostSubform[0].Page1[0].SectionBTable[0].Line19j_1[0].f1_91[0]",
        0,
    ),
    (
        "cost_seg_projection.form_4562.total_depreciation_amount",
        "topmostSubform[0].Page2[0].f2_2[0]",
        1,
    ),
]


def run_form_4562_pdf_bridge(tax_year: int = 2025) -> None:
    _path, revision, content_hash = get_catalogued_form_pdf_meta("4562")
    if _path is None:
        print("form_4562_pdf_bridge: no catalogued PDF — run discover --form 4562 first")
        return
    created, skipped = upsert_pdf_mappings(
        "4562", _MAPPINGS, tax_year, revision, content_hash
    )
    print(
        f"form_4562_pdf_bridge: {created} mappings upserted, {skipped} skipped "
        f"(revision={revision!r}, hash={content_hash[:12] if content_hash else None})"
    )
