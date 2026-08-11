"""Promote hand-verified PDF ground truth into PdfFieldMapping rows (ADR 0012)."""
from __future__ import annotations

from sqlalchemy import select

from build.consolidation.cost_seg_pdf_common import get_catalogued_form_pdf_meta
from build.consolidation.hand_pdf_ground_truth import GROUND_TRUTH_MAPPINGS
from db.models import CanonicalField, HumanReviewItem, PdfFieldMapping
from db.session import get_session

_REASONING = (
    "Promoted from hand-verified ground truth (hand_pdf_ground_truth.py) after map-pdf-fields review."
)


def promote_pdf_mappings_from_ground_truth(
    form_number: str,
    tax_year: int = 2025,
) -> tuple[int, int]:
    mappings = GROUND_TRUTH_MAPPINGS.get(form_number)
    if not mappings:
        print(f"promote_pdf_mappings: no ground truth for form={form_number}")
        return 0, 0

    _path, revision, content_hash = get_catalogued_form_pdf_meta(form_number)
    promoted = 0
    skipped = 0

    with get_session() as session:
        fields_by_name = {
            f.field_name: f
            for f in session.execute(
                select(CanonicalField).where(CanonicalField.tax_year == tax_year)
            ).scalars().all()
        }

        for field_name, pdf_field_code, page_number in mappings:
            field = fields_by_name.get(field_name)
            if field is None:
                skipped += 1
                continue

            for item in session.execute(
                select(HumanReviewItem).where(
                    HumanReviewItem.related_type == "pdf_field_mapping",
                    HumanReviewItem.related_id == field.id,
                    HumanReviewItem.status == "pending",
                )
            ).scalars().all():
                session.delete(item)

            existing = session.execute(
                select(PdfFieldMapping).where(
                    PdfFieldMapping.canonical_field_id == field.id,
                    PdfFieldMapping.form_number == form_number,
                    PdfFieldMapping.checkbox_match_value == "",
                )
            ).scalars().first()

            if existing is not None:
                existing.pdf_field_code = pdf_field_code
                existing.page_number = page_number
                existing.confidence = 1.0
                existing.reasoning = _REASONING
                existing.model_version = "human_review"
                existing.prompt_version = None
                existing.form_revision = revision
                existing.pdf_content_hash = content_hash
            else:
                session.add(
                    PdfFieldMapping(
                        canonical_field_id=field.id,
                        form_number=form_number,
                        pdf_field_code=pdf_field_code,
                        page_number=page_number,
                        confidence=1.0,
                        reasoning=_REASONING,
                        model_version="human_review",
                        prompt_version=None,
                        checkbox_match_value="",
                        tax_year=tax_year,
                        form_revision=revision,
                        pdf_content_hash=content_hash,
                    )
                )
            promoted += 1

        session.commit()

    print(
        f"promote_pdf_mappings: form={form_number} promoted={promoted} skipped={skipped} "
        f"(revision={revision!r})"
    )
    return promoted, skipped


def promote_all_cost_seg_and_w2(tax_year: int = 2025) -> None:
    for form in ("4562", "1040se", "w2"):
        promote_pdf_mappings_from_ground_truth(form, tax_year)
