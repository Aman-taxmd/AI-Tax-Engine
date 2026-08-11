"""Year-1 MACRS amounts (GDS, simplified Pub 946 tables)."""

from __future__ import annotations

from datetime import date
from typing import Any

# First-year half-year convention rates (200% DB → year 1 = rate below)
GDS_HALF_YEAR_YEAR1_RATE: dict[float, float] = {
    5.0: 0.20,
    7.0: 0.1429,
}

# 15-year 150% DB half-year year 1
GDS_15_YEAR_HALF_YEAR_RATE = 0.05


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


def mid_month_year1(basis: float, recovery_years: float, placed_in_service: Any) -> float:
    pis = _parse_date(placed_in_service)
    if basis <= 0 or recovery_years <= 0:
        return 0.0
    if pis is None:
        return round(basis / recovery_years, 2)
    months = 12 - pis.month + 0.5
    if months < 0.5:
        months = 0.5
    return round((basis / recovery_years) * (months / 12.0), 2)


def macrs_year1(asset: dict[str, Any], basis_after_bonus: float) -> tuple[float, str]:
    """Return (year1_macrs, bucket_key) for Form 4562 Part III aggregation."""
    period = float(asset.get("recovery_period") or 0)
    pis = asset.get("placed_in_service_date")

    if period in (5.0, 7.0):
        rate = GDS_HALF_YEAR_YEAR1_RATE.get(period, 0.0)
        amount = round(basis_after_bonus * rate, 2)
        bucket = "macrs_5_year_amount" if period == 5.0 else "macrs_7_year_amount"
        return amount, bucket

    if period == 15.0:
        amount = round(basis_after_bonus * GDS_15_YEAR_HALF_YEAR_RATE, 2)
        return amount, "macrs_15_year_amount"

    if period == 27.5:
        amount = mid_month_year1(basis_after_bonus, 27.5, pis)
        return amount, "residential_real_property_amount"

    if period == 39.0:
        amount = mid_month_year1(basis_after_bonus, 39.0, pis)
        return amount, "nonresidential_real_property_amount"

    return 0.0, "other"
