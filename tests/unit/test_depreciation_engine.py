"""Unit tests for runtime/depreciation (cost seg Sprint 1 + Phase 2)."""

from __future__ import annotations

from runtime.cost_seg import flatten_cost_seg_result, merge_cost_seg_into_answers
from runtime.depreciation.constants import CALCULATION_UNSUPPORTED, REASON_MID_QUARTER
from runtime.depreciation.convention import requires_mid_quarter
from runtime.depreciation.engine import compute_activities


PROFILE_REPS = {
    "taxpayer_is_real_estate_professional": True,
    "taxpayer_materially_participates_in_rental": True,
}


def test_estimate_residential_deterministic():
    act = {
        "tax_activity_id": "activity_001",
        "calculation_mode": "estimate",
        "building_type": "residential_sfh",
        "cost_or_other_basis": 1_000_000,
        "date_placed_in_service": "2025-06-15",
        "acquisition_date": "2025-06-01",
    }
    r = compute_activities([act], tax_year=2025, profile_answers=PROFILE_REPS)
    a = r["activities"][0]
    dep = a["depreciation"]
    f4562 = a["form_4562"]
    assert dep["calculation_status"] == "supported"
    # Short-life reclass only (22% of $800k depreciable) — not entire building basis.
    assert dep["bonus_amount"] == 176_000.0
    assert dep["macrs_amount"] == 12_290.91
    assert dep["total_amount"] == 188_290.91
    assert f4562["special_allowance_amount"] == 176_000.0
    assert f4562["residential_real_property_amount"] == 12_290.91
    assert f4562["macrs_5_year_amount"] == 0.0
    assert f4562["total_depreciation_amount"] == dep["total_amount"]
    assert a["schedule_e"]["depreciation_expense"] == dep["total_amount"]
    structure = next(x for x in a["assets"] if x["record_role"] == "gds_27_5_year")
    assert structure["bonus_deduction"] == 0.0
    assert structure["bonus_eligible"] is False


def test_two_activities_isolated():
    act_a = {
        "tax_activity_id": "activity_001",
        "calculation_mode": "estimate",
        "building_type": "residential_sfh",
        "cost_or_other_basis": 1_000_000,
        "date_placed_in_service": "2025-06-15",
    }
    act_b = {
        "tax_activity_id": "activity_002",
        "calculation_mode": "estimate",
        "building_type": "commercial_office_building",
        "cost_or_other_basis": 500_000,
        "date_placed_in_service": "2025-03-01",
    }
    r = compute_activities([act_a, act_b], tax_year=2025, profile_answers=PROFILE_REPS)
    da = r["activities"][0]["depreciation"]["total_amount"]
    db = r["activities"][1]["depreciation"]["total_amount"]
    assert da != db
    assert r["taxpayer"]["depreciation_summary"]["total_amount"] == round(da + db, 2)
    assert r["taxpayer"]["depreciation_summary"]["summary_status"] == "complete"


def test_mid_quarter_guard_blocks_null_amounts():
    assets = [
        {"recovery_period": 5.0, "depreciable_basis": 500_000, "placed_in_service_date": "2025-11-01"},
        {"recovery_period": 7.0, "depreciable_basis": 400_000, "placed_in_service_date": "2025-12-01"},
        {"recovery_period": 5.0, "depreciable_basis": 100_000, "placed_in_service_date": "2025-02-01"},
    ]
    assert requires_mid_quarter(assets, 2025) is True
    act = {"tax_activity_id": "activity_001", "calculation_mode": "study_backed", "assets": assets}
    r = compute_activities([act], tax_year=2025)
    dep = r["activities"][0]["depreciation"]
    assert dep["calculation_status"] == CALCULATION_UNSUPPORTED
    assert REASON_MID_QUARTER in dep["reason_codes"]
    assert dep["total_amount"] is None
    assert r["activities"][0]["form_4562"]["instance_status"] == "blocked"
    assert r["taxpayer"]["depreciation_summary"]["summary_status"] == "incomplete"
    assert r["taxpayer"]["depreciation_summary"]["blocked_activity_count"] == 1


def test_passive_loss_disallowed_without_reps():
    act = {
        "tax_activity_id": "activity_001",
        "calculation_mode": "estimate",
        "building_type": "residential_sfh",
        "cost_or_other_basis": 1_000_000,
        "date_placed_in_service": "2025-06-15",
    }
    r = compute_activities(
        [act],
        tax_year=2025,
        profile_answers={
            "taxpayer_is_real_estate_professional": False,
            "taxpayer_materially_participates_in_rental": False,
        },
    )
    lim = r["activities"][0]["limitations"]
    assert lim["passive_allowed_loss_amount"] == 0.0
    dep_total = r["activities"][0]["depreciation"]["total_amount"]
    r_reps = compute_activities([act], tax_year=2025, profile_answers=PROFILE_REPS)
    assert r_reps["activities"][0]["depreciation"]["total_amount"] == dep_total


def test_merge_cost_seg_into_answers_flattens():
    act = {
        "tax_activity_id": "activity_001",
        "calculation_mode": "estimate",
        "building_type": "residential_sfh",
        "cost_or_other_basis": 500_000,
        "date_placed_in_service": "2025-04-01",
    }
    merged = merge_cost_seg_into_answers({"activities": [act]}, PROFILE_REPS, 2025)
    assert "cost_seg.activity_001.depreciation.total_amount" in merged
    assert merged["cost_seg.activity_001.depreciation.total_amount"] > 0


def test_flatten_parity_golden_assertion():
    act = {
        "tax_activity_id": "activity_001",
        "calculation_mode": "estimate",
        "building_type": "residential_sfh",
        "cost_or_other_basis": 1_000_000,
        "date_placed_in_service": "2025-06-15",
    }
    result = compute_activities([act], tax_year=2025, profile_answers=PROFILE_REPS)
    flat = flatten_cost_seg_result(result)
    total = flat["cost_seg.activity_001.depreciation.total_amount"]
    assert flat["cost_seg.activity_001.form_4562.total_depreciation_amount"] == total
    assert flat["cost_seg.activity_001.schedule_e.depreciation_expense"] == total


def test_three_activities_summary():
    acts = [
        {
            "tax_activity_id": f"activity_{i:03d}",
            "calculation_mode": "estimate",
            "building_type": "residential_sfh",
            "cost_or_other_basis": 300_000 * i,
            "date_placed_in_service": "2025-06-15",
        }
        for i in range(1, 4)
    ]
    r = compute_activities(acts, tax_year=2025, profile_answers=PROFILE_REPS)
    assert len(r["activities"]) == 3
    assert r["taxpayer"]["depreciation_summary"]["supported_activity_count"] == 3
    totals = [a["depreciation"]["total_amount"] for a in r["activities"]]
    assert len(set(totals)) == 3
