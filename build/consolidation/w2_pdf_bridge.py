"""DEPRECATED — regression reference for PDF ground truth (ADR 0012).

Prefer: map-pdf-fields + promote-pdf-ground-truth --form w2
"""
from __future__ import annotations

import structlog
from sqlalchemy import select

from db.models import CanonicalField, PdfFieldMapping
from db.session import get_session

log = structlog.get_logger(__name__)

_REASONING = (
    "Hand-verified PDF field mapping (build/consolidation/w2_pdf_bridge.py): confirmed directly "
    "against the catalogued (archived-2025) fw2.pdf Copy B page's own widget field codes and the "
    "box-number labels printed immediately above them via PyMuPDF, not LLM-inferred."
)

# (canonical_field_name, pdf_field_code) -- all on fw2.pdf's Copy B page,
# all plain Text widgets (no checkbox choice involved on this pilot's
# in-scope W-2 boxes), so checkbox_match_value is always "".
_MAPPINGS: list[tuple[str, str]] = [
    ("intake_w2_employer_name", "topmostSubform[0].CopyB[0].Col_Left[0].f2_03[0]"),
    ("intake_w2_box1_wages", "topmostSubform[0].CopyB[0].Col_Right[0].Box1_ReadOrder[0].f2_09[0]"),
    ("intake_w2_box2_fed_withholding", "topmostSubform[0].CopyB[0].Col_Right[0].f2_10[0]"),
    ("intake_w2_box3_ss_wages", "topmostSubform[0].CopyB[0].Col_Right[0].Box3_ReadOrder[0].f2_11[0]"),
    ("intake_w2_box5_medicare_wages", "topmostSubform[0].CopyB[0].Col_Right[0].Box5_ReadOrder[0].f2_13[0]"),
    ("intake_w2_box12_code_w_label", "topmostSubform[0].CopyB[0].Col_Right[0].Box12_ReadOrder[0].f2_20[0]"),
    ("intake_w2_box12w_hsa_employer_contrib", "topmostSubform[0].CopyB[0].Col_Right[0].Box12_ReadOrder[0].f2_21[0]"),
]


def run_w2_pdf_bridge(tax_year: int = 2025) -> None:
    with get_session() as session:
        fields_by_name = {
            f.field_name: f
            for f in session.execute(
                select(CanonicalField).where(
                    CanonicalField.field_name.in_({m[0] for m in _MAPPINGS}), CanonicalField.tax_year == tax_year
                )
            ).scalars().all()
        }

        created = 0
        skipped = 0
        for field_name, pdf_field_code in _MAPPINGS:
            field = fields_by_name.get(field_name)
            if field is None:
                log.warning("w2_pdf_bridge.missing_field", field_name=field_name)
                skipped += 1
                continue

            existing = session.execute(
                select(PdfFieldMapping).where(
                    PdfFieldMapping.canonical_field_id == field.id,
                    PdfFieldMapping.form_number == "w2",
                    PdfFieldMapping.checkbox_match_value == "",
                )
            ).scalars().first()
            if existing is not None:
                existing.pdf_field_code = pdf_field_code
                existing.page_number = 3
                existing.confidence = 1.0
                existing.reasoning = _REASONING
                existing.model_version = "hand_authored"
                existing.prompt_version = None
            else:
                session.add(
                    PdfFieldMapping(
                        canonical_field_id=field.id,
                        form_number="w2",
                        pdf_field_code=pdf_field_code,
                        page_number=3,
                        confidence=1.0,
                        reasoning=_REASONING,
                        model_version="hand_authored",
                        prompt_version=None,
                        checkbox_match_value="",
                        tax_year=tax_year,
                    )
                )
            created += 1

        session.commit()

    print(f"w2 pdf bridge complete: {created} PDF field mappings created/updated, {skipped} skipped (missing field)")
