"""Persist Packet node — writes the final (accepted or reviewer-corrected)
draft as an immutable `knowledge_packets` row."""
from __future__ import annotations

from build.graph.state import ExtractionState
from db.models import KnowledgePacket, Section
from db.session import get_session


def run(state: ExtractionState) -> ExtractionState:
    packet = state["draft_packet"]
    status = "validated" if state.get("review_status") == "resolved" else (
        "draft" if state.get("consistency_ok") else "needs_review"
    )

    with get_session() as session:
        section = session.get(Section, state["primary_section_id"])
        row = KnowledgePacket(
            evidence_bundle_id=state["evidence_bundle_id"],
            form_number=state["form_number"],
            irs_line=state["irs_line"],
            core_text=packet["core_text"],
            exceptions=packet["exceptions"],
            status=status,
            confidence_breakdown=packet["confidence"],
        )
        session.add(row)
        session.commit()
        session.refresh(row)
        packet_id = row.id

    return {**state, "knowledge_packet_id": packet_id, "status": status}
