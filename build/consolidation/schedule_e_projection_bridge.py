"""Schedule E projection bridge — documents parallel projection from engine."""
from __future__ import annotations

from build.consolidation.cost_seg_bridge import run_cost_seg_bridge


def run_schedule_e_projection_bridge(tax_year: int = 2025) -> None:
    run_cost_seg_bridge(tax_year)
    print("schedule_e_projection_bridge: schedule_e.depreciation_expense carryovers registered")
