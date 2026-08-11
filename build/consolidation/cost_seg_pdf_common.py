"""Shared helpers for hand-authored cost seg PDF field bridges."""
from __future__ import annotations

from sqlalchemy import select

from db.models import CanonicalField, Document, PdfFieldMapping
from db.session import get_session

_REASONING = (
    "Hand-verified PDF field mapping (cost seg pilot): confirmed against catalogued IRS PDF "
    "widget codes via PyMuPDF inspect_pdf_widgets, not LLM-inferred."
)


def get_catalogued_form_pdf_meta(form_number: str) -> tuple[str | None, str | None, str | None]:
    """Return (storage_path, form_revision, pdf_content_hash) for current form PDF."""
    with get_session() as session:
        doc = session.execute(
            select(Document)
            .where(
                Document.form_number == form_number,
                Document.doc_type == "form",
                Document.superseded_by.is_(None),
            )
            .order_by(Document.version.desc())
        ).scalars().first()
        if doc is None:
            return None, None, None
        revision = doc.revision_date or f"v{doc.version}"
        return doc.storage_path, revision, doc.content_hash


def upsert_pdf_mappings(
    form_number: str,
    mappings: list[tuple[str, str, int]],
    tax_year: int,
    form_revision: str | None,
    pdf_content_hash: str | None,
) -> tuple[int, int]:
    """Upsert hand mappings: (canonical_field_name, pdf_field_code, page_number)."""
    with get_session() as session:
        fields_by_name = {
            f.field_name: f
            for f in session.execute(
                select(CanonicalField).where(CanonicalField.tax_year == tax_year)
            ).scalars().all()
        }
        created = 0
        skipped = 0
        for field_name, pdf_field_code, page_number in mappings:
            field = fields_by_name.get(field_name)
            if field is None:
                skipped += 1
                continue
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
                existing.model_version = "hand_authored"
                existing.prompt_version = None
                existing.form_revision = form_revision
                existing.pdf_content_hash = pdf_content_hash
            else:
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
                        checkbox_match_value="",
                        tax_year=tax_year,
                        form_revision=form_revision,
                        pdf_content_hash=pdf_content_hash,
                    )
                )
            created += 1
        session.commit()
    return created, skipped
