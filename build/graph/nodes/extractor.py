"""Extractor node (Phase 4).

Calls the LLM client (or its deterministic stub fallback — see
llm_client.py) on the current scoped_context, and persists the result as a
brand-new, immutable EvidenceBundle row (ADR 0002/0003 — a retry never
edits a previous bundle, it creates another one).
"""
from __future__ import annotations

import hashlib
from datetime import datetime, timezone

from build.graph.llm_client import PROMPT_VERSION, extract
from build.graph.state import ExtractionState
from db.models import CitationEdge, EvidenceBundle
from db.session import get_session


def run(state: ExtractionState) -> ExtractionState:
    result = extract(state["scoped_context"], state["irs_line"])

    unresolved_count = 0
    resolved_count = len(state.get("reference_section_ids", []))
    with get_session() as session:
        unresolved_count = (
            session.query(CitationEdge)
            .filter(
                CitationEdge.from_section_id == state["primary_section_id"],
                CitationEdge.resolution_method == "unresolved",
            )
            .count()
        )

    total_refs = resolved_count + unresolved_count
    reference_resolution_confidence = (
        resolved_count / total_refs if total_refs > 0 else 1.0
    )

    confidence = {
        "extraction_confidence": result.extraction_confidence,
        "reference_resolution_confidence": round(reference_resolution_confidence, 3),
        "formula_confidence": 0.0,  # not applicable until Phase 7 synthesizes a formula
    }

    content_hash = hashlib.sha256(
        (state["scoped_context"] + result.model_version + PROMPT_VERSION).encode()
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
            reviewer=None,
            raw_llm_response=result.raw_response,
            confidence_breakdown=confidence,
            content_hash=content_hash,
        )
        session.add(bundle)
        session.commit()
        session.refresh(bundle)
        bundle_id = bundle.id

    draft_packet = {
        "core_text": result.core_text,
        "exceptions": result.exceptions,
        "needs_more_context": result.needs_more_context,
        "requested_topic": result.requested_topic,
        "confidence": confidence,
    }

    return {
        **state,
        "draft_packet": draft_packet,
        "model_version": result.model_version,
        "prompt_version": PROMPT_VERSION,
        "raw_llm_response": result.raw_response,
        "evidence_bundle_id": bundle_id,
        "attempt": state.get("attempt", 0) + 1,
    }
