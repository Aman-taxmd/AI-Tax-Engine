"""Hand-authored bridge for mutually-exclusive checkbox *groups* that the
real IRS PDFs render as several separate AcroForm widgets for what this
pilot models as ONE canonical field's value -- see docs/adr/0008 and
db/models.py's `PdfFieldMapping.checkbox_match_value` docstring for the
general mechanism this module seeds data for.

Two fields, investigated directly against the actual catalogued PDFs via
PyMuPDF (widget field codes + the printed text immediately to their right,
same technique as build/synthesis/pdf_field_mapper.py's `_nearby_label_text`):

1. `deductions.hdhp_coverage_type` ("HDHP Self Only Coverage Indicator",
   renamed from `form_8889_line_1` -- see docs/adr/0010) -- already a
   real canonical field (extracted from the XSD), already derived from the
   `profile_hdhp_coverage_type` question (see runtime/condition_rules.py),
   but its value ("self_only" / "family") was never wired to the PDF at
   all: it isn't a dependency-graph ancestor of anything, so it fell
   outside runtime/chain.py's ancestor_closure and was never a candidate
   for build/synthesis/pdf_field_mapper.py's (single-widget-per-field)
   mapping in the first place. f8889.pdf's Line 1 is actually TWO
   independent checkbox widgets:
     topmostSubform[0].Page1[0].c1_1[0]  <- "Self-only"
     topmostSubform[0].Page1[0].c1_1[1]  <- "Family"

2. `form_1040_filing_status` -- does NOT exist as a canonical field at all.
   Confirmed by querying every form_1040_% canonical field for anything
   filing-status-related: zero rows. This is a genuine Phase 7 extraction
   gap, not a bug -- the XSD/PDF walk that produces every OTHER Form 1040
   canonical field keys off a printed line NUMBER (source_form_line), and
   the filing-status section is the one part of page 1 with no line number
   at all ("Filing Status  Check only one box."), so it was never picked
   up as a candidate line item. This module hand-creates it, derived from
   the already-collected `profile_filing_status` question (see
   profile_questions.yaml's `shadows_canonical_field`). f1040.pdf's filing
   status section is FIVE independent checkbox widgets, oddly split across
   two different AcroForm subform paths (verified empirically -- this is
   just how the IRS's PDF authoring tool emitted them, not a pattern worth
   reading meaning into):
     topmostSubform[0].Page1[0].Checkbox_ReadOrder[0].c1_8[0]  <- "Single"
     topmostSubform[0].Page1[0].Checkbox_ReadOrder[0].c1_8[1]  <- "Married filing jointly"
     topmostSubform[0].Page1[0].Checkbox_ReadOrder[0].c1_8[2]  <- "Married filing separately (MFS)"
     topmostSubform[0].Page1[0].c1_8[0]                        <- "Head of household (HOH)"
     topmostSubform[0].Page1[0].c1_8[1]                        <- "Qualifying surviving spouse (QSS)"

Both are added to runtime/chain.py's DISPLAY_ONLY_FIELDS so the runtime
engine actually produces a ComputedValue for them (they're not real
dependency-graph ancestors of the modeled HSA chain, so ancestor_closure()
wouldn't otherwise include them), and ui/pdf_render.py checks the ONE
widget among each group whose `checkbox_match_value` equals the computed
string value, unchecking every other widget in that group.

CAUTION (same operational fragility as hsa_worksheet_bridge.py /
cross_form_bridge.py): `deductions.hdhp_coverage_type` IS one of the fields
`runtime.chain.FORM_FIELD_NAME_OVERRIDES["8889"]` resolves for form 8889, and
IS in runtime/chain.py's ancestor closure once DISPLAY_ONLY_FIELDS includes
it -- so re-running `map-pdf-fields --form 8889` will delete this module's 2
hand-authored rows for it (the LLM will then attempt its own single-widget
mapping, which cannot express a 2-widget checkbox choice). Re-run this
bridge afterward if that happens. `form_1040_filing_status` does NOT match
`form_1040_line_%`, so it is never touched by `map-pdf-fields --form 1040`.

Idempotent: re-running deletes and rewrites every row this module owns
first.
"""
from __future__ import annotations

import structlog
from sqlalchemy import select

from db.models import CanonicalField, PdfFieldMapping
from db.session import get_session

log = structlog.get_logger(__name__)

_FILING_STATUS_FIELD_NAME = "form_1040_filing_status"

_FILING_STATUS_CANONICAL_FIELD = dict(
    field_name=_FILING_STATUS_FIELD_NAME,
    section="Filing Status",
    data_type="ChoiceType",
    cardinality="single",
    instance_dimension=None,
    source_xsd_element=None,
    source_form_line=None,
    description=(
        "Filing Status Indicator \u2014 which of the 5 mutually-exclusive filing-status "
        "boxes at the top of Form 1040 is checked (single, married_filing_jointly, "
        "married_filing_separately, head_of_household, qualifying_surviving_spouse). "
        "Hand-authored (see build/consolidation/checkbox_field_bridge.py's module "
        "docstring) -- not derived from the XSD line walk like every other Form 1040 "
        "canonical field, because this section has no printed line number."
    ),
)

_HDHP_COVERAGE_TYPE_FIELD_NAME = "deductions.hdhp_coverage_type"

# (canonical_field_name, form_number, checkbox_match_value, pdf_field_code, page_number)
_CHECKBOX_GROUP_MAPPINGS: list[tuple[str, str, str, str, int]] = [
    (_HDHP_COVERAGE_TYPE_FIELD_NAME, "8889", "self_only", "topmostSubform[0].Page1[0].c1_1[0]", 0),
    (_HDHP_COVERAGE_TYPE_FIELD_NAME, "8889", "family", "topmostSubform[0].Page1[0].c1_1[1]", 0),
    (
        _FILING_STATUS_FIELD_NAME, "1040", "single",
        "topmostSubform[0].Page1[0].Checkbox_ReadOrder[0].c1_8[0]", 0,
    ),
    (
        _FILING_STATUS_FIELD_NAME, "1040", "married_filing_jointly",
        "topmostSubform[0].Page1[0].Checkbox_ReadOrder[0].c1_8[1]", 0,
    ),
    (
        _FILING_STATUS_FIELD_NAME, "1040", "married_filing_separately",
        "topmostSubform[0].Page1[0].Checkbox_ReadOrder[0].c1_8[2]", 0,
    ),
    (_FILING_STATUS_FIELD_NAME, "1040", "head_of_household", "topmostSubform[0].Page1[0].c1_8[0]", 0),
    (_FILING_STATUS_FIELD_NAME, "1040", "qualifying_surviving_spouse", "topmostSubform[0].Page1[0].c1_8[1]", 0),
]

_REASONING = (
    "Hand-authored checkbox-group mapping (build/consolidation/checkbox_field_bridge.py): "
    "verified directly against the catalogued PDF's own widget field codes and the text "
    "printed immediately to their right via PyMuPDF, not LLM-inferred."
)


def run_checkbox_field_bridge(tax_year: int = 2025) -> None:
    with get_session() as session:
        filing_status_field = session.execute(
            select(CanonicalField).where(
                CanonicalField.field_name == _FILING_STATUS_FIELD_NAME, CanonicalField.tax_year == tax_year
            )
        ).scalars().first()
        if filing_status_field is None:
            filing_status_field = CanonicalField(**_FILING_STATUS_CANONICAL_FIELD, tax_year=tax_year)
            session.add(filing_status_field)
            session.flush()
            log.info("checkbox_field_bridge.created_canonical_field", field_name=_FILING_STATUS_FIELD_NAME)

        fields_by_name = {
            f.field_name: f
            for f in session.execute(
                select(CanonicalField).where(
                    CanonicalField.field_name.in_({m[0] for m in _CHECKBOX_GROUP_MAPPINGS}),
                    CanonicalField.tax_year == tax_year,
                )
            ).scalars().all()
        }

        field_ids = [f.id for f in fields_by_name.values()]
        old_mappings = session.execute(
            select(PdfFieldMapping).where(
                PdfFieldMapping.canonical_field_id.in_(field_ids),
                PdfFieldMapping.checkbox_match_value != "",
            )
        ).scalars().all()
        for m in old_mappings:
            session.delete(m)
        session.flush()

        created = 0
        for field_name, form_number, match_value, pdf_field_code, page_number in _CHECKBOX_GROUP_MAPPINGS:
            field = fields_by_name.get(field_name)
            if field is None:
                log.warning("checkbox_field_bridge.missing_field", field_name=field_name)
                continue
            session.add(
                PdfFieldMapping(
                    canonical_field_id=field.id,
                    form_number=form_number,
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

    print(f"checkbox field bridge complete: {created} checkbox-choice PDF field mappings created")
