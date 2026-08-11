"""Form 3115 look-back branch — deferred stub for Sprint 1."""
from __future__ import annotations

import structlog

log = structlog.get_logger(__name__)


def detect_lookback(activity: dict) -> bool:
    """True when property placed in service before current tax year and method change needed."""
    return bool(activity.get("lookback_required"))


def run_form_3115_lookback_bridge(tax_year: int = 2025) -> None:
    log.info("form_3115_lookback_bridge.deferred", tax_year=tax_year)
    print(
        "form_3115_lookback_bridge: deferred — look-back detection flag only; "
        "§481(a) and Form 3115 workflow not implemented in Sprint 1."
    )
