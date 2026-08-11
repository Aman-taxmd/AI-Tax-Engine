"""Strategy Estimate building-type profiles (modeled defaults — not filing-grade)."""

from __future__ import annotations

# Mirrors TaxCore cost_segregation_building_types defaults.
BUILDING_PROFILES: dict[str, dict[str, float]] = {
    "residential_sfh": {
        "land_pct": 0.20,
        "reclass_5yr_pct": 0.12,
        "reclass_7yr_pct": 0.03,
        "reclass_15yr_pct": 0.07,
        "recovery_period": 27.5,
    },
    "residential_multifamily": {
        "land_pct": 0.15,
        "reclass_5yr_pct": 0.10,
        "reclass_7yr_pct": 0.04,
        "reclass_15yr_pct": 0.08,
        "recovery_period": 27.5,
    },
    "commercial_office_building": {
        "land_pct": 0.15,
        "reclass_5yr_pct": 0.08,
        "reclass_7yr_pct": 0.05,
        "reclass_15yr_pct": 0.10,
        "recovery_period": 39.0,
    },
    "commercial_retail": {
        "land_pct": 0.18,
        "reclass_5yr_pct": 0.10,
        "reclass_7yr_pct": 0.04,
        "reclass_15yr_pct": 0.09,
        "recovery_period": 39.0,
    },
}


def profile_for(building_type: str) -> dict[str, float]:
    return dict(
        BUILDING_PROFILES.get(
            building_type,
            {
                "land_pct": 0.20,
                "reclass_5yr_pct": 0.12,
                "reclass_7yr_pct": 0.03,
                "reclass_15yr_pct": 0.07,
                "recovery_period": 27.5,
            },
        )
    )
