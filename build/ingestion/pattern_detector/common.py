"""Shared helpers for the three pattern detectors (Phase 3), no LLM.

A detector's job is purely lexical: find a raw phrase in a Section's text
and, where possible, deterministically resolve it to a `to_section_id`
within the same document (or a `to_document_hint` naming another
document/form/publication for later cross-document resolution, e.g. by the
LangGraph cross-ref resolver in Phase 4, which is the only stage allowed to
use an LLM to resolve ambiguous references this regex pass could not).
"""
from __future__ import annotations

from dataclasses import dataclass

from sqlalchemy.orm import Session

from db.models import Section


@dataclass(frozen=True)
class DetectedEdge:
    edge_type: str  # exception_ref | carryover_ref | cardinality_ref
    raw_phrase: str
    to_document_hint: str | None
    to_section_id: str | None
    resolution_method: str  # regex | unresolved
    confidence: float


def resolve_line_ref_in_document(session: Session, document_id: str, line_ref: str) -> str | None:
    """Find another Section in the same document with a matching irs_line_ref."""
    row = (
        session.query(Section)
        .filter(Section.document_id == document_id, Section.irs_line_ref == line_ref)
        .first()
    )
    return row.id if row else None


def resolve_heading_in_document(session: Session, document_id: str, heading_fragment: str) -> str | None:
    """Find another Section in the same document whose heading matches.

    Tries an exact (case-insensitive, trailing-period-insensitive) match
    first — e.g. "Rollovers" against a heading of exactly "Rollovers". Only
    falls back to substring matching if no exact match exists, and among
    substring candidates picks the one with the smallest length difference
    (closest match), so a query for "Excess Employer Contributions" doesn't
    incorrectly resolve to the shorter, distinct heading "Employer
    Contributions" when both exist in the same document."""
    candidates = session.query(Section).filter(Section.document_id == document_id).all()
    needle = heading_fragment.strip().rstrip(".").lower()

    for c in candidates:
        if c.heading.strip().rstrip(".").lower() == needle:
            return c.id

    best_id: str | None = None
    best_len_diff = None
    for c in candidates:
        hay = c.heading.strip().rstrip(".").lower()
        if hay in needle or needle in hay:
            len_diff = abs(len(hay) - len(needle))
            if best_len_diff is None or len_diff < best_len_diff:
                best_len_diff = len_diff
                best_id = c.id
    return best_id
