"""Roll up asset calculation_status to activity level."""

from __future__ import annotations

from runtime.depreciation.constants import (
    CALCULATION_MANUAL_REVIEW,
    CALCULATION_SUPPORTED,
    CALCULATION_UNSUPPORTED,
)


def rollup_activity_status(asset_statuses: list[dict]) -> dict:
    if not asset_statuses:
        return {"calculation_status": CALCULATION_SUPPORTED, "reason_codes": []}

    statuses = [a.get("calculation_status", CALCULATION_SUPPORTED) for a in asset_statuses]
    all_reasons: list[str] = []
    for a in asset_statuses:
        for code in a.get("reason_codes") or []:
            if code not in all_reasons:
                all_reasons.append(code)

    if CALCULATION_MANUAL_REVIEW in statuses:
        return {"calculation_status": CALCULATION_MANUAL_REVIEW, "reason_codes": all_reasons}
    if CALCULATION_UNSUPPORTED in statuses:
        return {"calculation_status": CALCULATION_UNSUPPORTED, "reason_codes": all_reasons}
    return {"calculation_status": CALCULATION_SUPPORTED, "reason_codes": []}
