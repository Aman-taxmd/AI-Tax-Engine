"""Hand-authored Form 4562 Part II–IV canonical fields (cost seg pilot).

Maps IRS XSD elements to cost_seg activity projections. Full LLM synthesize
can extend this; Sprint 1 uses deterministic engine output fields.
"""
from __future__ import annotations

from build.consolidation.cost_seg_bridge import run_cost_seg_bridge


def run_form_4562_pilot_bridge(tax_year: int = 2025) -> None:
    """Register 4562-related fields via cost_seg_bridge (idempotent)."""
    run_cost_seg_bridge(tax_year)
    print("form_4562_pilot_bridge: Parts II–IV fields registered via cost_seg_bridge")
