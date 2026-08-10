"""Human Review node (Phase 5).

Uses LangGraph's `interrupt()` to genuinely pause the workflow — this is the
one node in the whole build pipeline where a person, not code, decides what
happens next (ADR 0006: LangGraph is scoped to exactly this kind of
branching/human-interrupt need). The graph is checkpointed to SQLite (see
build_graph.py) so the pause survives across separate CLI invocations: a
reviewer can resolve it hours later with `python -m build.cli review-queue`
/ `resolve-review`, in a different process, and the resume value flows back
into this exact point in the workflow.

When resumed, the reviewer's correction becomes a NEW evidence bundle
tagged `source_type=human_review` (never edits the LLM's original bundle —
ADR 0002/0003), and is treated as authoritative.
"""
from __future__ import annotations

import hashlib
from datetime import datetime, timezone

from langgraph.types import interrupt

from build.graph.llm_client import PROMPT_VERSION, extract_with_feedback
from build.graph.state import ExtractionState
from db.models import EvidenceBundle
from db.session import get_session


def run(state: ExtractionState) -> ExtractionState:
    resolution = interrupt(
        {
            "irs_line": state["irs_line"],
            "primary_section_id": state["primary_section_id"],
            "consistency_issues": state["consistency_issues"],
            "draft_packet": state["draft_packet"],
        }
    )
    # `resolution` is whatever value the reviewer supplies via
    # Command(resume=...). Expected shape:
    #   {"action": "accept"} — accept the draft as-is despite the flagged
    #     issues (reviewer judgment overrides the heuristic).
    #   {"action": "correct", "core_text": ..., "exceptions": [...],
    #     "reviewer": "name"} — replace the packet body by hand.
    #   {"action": "retry_with_feedback", "feedback": "...", "reviewer":
    #     "name"} — re-run extraction with the reviewer's note injected into
    #     the prompt (see llm_client.extract_with_feedback), producing a NEW
    #     draft/evidence bundle that goes back through structural_check for
    #     a fresh look (see build_graph.py's routing) rather than
    #     terminating — it may pause here again if issues remain.

    reviewer = resolution.get("reviewer", "unknown_reviewer")

    if resolution.get("action") == "retry_with_feedback":
        return _retry_with_feedback(state, resolution, reviewer)

    draft_packet = dict(state["draft_packet"])
    if resolution.get("action") == "correct":
        draft_packet["core_text"] = resolution.get("core_text", draft_packet["core_text"])
        draft_packet["exceptions"] = resolution.get("exceptions", draft_packet["exceptions"])
        draft_packet["needs_more_context"] = False

    content_hash = hashlib.sha256(
        (draft_packet["core_text"] + reviewer + str(resolution)).encode()
    ).hexdigest()

    with get_session() as session:
        bundle = EvidenceBundle(
            source_type="human_review",
            document_version_id=None,
            section_ids=[state["primary_section_id"], *state.get("reference_section_ids", [])],
            exact_quotes=[draft_packet["core_text"]],
            prompt_version=None,
            model_version=None,
            temperature=None,
            extraction_timestamp=datetime.now(timezone.utc),
            reviewer=reviewer,
            raw_llm_response=None,
            confidence_breakdown={
                "extraction_confidence": 1.0,
                "reference_resolution_confidence": 1.0,
                "formula_confidence": 0.0,
            },
            content_hash=content_hash,
        )
        session.add(bundle)
        session.commit()
        session.refresh(bundle)
        bundle_id = bundle.id

    return {
        **state,
        "draft_packet": draft_packet,
        "evidence_bundle_id": bundle_id,
        "consistency_ok": True,
        "consistency_issues": [],
        "review_status": "resolved",
    }


def _retry_with_feedback(state: ExtractionState, resolution: dict, reviewer: str) -> ExtractionState:
    feedback = resolution.get("feedback", "")
    result = extract_with_feedback(state["scoped_context"], state["irs_line"], feedback)

    confidence = {
        "extraction_confidence": result.extraction_confidence,
        "reference_resolution_confidence": state["draft_packet"].get("confidence", {}).get(
            "reference_resolution_confidence", 1.0
        ),
        "formula_confidence": 0.0,
    }
    draft_packet = {
        "core_text": result.core_text,
        "exceptions": result.exceptions,
        "needs_more_context": result.needs_more_context,
        "requested_topic": result.requested_topic,
        "confidence": confidence,
    }

    content_hash = hashlib.sha256(
        (draft_packet["core_text"] + reviewer + feedback + result.model_version).encode()
    ).hexdigest()

    with get_session() as session:
        bundle = EvidenceBundle(
            source_type="llm_extraction",
            document_version_id=None,
            section_ids=[state["primary_section_id"], *state.get("reference_section_ids", [])],
            exact_quotes=[state["scoped_context"]],
            prompt_version=PROMPT_VERSION,
            model_version=result.model_version,
            temperature=0.0,
            extraction_timestamp=datetime.now(timezone.utc),
            reviewer=f"{reviewer} (retry_with_feedback)",
            raw_llm_response=result.raw_response,
            confidence_breakdown=confidence,
            content_hash=content_hash,
        )
        session.add(bundle)
        session.commit()
        session.refresh(bundle)
        bundle_id = bundle.id

    return {
        **state,
        "draft_packet": draft_packet,
        "model_version": result.model_version,
        "raw_llm_response": result.raw_response,
        "evidence_bundle_id": bundle_id,
        "consistency_ok": False,
        "consistency_issues": [],
        "review_status": "retry_pending",
        "human_correction": feedback,
        "feedback_history": [*state.get("feedback_history", []), feedback],
    }
