"""Flatten activities[] engine output to canonical field names for runtime/engine."""

from __future__ import annotations

import re
from typing import Any

from runtime.depreciation.engine import compute_activities


def field_prefix(tax_activity_id: str) -> str:
    safe = tax_activity_id.replace(".", "_")
    return f"cost_seg.{safe}"


def instance_field_name(tax_activity_id: str, relative_field: str) -> str:
    return f"{field_prefix(tax_activity_id)}.{relative_field}"


def discover_activity_ids(computed: dict[str, Any]) -> list[str]:
    """Fallback/debug: extract activity IDs from flattened computed keys."""
    ids: list[str] = []
    seen: set[str] = set()
    for key in computed:
        m = re.match(r"^cost_seg\.([^.]+)\.depreciation\.", key)
        if m and m.group(1) not in seen:
            seen.add(m.group(1))
            ids.append(m.group(1))
    return ids


def flatten_cost_seg_result(result: dict[str, Any]) -> dict[str, Any]:
    """Map nested activities result to flat canonical field dict."""
    flat: dict[str, Any] = {}
    summary = (result.get("taxpayer") or {}).get("depreciation_summary") or {}
    flat["taxpayer.depreciation_summary.bonus_amount"] = summary.get("bonus_amount")
    flat["taxpayer.depreciation_summary.macrs_amount"] = summary.get("macrs_amount")
    flat["taxpayer.depreciation_summary.total_amount"] = summary.get("total_amount")
    flat["taxpayer.depreciation_summary.summary_status"] = summary.get("summary_status", "empty")
    flat["taxpayer.depreciation_summary.blocked_activity_count"] = summary.get("blocked_activity_count", 0)
    flat["taxpayer.depreciation_summary.supported_activity_count"] = summary.get("supported_activity_count", 0)

    for act in result.get("activities") or []:
        tid = act.get("tax_activity_id") or "activity_001"
        p = field_prefix(tid)
        dep = act.get("depreciation") or {}
        f4562 = act.get("form_4562") or {}
        sch_e = act.get("schedule_e") or {}
        lim = act.get("limitations") or {}

        flat[f"{p}.depreciation.bonus_amount"] = dep.get("bonus_amount")
        flat[f"{p}.depreciation.macrs_amount"] = dep.get("macrs_amount")
        flat[f"{p}.depreciation.total_amount"] = dep.get("total_amount")
        flat[f"{p}.depreciation.calculation_status"] = dep.get("calculation_status", "supported")
        flat[f"{p}.depreciation.reason_codes"] = dep.get("reason_codes") or []

        flat[f"{p}.form_4562.required"] = f4562.get("required", False)
        flat[f"{p}.form_4562.instance_status"] = f4562.get("instance_status", "not_required")
        flat[f"{p}.form_4562.special_allowance_amount"] = f4562.get("special_allowance_amount")
        flat[f"{p}.form_4562.macrs_5_year_amount"] = f4562.get("macrs_5_year_amount")
        flat[f"{p}.form_4562.macrs_7_year_amount"] = f4562.get("macrs_7_year_amount")
        flat[f"{p}.form_4562.macrs_15_year_amount"] = f4562.get("macrs_15_year_amount")
        flat[f"{p}.form_4562.residential_real_property_amount"] = f4562.get("residential_real_property_amount")
        flat[f"{p}.form_4562.nonresidential_real_property_amount"] = f4562.get("nonresidential_real_property_amount")
        flat[f"{p}.form_4562.total_depreciation_amount"] = f4562.get("total_depreciation_amount")

        flat[f"{p}.schedule_e.depreciation_expense"] = sch_e.get("depreciation_expense")

        flat[f"{p}.limitations.loss_after_basis_amount"] = lim.get("loss_after_basis_amount")
        flat[f"{p}.limitations.loss_after_at_risk_amount"] = lim.get("loss_after_at_risk_amount")
        flat[f"{p}.limitations.passive_allowed_loss_amount"] = lim.get("passive_allowed_loss_amount")
        flat[f"{p}.limitations.loss_after_excess_business_loss_amount"] = lim.get(
            "loss_after_excess_business_loss_amount"
        )

    return flat


def merge_cost_seg_into_answers(
    answers: dict[str, Any],
    profile_answers: dict[str, Any],
    tax_year: int = 2025,
) -> dict[str, Any]:
    """Run engine when activities[] present; merge flat fields into answers copy."""
    merged = dict(answers)
    activities = merged.get("activities")
    if not activities or not isinstance(activities, list):
        return merged
    result = compute_activities(activities, tax_year=tax_year, profile_answers=profile_answers)
    merged["_cost_seg_result"] = result
    flat = flatten_cost_seg_result(result)
    merged.update(flat)
    return merged
