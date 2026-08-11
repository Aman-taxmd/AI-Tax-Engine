"""Estimate-mode asset classification from building profiles."""

from __future__ import annotations

import uuid
from typing import Any

from runtime.depreciation.profiles import profile_for


def classify_estimate_activity(activity: dict[str, Any]) -> list[dict[str, Any]]:
    """Expand one activity intake row into depreciable asset records."""
    building_type = activity.get("building_type") or activity.get("cost_seg_building_type") or "residential_sfh"
    total_cost = float(activity.get("cost_or_other_basis") or activity.get("total_cost") or 0)
    if total_cost <= 0:
        return []

    cfg = profile_for(str(building_type))
    land_value = round(total_cost * cfg["land_pct"], 2)
    depreciable = total_cost - land_value
    basis_5 = round(depreciable * cfg["reclass_5yr_pct"], 2)
    basis_7 = round(depreciable * cfg["reclass_7yr_pct"], 2)
    basis_15 = round(depreciable * cfg["reclass_15yr_pct"], 2)
    short_life = basis_5 + basis_7 + basis_15
    structure_basis = depreciable - short_life
    recovery = float(cfg["recovery_period"])

    tax_activity_id = activity.get("tax_activity_id") or "activity_001"
    study_group = activity.get("cost_seg_study_group_id") or f"study_{tax_activity_id}"
    pis = activity.get("date_placed_in_service") or activity.get("placed_in_service_date")
    acq = activity.get("acquisition_date") or pis

    common = {
        "tax_activity_id": tax_activity_id,
        "cost_seg_study_group_id": study_group,
        "placed_in_service_date": pis,
        "acquisition_date": acq,
        "calculation_status": "supported",
        "reason_codes": [],
    }

    assets: list[dict[str, Any]] = []
    if basis_5 > 0:
        assets.append(
            {
                **common,
                "asset_id": f"{tax_activity_id}_gds_5",
                "record_role": "gds_5_year",
                "recovery_period": 5.0,
                "depreciable_basis": basis_5,
                "basis": basis_5,
            }
        )
    if basis_7 > 0:
        assets.append(
            {
                **common,
                "asset_id": f"{tax_activity_id}_gds_7",
                "record_role": "gds_7_year",
                "recovery_period": 7.0,
                "depreciable_basis": basis_7,
                "basis": basis_7,
            }
        )
    if basis_15 > 0:
        assets.append(
            {
                **common,
                "asset_id": f"{tax_activity_id}_gds_15",
                "record_role": "gds_15_year",
                "recovery_period": 15.0,
                "depreciable_basis": basis_15,
                "basis": basis_15,
            }
        )
    if structure_basis > 0:
        bucket = "gds_27_5_year" if recovery == 27.5 else "gds_39_year"
        assets.append(
            {
                **common,
                "asset_id": f"{tax_activity_id}_structure",
                "record_role": bucket,
                "recovery_period": recovery,
                "depreciable_basis": structure_basis,
                "basis": structure_basis,
            }
        )
    return assets


def normalize_study_assets(assets: list[dict[str, Any]], tax_activity_id: str) -> list[dict[str, Any]]:
    out: list[dict[str, Any]] = []
    for raw in assets:
        if not isinstance(raw, dict):
            continue
        asset = dict(raw)
        asset.setdefault("asset_id", str(uuid.uuid4())[:8])
        asset.setdefault("tax_activity_id", tax_activity_id)
        asset.setdefault("calculation_status", "supported")
        asset.setdefault("reason_codes", [])
        basis = float(asset.get("depreciable_basis") or asset.get("basis") or 0)
        asset["depreciable_basis"] = basis
        asset["basis"] = basis
        out.append(asset)
    return out
