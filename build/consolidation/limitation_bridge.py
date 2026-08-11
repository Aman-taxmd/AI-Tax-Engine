"""Limitation layer normalized interfaces (6198 / 8582 / 461 pass-through when N/A)."""
from __future__ import annotations

from build.consolidation.cost_seg_bridge import run_cost_seg_bridge


def run_limitation_bridge(tax_year: int = 2025) -> None:
    """Limitation fields registered on activities[] via cost_seg_bridge."""
    run_cost_seg_bridge(tax_year)
    print("limitation_bridge: normalized limitation fields registered per activity")
