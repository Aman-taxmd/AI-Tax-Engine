"""Shared helpers for deterministic evidence bundles on hand bridges."""
from __future__ import annotations

import hashlib
import json

from sqlalchemy import select

from db.models import EvidenceBundle
from db.session import get_session


def upsert_deterministic_evidence(
    *,
    quote: str,
    document_version_id: str | None = None,
    section_ids: list[str] | None = None,
    note: str = "",
) -> str:
    """Create or reuse an immutable deterministic_parse evidence bundle."""
    payload = {
        "quote": quote,
        "document_version_id": document_version_id,
        "section_ids": section_ids or [],
        "note": note,
    }
    content_hash = hashlib.sha256(json.dumps(payload, sort_keys=True).encode()).hexdigest()
    with get_session() as session:
        existing = session.execute(
            select(EvidenceBundle).where(EvidenceBundle.content_hash == content_hash)
        ).scalars().first()
        if existing is not None:
            return existing.id
        bundle = EvidenceBundle(
            source_type="deterministic_parse",
            document_version_id=document_version_id,
            section_ids=section_ids or [],
            exact_quotes=[quote],
            prompt_version=None,
            model_version="deterministic-bridge-v1",
            temperature=None,
            reviewer=None,
            raw_llm_response=None,
            confidence_breakdown={"note": note} if note else {},
            content_hash=content_hash,
        )
        session.add(bundle)
        session.commit()
        return bundle.id
