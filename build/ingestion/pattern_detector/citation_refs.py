"""exception_ref detection (Phase 3), no LLM.

Finds sentences that point a reader somewhere else for a definition,
exception, or special rule — "See X", "Pub. N", "Form N", or an internal
"<Topic>, earlier/later" back/forward reference. These are exactly the kind
of cross-cutting exceptions ("defined in one place, applies in several
others") the plan calls out as the reason a naive per-line RAG lookup would
miss information — every one found here becomes a `citation_edges` row so
Phase 4 can pull the referenced text into the same scoped extraction.
"""
from __future__ import annotations

import re

from sqlalchemy.orm import Session

from build.ingestion.pattern_detector.common import (
    DetectedEdge,
    resolve_heading_in_document,
)
from db.models import Document, Section

_SENTENCE_SPLIT = re.compile(r"(?<=[.!?])\s+")

_SEE_TOPIC = re.compile(r"\bSee\s+([A-Z][A-Za-z0-9 .,'\-]{2,60}?)(?:,\s*(earlier|later))?[.,]", re.MULTILINE)
_PUBLICATION_REF = re.compile(r"\bPub\.?\s*(\d{2,4}(?:-[A-Z])?)\b")
_FORM_REF = re.compile(r"\bForm\s+(\d{3,4}[A-Z]?(?:-[A-Z]{1,4})?)\b")
_INTERNAL_LATER_EARLIER = re.compile(r"\b([A-Z][A-Za-z0-9 '\-]{2,50}?)\s*,\s*(earlier|later)\b")


def detect(session: Session, section: Section) -> list[DetectedEdge]:
    if not section.text:
        return []
    own_form_number = session.get(Document, section.document_id).form_number
    edges: list[DetectedEdge] = []
    for sentence in _SENTENCE_SPLIT.split(section.text):
        for m in _SEE_TOPIC.finditer(sentence):
            topic = m.group(1).strip().rstrip(".,")
            if len(topic) < 4 or topic.lower() == "pub":
                continue  # too short to be a real topic reference (e.g. "See Pub." with no number)
            target_id = resolve_heading_in_document(session, section.document_id, topic)
            edges.append(
                DetectedEdge(
                    edge_type="exception_ref",
                    raw_phrase=sentence.strip(),
                    to_document_hint=None if target_id else topic,
                    to_section_id=target_id,
                    resolution_method="regex" if target_id else "unresolved",
                    confidence=0.8 if target_id else 0.35,
                )
            )

        for m in _PUBLICATION_REF.finditer(sentence):
            edges.append(
                DetectedEdge(
                    edge_type="exception_ref",
                    raw_phrase=sentence.strip(),
                    to_document_hint=f"Publication {m.group(1)}",
                    to_section_id=None,
                    resolution_method="unresolved",  # cross-document; resolved in Phase 4/6
                    confidence=0.6,
                )
            )

        for m in _FORM_REF.finditer(sentence):
            if m.group(1) == own_form_number:
                continue  # a form's own instructions mentioning its own number isn't a citation
            edges.append(
                DetectedEdge(
                    edge_type="exception_ref",
                    raw_phrase=sentence.strip(),
                    to_document_hint=f"Form {m.group(1)}",
                    to_section_id=None,
                    resolution_method="unresolved",
                    confidence=0.6,
                )
            )

        for m in _INTERNAL_LATER_EARLIER.finditer(sentence):
            topic = m.group(1).strip()
            if _SEE_TOPIC.search(f"See {topic},"):
                continue  # already captured by the "See X, earlier/later" pattern above
            target_id = resolve_heading_in_document(session, section.document_id, topic)
            if target_id and target_id != section.id:
                edges.append(
                    DetectedEdge(
                        edge_type="exception_ref",
                        raw_phrase=sentence.strip(),
                        to_document_hint=None,
                        to_section_id=target_id,
                        resolution_method="regex",
                        confidence=0.75,
                    )
                )
    return edges
