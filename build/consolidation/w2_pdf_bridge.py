"""Hand-verified PDF field mappings for Form W-2's real fw2.pdf -- same
established pattern as build/consolidation/tax_computation_pdf_bridge.py /
checkbox_field_bridge.py (docs/adr/0008), used instead of the usual LLM
`map-pdf-fields` phase because Form W-2 is this pilot's one genuinely
multi-instance form: there is no single "the" taxpayer answer to map against
a single rendered copy the way the other 3 forms' LLM-assisted mapper
assumes (build/synthesis/pdf_field_mapper.py always resolves one canonical
field to one widget for a single-instance return). Instead, ui/pdf_render.py's
`render_filled_w2_pdf` renders ONE filled copy per W-2 row the taxpayer
entered, reusing these same mapping rows each time.

The real fw2.pdf bundles 6 copies (A, 1, B, C, 2, D) across 11 pages; only
Copy B ("To Be Filed With Employee's FEDERAL Tax Return") is relevant to a
1040 filer, confirmed by page text via PyMuPDF (page index 3 in the 2025
archived revision -- see build/sources/catalog/form_w2.yaml's module comment
for why this pilot fetches the archived 2025 fw2.pdf/iw2w3 rather than
whatever revision happens to be currently live on irs.gov). Every widget
code below was confirmed directly against Copy B's own AcroForm field names
and the printed box-number labels immediately above them (same
`page.widgets()` + `page.get_text('words')` position-matching technique as
tax_computation_pdf_bridge.py), not LLM-inferred:

  Box 1 (Wages)                     -> f2_09   Box 2 (Fed tax withheld) -> f2_10
  Box 3 (Social security wages)     -> f2_11   Box 5 (Medicare wages)   -> f2_13
  Box c (Employer's name)           -> f2_03
  Box 12a code sub-field            -> f2_20   Box 12a amount sub-field -> f2_21
    (this pilot only ever asks about one Box-12 code, "W" -- HSA employer
    contributions -- so it is always hand-placed in the FIRST of the four
    12a-12d code/amount slots on the real form; a taxpayer's actual W-2 may
    print W in a different slot alongside other codes this pilot doesn't
    model, which is a known simplification, not a mapping error)

`intake_w2_box12_code_w_label` (the literal "W" string,
`intake_w2_box12w_hsa_employer_contrib`'s presentation-only sibling -- see
w2_bridge.py's module docstring) and `intake_w2_employer_name` are real
CanonicalField rows purely so this bridge has a legitimate
`canonical_field_id` foreign key to attach a mapping to; neither ever
participates in a tax calculation.
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
