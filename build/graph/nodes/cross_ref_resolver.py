"""Cross-Reference Resolver node (Phase 4).

Runs only when the extractor flagged `needs_more_context`. Attempts to
resolve the `requested_topic` to another Section in the same document using
a looser (token-overlap) match than Phase 3's strict regex pass — this is
deliberately the *only* place besides the LLM extractor itself that tries
harder than a plain regex, since by this point we know specifically what's
missing rather than scanning blindly. If resolved, the new section is added
to `reference_section_ids` and the graph loops back to `line_scoper` to
rebuild `scoped_context` with the richer reference set (per the plan's
"one pass corrects what another missed" requirement — this is the concrete
implementation of that idea). If not resolved, the graph proceeds anyway
rather than looping forever.
"""
from __future__ import annotations

import re

from build.graph.state import ExtractionState
from db.models import Section
from db.session import get_session


def _tokenize(text: str) -> set[str]:
    return {t.lower() for t in re.findall(r"[A-Za-z]{3,}", text)}


def run(state: ExtractionState) -> ExtractionState:
    topic = state["draft_packet"].get("requested_topic")
    if not topic:
        return {**state, "resolver_found_new": False}

    with get_session() as session:
        primary = session.get(Section, state["primary_section_id"])
        candidates = (
            session.query(Section)
            .filter(Section.document_id == primary.document_id)
            .all()
        )
        topic_tokens = _tokenize(topic)
        best_match: Section | None = None
        best_overlap = 0
        for c in candidates:
            if c.id in state.get("reference_section_ids", []) or c.id == primary.id:
                continue
            overlap = len(topic_tokens & _tokenize(c.heading))
            if overlap > best_overlap:
                best_overlap = overlap
                best_match = c

        if best_match is not None and best_overlap >= 1:
            return {
                **state,
                "reference_section_ids": [*state.get("reference_section_ids", []), best_match.id],
                "resolver_found_new": True,
            }

    return {**state, "resolver_found_new": False}
