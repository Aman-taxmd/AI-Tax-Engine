"""Hand-verified PDF field mappings for Form 1040's Tax and Credits section
(page 2, Lines 11b and 16-24) -- see docs/adr/0008 and
build/consolidation/checkbox_field_bridge.py for the established pattern this
follows.

Two distinct reasons these are hand-authored instead of going through the
usual LLM `map-pdf-fields` phase (build/synthesis/pdf_field_mapper.py):

1. `form_1040_line_11a` (Line 11b) -- this is the "one canonical field, two
   real PDF widgets" case investigated in build/consolidation/
   form1040_income_bridge.py's module docstring: the real f1040.pdf prints
   AGI twice (Line 11a on page 1, a pure redisplay labeled "11b" on page 2),
   but there is only ONE `form_1040_line_11a` canonical field (the XSD has no
   separate 11b element). `map-pdf-fields` only ever proposes a single
   widget per field, so it's never going to find this second one on its own.
   Verified directly via PyMuPDF (widget field code + the real printed label
   immediately to its left, same technique as pdf_field_mapper.py's
   `_nearby_label_text`): `topmostSubform[0].Page2[0].f2_01[0]` sits at the
   row printed "Amount from line 11a (adjusted gross income) ... 11b".

2. Lines 16-24 (the new tax-computation chain this round adds) -- these
   canonical fields already exist (from the IRS1040.xsd walk), so
   `map-pdf-fields --form 1040` COULD map them once they're in
   runtime/chain.py's ancestor closure -- but since every one of these
   widgets was already individually verified by hand while investigating
   Line 11b (same PyMuPDF pass, see the extraction transcript), it's cheaper
   and more certain to just record the verified ground truth here than to
   spend another LLM call re-deriving what's already confirmed. If
   `map-pdf-fields --form 1040` is re-run later, it will silently overwrite
   these for any field also in its in-scope set -- re-run this bridge
   afterward if that happens (same caution as checkbox_field_bridge.py).

Both `f2_07[0]` and `f2_08[0]` sit on Line 16's row (the small box is for the
"1/2/3" exception code like "962" or "ECR" next to the Form 8814/4972/other
checkboxes; the real $ Tax entry is the wide box further right) --
disambiguated by x-position: f2_08 spans x=[504, 576] (the far-right amount
column, matching every other line's amount box), f2_07 spans x=[439, 475]
(a narrow mid-row code field). Confirmed empirically, not assumed.
"""
from __future__ import annotations

import structlog
from sqlalchemy import select

from db.models import CanonicalField, PdfFieldMapping
from db.session import get_session

log = structlog.get_logger(__name__)

_REASONING = (
    "Hand-verified PDF field mapping (build/consolidation/tax_computation_pdf_bridge.py): "
    "confirmed directly against the catalogued f1040.pdf's own widget field codes and the "
    "text printed immediately to their left via PyMuPDF, not LLM-inferred."
)

# (canonical_field_name, checkbox_match_value, pdf_field_code, page_number)
# checkbox_match_value is "" for every row here (all plain Text widgets, no
# checkbox choice involved) EXCEPT form_1040_line_11a's second row, which
# needs a non-empty, distinguishing value purely to satisfy
# PdfFieldMapping's (canonical_field_id, form_number, checkbox_match_value)
# uniqueness constraint -- see ui/pdf_render.py's widget-type-based (not
# row-count-based) fill logic for why a second plain-text row like this no
# longer gets mis-treated as a checkbox group.
_MAPPINGS: list[tuple[str, str, str, int]] = [
    ("form_1040_line_11a", "page2_redisplay", "topmostSubform[0].Page2[0].f2_01[0]", 1),
    ("form_1040_line_16", "", "topmostSubform[0].Page2[0].f2_08[0]", 1),
    ("form_1040_line_17", "", "topmostSubform[0].Page2[0].f2_09[0]", 1),
    ("form_1040_line_18", "", "topmostSubform[0].Page2[0].f2_10[0]", 1),
    ("form_1040_line_19", "", "topmostSubform[0].Page2[0].f2_11[0]", 1),
    ("form_1040_line_20", "", "topmostSubform[0].Page2[0].f2_12[0]", 1),
    ("form_1040_line_21", "", "topmostSubform[0].Page2[0].f2_13[0]", 1),
    ("form_1040_line_22", "", "topmostSubform[0].Page2[0].f2_14[0]", 1),
    ("form_1040_line_23", "", "topmostSubform[0].Page2[0].f2_15[0]", 1),
    ("form_1040_line_24", "", "topmostSubform[0].Page2[0].f2_16[0]", 1),
]


def run_tax_computation_pdf_bridge(tax_year: int = 2025) -> None:
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
        for field_name, match_value, pdf_field_code, page_number in _MAPPINGS:
            field = fields_by_name.get(field_name)
            if field is None:
                log.warning("tax_computation_pdf_bridge.missing_field", field_name=field_name)
                skipped += 1
                continue

            existing = session.execute(
                select(PdfFieldMapping).where(
                    PdfFieldMapping.canonical_field_id == field.id,
                    PdfFieldMapping.form_number == "1040",
                    PdfFieldMapping.checkbox_match_value == match_value,
                )
            ).scalars().first()
            if existing is not None:
                existing.pdf_field_code = pdf_field_code
                existing.page_number = page_number
                existing.confidence = 1.0
                existing.reasoning = _REASONING
                existing.model_version = "hand_authored"
                existing.prompt_version = None
            else:
                session.add(
                    PdfFieldMapping(
                        canonical_field_id=field.id,
                        form_number="1040",
                        pdf_field_code=pdf_field_code,
                        page_number=page_number,
                        confidence=1.0,
                        reasoning=_REASONING,
                        model_version="hand_authored",
                        prompt_version=None,
                        checkbox_match_value=match_value,
                        tax_year=tax_year,
                    )
                )
            created += 1

        session.commit()

    print(f"tax computation pdf bridge complete: {created} PDF field mappings created/updated, {skipped} skipped (missing field)")
