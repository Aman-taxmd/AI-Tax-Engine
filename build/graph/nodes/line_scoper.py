"""Line Scoper node (Phase 4).

Assembles `scoped_context`: the primary line's Section text, plus the text
of every reference section already resolved (either by the Phase 3 regex
pass, or by a previous cross_ref_resolver loop iteration in this same run).
This is the concrete mechanism behind the plan's "narrow LLM context"
principle — never more than one line's text plus its explicitly resolved
references, never a whole document.
"""
from __future__ import annotations

from sqlalchemy import select

from build.graph.state import ExtractionState
from db.models import CitationEdge, Section
from db.session import get_session

MAX_INITIAL_REFERENCES = 4


def run(state: ExtractionState) -> ExtractionState:
    with get_session() as session:
        primary = session.get(Section, state["primary_section_id"])

        reference_ids: list[str] = list(state.get("reference_section_ids", []))
        if state.get("attempt", 0) == 0:
            resolved = session.execute(
                select(CitationEdge.to_section_id)
                .where(
                    CitationEdge.from_section_id == primary.id,
                    CitationEdge.to_section_id.isnot(None),
                    CitationEdge.resolution_method == "regex",
                )
                .distinct()
                .limit(MAX_INITIAL_REFERENCES)
            ).scalars().all()
            reference_ids = [r for r in resolved if r != primary.id]

        parts = [f"[{primary.heading} | Line {primary.irs_line_ref}]\n{primary.text}"]
        for ref_id in reference_ids:
            ref = session.get(Section, ref_id)
            if ref is not None:
                parts.append(f"[{ref.heading}]\n{ref.text}")

        scoped_context = "\n\n---\n\n".join(parts)

    return {
        **state,
        "reference_section_ids": reference_ids,
        "scoped_context": scoped_context,
    }
