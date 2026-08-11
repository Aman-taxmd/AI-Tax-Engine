"""Unit tests for cost seg PDF projection pagination and Form 4562 gating."""
from __future__ import annotations

from runtime.depreciation.convention import requires_mid_quarter
from runtime.engine import compute
from ui.cost_seg_pdf_render import (
    build_4562_projection_values,
    build_flat_for_pdf,
    build_schedule_e_projection_pages,
    get_form_4562_instance_status,
    should_render_form_4562_pdf,
)

PROFILE = {
    "taxpayer_is_real_estate_professional": True,
    "taxpayer_materially_participates_in_rental": True,
}


def _flat(activities: list[dict]) -> dict:
    answers = {"activities": activities}
    computed = compute(answers, PROFILE, 2025)
    return build_flat_for_pdf(answers, PROFILE, 2025, computed)


def _activity(n: int, **kwargs) -> dict:
    base = {
        "tax_activity_id": f"activity_{n:03d}",
        "activity_label": f"Property {n}",
        "calculation_mode": "estimate",
        "building_type": "residential_sfh",
        "cost_or_other_basis": 300_000 * n,
        "date_placed_in_service": "2025-06-15",
    }
    base.update(kwargs)
    return base


def test_schedule_e_one_activity_column_a():
    acts = [_activity(1)]
    flat = _flat(acts)
    pages = build_schedule_e_projection_pages(acts, flat)
    assert len(pages) == 1
    assert pages[0].instance == 1
    assert len(pages[0].activities) == 1
    assert pages[0].activities[0]["column"] == "A"
    assert pages[0].projection["cost_seg_projection.schedule_e.depreciation_expense_a"] is not None


def test_schedule_e_three_activities_abc():
    acts = [_activity(i) for i in range(1, 4)]
    flat = _flat(acts)
    pages = build_schedule_e_projection_pages(acts, flat)
    assert len(pages) == 1
    assert [a["column"] for a in pages[0].activities] == ["A", "B", "C"]
    assert pages[0].projection["cost_seg_projection.schedule_e.depreciation_expense_a"] is not None
    assert pages[0].projection["cost_seg_projection.schedule_e.depreciation_expense_c"] is not None


def test_schedule_e_four_activities_two_instances():
    acts = [_activity(i) for i in range(1, 5)]
    flat = _flat(acts)
    pages = build_schedule_e_projection_pages(acts, flat)
    assert len(pages) == 2
    assert pages[0].instance == 1
    assert len(pages[0].activities) == 3
    assert pages[1].instance == 2
    assert len(pages[1].activities) == 1
    assert pages[1].activities[0]["column"] == "A"
    assert pages[1].activities[0]["tax_activity_id"] == "activity_004"
    all_ids = [a["tax_activity_id"] for p in pages for a in p.activities]
    assert all_ids == [f"activity_{i:03d}" for i in range(1, 5)]


def test_schedule_e_six_activities_two_full_instances():
    acts = [_activity(i) for i in range(1, 7)]
    pages = build_schedule_e_projection_pages(acts, _flat(acts))
    assert len(pages) == 2
    assert all(len(p.activities) == 3 for p in pages)
    assert len([a for p in pages for a in p.activities]) == 6


def test_schedule_e_seven_activities_three_instances():
    acts = [_activity(i) for i in range(1, 8)]
    pages = build_schedule_e_projection_pages(acts, _flat(acts))
    assert len(pages) == 3
    assert len(pages[0].activities) == 3
    assert len(pages[1].activities) == 3
    assert len(pages[2].activities) == 1
    assert len([a for p in pages for a in p.activities]) == 7


def test_no_activity_dropped_in_pagination():
    acts = [_activity(i) for i in range(1, 11)]
    pages = build_schedule_e_projection_pages(acts, _flat(acts))
    covered = {a["tax_activity_id"] for p in pages for a in p.activities}
    expected = {f"activity_{i:03d}" for i in range(1, 11)}
    assert covered == expected


def test_form_4562_not_required_skips_pdf():
    act = _activity(1, cost_or_other_basis=0)
    flat = _flat([act])
    tid = act["tax_activity_id"]
    assert get_form_4562_instance_status(tid, flat) == "not_required"
    assert should_render_form_4562_pdf(tid, flat) is False


def test_form_4562_generated_renders_pdf():
    act = _activity(1)
    flat = _flat([act])
    tid = act["tax_activity_id"]
    assert get_form_4562_instance_status(tid, flat) == "generated"
    assert should_render_form_4562_pdf(tid, flat) is True
    proj = build_4562_projection_values(tid, flat)
    assert proj["cost_seg_projection.form_4562.total_depreciation_amount"] is not None


def test_form_4562_blocked_still_renders_with_nulls():
    assets = [
        {"recovery_period": 5.0, "depreciable_basis": 500_000, "placed_in_service_date": "2025-11-01"},
        {"recovery_period": 7.0, "depreciable_basis": 400_000, "placed_in_service_date": "2025-12-01"},
        {"recovery_period": 5.0, "depreciable_basis": 100_000, "placed_in_service_date": "2025-02-01"},
    ]
    assert requires_mid_quarter(assets, 2025)
    act = {"tax_activity_id": "activity_001", "calculation_mode": "study_backed", "assets": assets}
    flat = _flat([act])
    assert get_form_4562_instance_status("activity_001", flat) == "blocked"
    assert should_render_form_4562_pdf("activity_001", flat) is True
    proj = build_4562_projection_values("activity_001", flat)
    assert proj["cost_seg_projection.form_4562.total_depreciation_amount"] is None
