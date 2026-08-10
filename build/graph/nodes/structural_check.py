"""Structural Check node (Phase 5).

A cheap, deterministic sanity pass — NOT the rigorous consistency check from
Phase 8 (which operates on the synthesized rule set as a whole). This one
only asks: "is this single draft packet internally sound enough to be worth
a human's time, or is it obviously broken?" Per the plan, this belongs right
after extraction/resolution, before the packet is treated as usable —
catching an empty extraction or an ungrounded exception here is far cheaper
than discovering it during synthesis (Phase 7) or evaluation (Phase 8).
"""
from __future__ import annotations

from build.graph.state import ExtractionState

MIN_EXTRACTION_CONFIDENCE = 0.4


def run(state: ExtractionState) -> ExtractionState:
    packet = state["draft_packet"]
    issues: list[str] = []

    if not packet["core_text"].strip():
        issues.append("core_text is empty")

    if packet.get("needs_more_context"):
        issues.append(
            f"extractor still requested more context ('{packet.get('requested_topic')}') "
            "and the resolver could not satisfy it"
        )

    confidence = packet.get("confidence", {})
    if confidence.get("extraction_confidence", 0.0) < MIN_EXTRACTION_CONFIDENCE:
        issues.append(
            f"extraction_confidence {confidence.get('extraction_confidence')} "
            f"below minimum {MIN_EXTRACTION_CONFIDENCE}"
        )

    scoped_context = state["scoped_context"]
    for exc in packet.get("exceptions", []):
        text = exc.get("text", "")
        # Grounding sanity: the exception text should actually be traceable to
        # the scoped context, not invented. Exact-substring is the strict
        # deterministic check available here; a semantic LLM-judge grounding
        # check runs later in Phase 8 for the synthesized rule as a whole.
        if text and text not in scoped_context:
            issues.append(f"ungrounded exception text (not found verbatim in scoped context): {text[:80]!r}")

    return {
        **state,
        "consistency_ok": len(issues) == 0,
        "consistency_issues": issues,
    }
