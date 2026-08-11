"""Bonus depreciation eligibility and rates (TY2025)."""

from __future__ import annotations

from datetime import date
from typing import Any

from runtime.depreciation.constants import BONUS_REGIME_POST_2025, BONUS_REGIME_PRE_2025

OBBBA_CUTOVER = date(2025, 1, 20)
# Qualified property under §168(k) — recovery period 20 years or less.
MAX_BONUS_RECOVERY_YEARS = 20.0


def qualifies_for_bonus_depreciation(recovery_period: float) -> bool:
    return 0 < recovery_period <= MAX_BONUS_RECOVERY_YEARS


def _parse_date(value: Any) -> date | None:
    if value is None:
        return None
    if isinstance(value, date):
        return value
    if isinstance(value, str):
        try:
            return date.fromisoformat(value[:10])
        except ValueError:
            return None
    return None


def bonus_state(
    acquisition_date: Any,
    placed_in_service_date: Any,
    bonus_election: str | None = None,
) -> dict[str, Any]:
    acq = _parse_date(acquisition_date)
    pis = _parse_date(placed_in_service_date)
    if pis is None:
        return {
            "bonus_eligible": False,
            "bonus_regime": None,
            "bonus_statutory_rate": 0.0,
            "bonus_elected_rate": 0.0,
        }

    acq_for_regime = acq or pis
    if acq_for_regime >= OBBBA_CUTOVER:
        regime = BONUS_REGIME_POST_2025
        statutory = 1.0
    else:
        regime = BONUS_REGIME_PRE_2025
        statutory = 0.40

    elected = statutory
    if bonus_election == "elect_40_pct" and regime == BONUS_REGIME_POST_2025:
        elected = 0.40
    elif bonus_election == "opt_out":
        elected = 0.0

    return {
        "bonus_eligible": elected > 0,
        "bonus_regime": regime,
        "bonus_statutory_rate": statutory,
        "bonus_elected_rate": elected,
    }


def bonus_deduction(eligible_basis: float, rate: float) -> float:
    if eligible_basis <= 0 or rate <= 0:
        return 0.0
    return round(eligible_basis * rate, 2)
