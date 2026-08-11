"""Depreciation convention detection (mid-quarter guard v1)."""

from __future__ import annotations

from datetime import date
from typing import Any

from runtime.depreciation.constants import (
    CALCULATION_UNSUPPORTED,
    REASON_MID_QUARTER,
)


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


def requires_mid_quarter(assets: list[dict[str, Any]], tax_year: int) -> bool:
    """True when >40% of MACRS-eligible basis is placed in service in Q4."""
    eligible: list[tuple[float, date | None]] = []
    for asset in assets:
        period = float(asset.get("recovery_period") or 0)
        if period not in (5, 7, 15):
            continue
        basis = float(asset.get("depreciable_basis") or asset.get("basis") or 0)
        if basis <= 0:
            continue
        pis = _parse_date(asset.get("placed_in_service_date"))
        eligible.append((basis, pis))

    if not eligible:
        return False

    total_basis = sum(b for b, _ in eligible)
    if total_basis <= 0:
        return False

    q4_basis = 0.0
    for basis, pis in eligible:
        if pis is None or pis.year != tax_year:
            continue
        if pis.month >= 10:
            q4_basis += basis

    return (q4_basis / total_basis) > 0.40


def mid_quarter_guard(assets: list[dict[str, Any]], tax_year: int) -> dict[str, Any] | None:
    if requires_mid_quarter(assets, tax_year):
        return {
            "calculation_status": CALCULATION_UNSUPPORTED,
            "reason_codes": [REASON_MID_QUARTER],
        }
    return None
