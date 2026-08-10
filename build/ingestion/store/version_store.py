"""Immutable, content-addressed Version Store (Phase 1).

Every fetched artifact (HTML instructions, HTML publication, staged XSD/XSL)
is written once to `data/documents/<doc_type>/<hash-prefix>/<hash>.<ext>` and
recorded as a row in `documents`. Nothing is ever overwritten (ADR 0002):

  - If a document with the same content_hash already exists for the same
    (form_number, doc_type, source_url), it is a byte-for-byte re-fetch of
    something we already have — no new row, no new file (ADR 0004: hash is a
    dedup key).
  - If the source_url already has a *different* latest hash, a new Document
    row is inserted with version = previous.version + 1, and the previous
    row's `superseded_by` is set to the new row's id. The old row and its
    file are never deleted.
"""
from __future__ import annotations

import hashlib
from datetime import datetime, timezone
from pathlib import Path

from sqlalchemy import select

from db.models import Document
from db.session import get_session

DATA_ROOT = Path(__file__).resolve().parent.parent.parent.parent / "data" / "documents"

_EXT_BY_DOC_TYPE = {
    "instructions": "html",
    "publication": "html",
    "form": "pdf",
    "xsd": "xsd",
    "xsl": "xsl",
    "business_rules_csv": "csv",
}


def _hash(content: bytes) -> str:
    return hashlib.sha256(content).hexdigest()


def store_document(
    *,
    source_url: str,
    doc_type: str,
    form_number: str,
    tax_year: int,
    content: bytes,
    revision_date: str | None = None,
) -> Document:
    content_hash = _hash(content)
    ext = _EXT_BY_DOC_TYPE.get(doc_type, "bin")

    with get_session() as session:
        existing_same_hash = session.execute(
            select(Document).where(
                Document.source_url == source_url,
                Document.content_hash == content_hash,
            )
        ).scalar_one_or_none()
        if existing_same_hash is not None:
            return existing_same_hash

        prior_versions = session.execute(
            select(Document)
            .where(Document.source_url == source_url, Document.superseded_by.is_(None))
            .order_by(Document.version.desc())
        ).scalars().all()

        next_version = 1
        prior_latest = None
        if prior_versions:
            prior_latest = prior_versions[0]
            next_version = prior_latest.version + 1

        storage_dir = DATA_ROOT / doc_type / content_hash[:2]
        storage_dir.mkdir(parents=True, exist_ok=True)
        storage_path = storage_dir / f"{content_hash}.{ext}"
        if not storage_path.exists():
            storage_path.write_bytes(content)

        doc = Document(
            source_url=source_url,
            doc_type=doc_type,
            form_number=form_number,
            tax_year=tax_year,
            revision_date=revision_date,
            fetched_at=datetime.now(timezone.utc),
            content_hash=content_hash,
            storage_path=str(storage_path.relative_to(DATA_ROOT.parent.parent)),
            version=next_version,
        )
        session.add(doc)
        session.flush()

        if prior_latest is not None:
            prior_latest.superseded_by = doc.id

        session.commit()
        session.refresh(doc)
        return doc


def latest_documents(form_number: str, doc_type: str | None = None) -> list[Document]:
    with get_session() as session:
        stmt = select(Document).where(
            Document.form_number == form_number,
            Document.superseded_by.is_(None),
        )
        if doc_type:
            stmt = stmt.where(Document.doc_type == doc_type)
        return list(session.execute(stmt).scalars().all())
