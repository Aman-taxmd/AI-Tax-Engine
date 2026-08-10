"""Graph state for the Phase 4/5 Knowledge Extraction workflow.

One graph run processes exactly one (form, irs_line) — this is the "narrow
LLM context" principle from the plan: `scoped_context` never contains more
than the primary Section's text plus a small, explicitly-resolved set of
referenced sections, never a whole document.
"""
from __future__ import annotations

from typing import Literal, TypedDict


class ExceptionDraft(TypedDict):
    text: str
    citation: str | None


class DraftPacket(TypedDict):
    core_text: str
    exceptions: list[ExceptionDraft]
    needs_more_context: bool
    requested_topic: str | None
    confidence: dict[str, float]


class ExtractionState(TypedDict, total=False):
    form_number: str
    irs_line: str
    primary_section_id: str
    attempt: int
    max_attempts: int
    reference_section_ids: list[str]
    scoped_context: str
    draft_packet: DraftPacket
    model_version: str
    prompt_version: str
    raw_llm_response: str
    evidence_bundle_id: str
    knowledge_packet_id: str
    consistency_ok: bool
    consistency_issues: list[str]
    # "retry_pending": a reviewer asked for a feedback-driven re-extraction
    # (see human_review.py) — routes back through structural_check for a
    # fresh look rather than straight to persist_packet.
    review_status: Literal["not_needed", "pending", "resolved", "retry_pending"]
    human_correction: str | None
    feedback_history: list[str]
    status: str
