"""Per-activity depreciation engine orchestrator."""

from __future__ import annotations

from typing import Any

from runtime.depreciation.bonus import bonus_deduction, bonus_state, qualifies_for_bonus_depreciation
from runtime.depreciation.classification import classify_estimate_activity, normalize_study_assets
from runtime.depreciation.constants import (
    CALCULATION_SUPPORTED,
    CALCULATION_UNSUPPORTED,
    MODE_ESTIMATE,
    MODE_STUDY_BACKED,
)
from runtime.depreciation.convention import mid_quarter_guard
from runtime.depreciation.macrs import macrs_year1
from runtime.depreciation.status import rollup_activity_status


def _null_amounts() -> dict[str, Any]:
    return {"bonus_amount": None, "macrs_amount": None, "total_amount": None}


def _empty_form_4562() -> dict[str, Any]:
    return {
        "required": False,
        "instance_status": "not_required",
        "special_allowance_amount": None,
        "macrs_5_year_amount": None,
        "macrs_7_year_amount": None,
        "macrs_15_year_amount": None,
        "residential_real_property_amount": None,
        "nonresidential_real_property_amount": None,
        "total_depreciation_amount": None,
    }


def _blocked_dep(status: dict[str, Any]) -> dict[str, Any]:
    return {**_null_amounts(), **status}


def _compute_activity(
    activity: dict[str, Any],
    tax_year: int,
    profile_answers: dict[str, Any],
) -> dict[str, Any]:
    tax_activity_id = activity.get("tax_activity_id") or "activity_001"
    mode = activity.get("calculation_mode") or activity.get("depreciation_calculation_mode") or MODE_ESTIMATE

    if mode == MODE_ESTIMATE:
        assets = classify_estimate_activity(activity)
    else:
        assets = normalize_study_assets(activity.get("assets") or [], tax_activity_id)

    guard = mid_quarter_guard(assets, tax_year)
    if guard:
        status = guard
        dep = _blocked_dep(status)
        form_4562 = _empty_form_4562()
        form_4562["required"] = True
        form_4562["instance_status"] = "blocked"
        for a in assets:
            a["calculation_status"] = status["calculation_status"]
            a["reason_codes"] = list(status["reason_codes"])
        return _activity_result(
            tax_activity_id, activity, assets, dep, form_4562, profile_answers, blocked=True
        )

    bonus_total = 0.0
    macrs_total = 0.0
    form_buckets = {
        "macrs_5_year_amount": 0.0,
        "macrs_7_year_amount": 0.0,
        "macrs_15_year_amount": 0.0,
        "residential_real_property_amount": 0.0,
        "nonresidential_real_property_amount": 0.0,
    }

    processed_assets: list[dict[str, Any]] = []
    for raw in assets:
        asset = dict(raw)
        basis = float(asset.get("depreciable_basis") or 0)
        bstate = bonus_state(
            asset.get("acquisition_date"),
            asset.get("placed_in_service_date"),
            asset.get("bonus_election"),
        )
        recovery = float(asset.get("recovery_period") or 0)
        property_bonus_ok = qualifies_for_bonus_depreciation(recovery)
        asset.update(bstate)
        asset["bonus_eligible"] = bstate["bonus_eligible"] and property_bonus_ok
        bonus_basis = basis if asset["bonus_eligible"] else 0.0
        bded = bonus_deduction(bonus_basis, bstate["bonus_elected_rate"])
        basis_after_bonus = max(basis - bded, 0.0)
        macrs_amt, bucket = macrs_year1(asset, basis_after_bonus)
        asset["bonus_deduction"] = bded
        asset["macrs_year1"] = macrs_amt
        asset["current_year_depreciation"] = round(bded + macrs_amt, 2)
        asset.setdefault("calculation_status", CALCULATION_SUPPORTED)
        asset.setdefault("reason_codes", [])
        processed_assets.append(asset)
        bonus_total += bded
        macrs_total += macrs_amt
        if bucket in form_buckets:
            form_buckets[bucket] += macrs_amt

    bonus_total = round(bonus_total, 2)
    macrs_total = round(macrs_total, 2)
    total = round(bonus_total + macrs_total, 2)
    status = rollup_activity_status(processed_assets)
    supported = status["calculation_status"] == CALCULATION_SUPPORTED

    if supported:
        dep = {
            "bonus_amount": bonus_total,
            "macrs_amount": macrs_total,
            "total_amount": total,
            **status,
        }
    else:
        dep = _blocked_dep(status)

    form_required = total > 0 and supported
    if not supported:
        form_4562 = _empty_form_4562()
        form_4562["required"] = True
        form_4562["instance_status"] = "blocked"
    elif form_required:
        form_4562 = {
            "required": True,
            "instance_status": "generated",
            "special_allowance_amount": bonus_total,
            **{k: round(v, 2) for k, v in form_buckets.items()},
            "total_depreciation_amount": total,
        }
    else:
        form_4562 = _empty_form_4562()

    return _activity_result(
        tax_activity_id, activity, processed_assets, dep, form_4562, profile_answers, blocked=not supported
    )


def _activity_result(
    tax_activity_id: str,
    activity: dict[str, Any],
    assets: list[dict[str, Any]],
    dep: dict[str, Any],
    form_4562: dict[str, Any],
    profile_answers: dict[str, Any],
    blocked: bool,
) -> dict[str, Any]:
    total = dep.get("total_amount")
    schedule_e_dep = None if blocked or total is None else total
    net_rental_loss = (
        -float(total) if total and float(total) > 0 else float(activity.get("net_rental_loss") or 0)
    )

    limitations = _compute_limitations(net_rental_loss, profile_answers, activity, blocked)

    return {
        "tax_activity_id": tax_activity_id,
        "activity_type": activity.get("activity_type") or "rental_real_estate",
        "assets": assets,
        "depreciation": dep,
        "form_4562": form_4562,
        "schedule_e": {"depreciation_expense": schedule_e_dep},
        "limitations": limitations,
    }


def _compute_limitations(
    net_loss: float,
    profile_answers: dict[str, Any],
    activity: dict[str, Any],
    blocked: bool,
) -> dict[str, float | None]:
    if blocked:
        return {
            "loss_after_basis_amount": None,
            "loss_after_at_risk_amount": None,
            "passive_allowed_loss_amount": None,
            "loss_after_excess_business_loss_amount": None,
        }

    loss = float(net_loss)
    if loss >= 0:
        loss = float(activity.get("schedule_e_net_loss") or 0)

    after_basis = loss
    after_at_risk = loss

    reps = bool(
        profile_answers.get("taxpayer_is_real_estate_professional")
        or profile_answers.get("is_real_estate_professional")
        or activity.get("is_real_estate_professional")
    )
    material = bool(
        profile_answers.get("taxpayer_materially_participates_in_rental")
        or profile_answers.get("materially_participates_in_rental")
        or activity.get("materially_participates_in_rental")
    )
    special_allowance_eligible = bool(activity.get("active_participation_allowance_eligible", False))

    if reps and material:
        passive_allowed = loss
    elif special_allowance_eligible and loss < 0:
        passive_allowed = max(loss, -25000.0)
    elif loss < 0:
        passive_allowed = 0.0
    else:
        passive_allowed = loss

    after_ebl = passive_allowed

    return {
        "loss_after_basis_amount": after_basis,
        "loss_after_at_risk_amount": after_at_risk,
        "passive_allowed_loss_amount": passive_allowed,
        "loss_after_excess_business_loss_amount": after_ebl,
    }


def _rollup_summary(results: list[dict[str, Any]]) -> dict[str, Any]:
    supported_count = 0
    blocked_count = 0
    bonus = 0.0
    macrs = 0.0
    total = 0.0

    for r in results:
        dep = r["depreciation"]
        status = dep.get("calculation_status")
        if status == CALCULATION_SUPPORTED and dep.get("total_amount") is not None:
            supported_count += 1
            bonus += float(dep.get("bonus_amount") or 0)
            macrs += float(dep.get("macrs_amount") or 0)
            total += float(dep["total_amount"])
        elif status == CALCULATION_UNSUPPORTED:
            blocked_count += 1

    if not results:
        summary_status = "empty"
    elif blocked_count > 0:
        summary_status = "incomplete"
    else:
        summary_status = "complete"

    return {
        "bonus_amount": round(bonus, 2) if supported_count else None,
        "macrs_amount": round(macrs, 2) if supported_count else None,
        "total_amount": round(total, 2) if supported_count else None,
        "summary_status": summary_status,
        "blocked_activity_count": blocked_count,
        "supported_activity_count": supported_count,
    }


def compute_activities(
    activities: list[dict[str, Any]],
    tax_year: int = 2025,
    profile_answers: dict[str, Any] | None = None,
) -> dict[str, Any]:
    profile_answers = profile_answers or {}
    results = [
        _compute_activity(act, tax_year, profile_answers)
        for act in activities
        if isinstance(act, dict)
    ]

    return {
        "activities": results,
        "taxpayer": {"depreciation_summary": _rollup_summary(results)},
    }
