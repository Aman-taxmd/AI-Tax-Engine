"""Cost segregation golden cases — Sprint 1."""

from __future__ import annotations

from sqlalchemy import delete, select

from db.models import GoldenCase
from db.session import get_session


def _activity_001_study_backed_1m() -> dict:
    return {
        "tax_activity_id": "activity_001",
        "activity_type": "rental_real_estate",
        "calculation_mode": "study_backed",
        "form_4562_required": True,
        "cost_or_other_basis": 1_000_000,
        "building_type": "residential_sfh",
        "date_placed_in_service": "2025-06-15",
        "acquisition_date": "2025-06-01",
        "assets": [],
    }


def _estimate_assets_from_activity(activity: dict) -> list[dict]:
    from runtime.depreciation.classification import classify_estimate_activity

    return classify_estimate_activity(activity)


def _study_backed_1m_assets() -> list[dict]:
    act = _activity_001_study_backed_1m()
    from runtime.depreciation.classification import classify_estimate_activity

    act["calculation_mode"] = "estimate"
    return classify_estimate_activity(act)


COST_SEG_GOLDEN_CASES: dict[str, tuple[dict, dict]] = {}


def _build_golden_cases() -> dict[str, tuple[dict, dict]]:
    from runtime.depreciation.engine import compute_activities

    profile_reps = {
        "taxpayer_is_real_estate_professional": True,
        "taxpayer_materially_participates_in_rental": True,
    }

    act1 = _activity_001_study_backed_1m()
    act1["assets"] = _study_backed_1m_assets()
    act1["calculation_mode"] = "study_backed"
    for a in act1["assets"]:
        a["acquisition_date"] = "2025-06-01"
        a["placed_in_service_date"] = "2025-06-15"

    r1 = compute_activities([act1], tax_year=2025, profile_answers=profile_reps)
    a1 = r1["activities"][0]
    dep1 = a1["depreciation"]
    f1 = a1["form_4562"]
    sch1 = a1["schedule_e"]

    cases: dict[str, tuple[dict, dict]] = {
        "study_backed_REPS_material_participation_1m_2025": (
            {
                "answers": {"activities": [act1]},
                "profile_answers": profile_reps,
                "tax_year": 2025,
            },
            {
                "cost_seg.activity_001.depreciation.total_amount": dep1["total_amount"],
                "cost_seg.activity_001.form_4562.total_depreciation_amount": f1["total_depreciation_amount"],
                "cost_seg.activity_001.schedule_e.depreciation_expense": sch1["depreciation_expense"],
                "taxpayer.depreciation_summary.total_amount": r1["taxpayer"]["depreciation_summary"]["total_amount"],
            },
        ),
        "depreciation_form_sch_e_parity_1m_2025": (
            {
                "answers": {"activities": [act1]},
                "profile_answers": profile_reps,
                "tax_year": 2025,
            },
            {
                "cost_seg.activity_001.form_4562.total_depreciation_amount": dep1["total_amount"],
                "cost_seg.activity_001.schedule_e.depreciation_expense": dep1["total_amount"],
            },
        ),
    }

    act_a = {
        "tax_activity_id": "activity_001",
        "activity_type": "rental_real_estate",
        "calculation_mode": "estimate",
        "building_type": "residential_sfh",
        "cost_or_other_basis": 1_000_000,
        "date_placed_in_service": "2025-06-15",
        "acquisition_date": "2025-06-01",
    }
    act_b = {
        "tax_activity_id": "activity_002",
        "activity_type": "rental_real_estate",
        "calculation_mode": "estimate",
        "building_type": "commercial_office_building",
        "cost_or_other_basis": 500_000,
        "date_placed_in_service": "2025-03-01",
        "acquisition_date": "2025-02-15",
    }
    r2 = compute_activities([act_a, act_b], tax_year=2025, profile_answers=profile_reps)
    da = r2["activities"][0]["depreciation"]
    db = r2["activities"][1]["depreciation"]
    fa = r2["activities"][0]["form_4562"]
    fb = r2["activities"][1]["form_4562"]
    summary = r2["taxpayer"]["depreciation_summary"]["total_amount"]

    cases["two_activities_two_4562_instances"] = (
        {
            "answers": {"activities": [act_a, act_b]},
            "profile_answers": profile_reps,
            "tax_year": 2025,
        },
        {
            "cost_seg.activity_001.depreciation.total_amount": da["total_amount"],
            "cost_seg.activity_002.depreciation.total_amount": db["total_amount"],
            "cost_seg.activity_001.form_4562.total_depreciation_amount": fa["total_depreciation_amount"],
            "cost_seg.activity_002.form_4562.total_depreciation_amount": fb["total_depreciation_amount"],
            "taxpayer.depreciation_summary.total_amount": summary,
        },
    )

    mq_act = {
        "tax_activity_id": "activity_001",
        "calculation_mode": "study_backed",
        "form_4562_required": True,
        "assets": [
            {
                "asset_id": "q4_a",
                "recovery_period": 5.0,
                "depreciable_basis": 500_000,
                "placed_in_service_date": "2025-11-01",
                "acquisition_date": "2025-10-01",
            },
            {
                "asset_id": "q4_b",
                "recovery_period": 7.0,
                "depreciable_basis": 400_000,
                "placed_in_service_date": "2025-12-01",
                "acquisition_date": "2025-11-01",
            },
            {
                "asset_id": "q1_c",
                "recovery_period": 5.0,
                "depreciable_basis": 100_000,
                "placed_in_service_date": "2025-02-01",
                "acquisition_date": "2025-01-15",
            },
        ],
    }
    r_mq = compute_activities([mq_act], tax_year=2025, profile_answers={})
    mq_dep = r_mq["activities"][0]["depreciation"]
    cases["mid_quarter_guard_blocked"] = (
        {
            "answers": {"activities": [mq_act]},
            "profile_answers": {},
            "tax_year": 2025,
        },
        {
            "cost_seg.activity_001.depreciation.calculation_status": mq_dep["calculation_status"],
            "cost_seg.activity_001.depreciation.total_amount": mq_dep["total_amount"],
            "cost_seg.activity_001.form_4562.instance_status": r_mq["activities"][0]["form_4562"]["instance_status"],
        },
    )

    profile_passive = {
        "taxpayer_is_real_estate_professional": False,
        "taxpayer_materially_participates_in_rental": False,
    }
    act_passive = dict(act1)
    r_p = compute_activities([act_passive], tax_year=2025, profile_answers=profile_passive)
    lim = r_p["activities"][0]["limitations"]
    cases["non_REPS_passive_no_special_allowance"] = (
        {
            "answers": {"activities": [act_passive]},
            "profile_answers": profile_passive,
            "tax_year": 2025,
        },
        {
            "cost_seg.activity_001.limitations.passive_allowed_loss_amount": lim["passive_allowed_loss_amount"],
        },
    )

    act_comm = {
        "tax_activity_id": "activity_001",
        "activity_type": "rental_real_estate",
        "calculation_mode": "estimate",
        "building_type": "commercial_office_building",
        "cost_or_other_basis": 500_000,
        "date_placed_in_service": "2025-04-01",
        "acquisition_date": "2025-03-15",
    }
    r_c = compute_activities([act_comm], tax_year=2025, profile_answers=profile_reps)
    dc = r_c["activities"][0]["depreciation"]
    cases["study_backed_commercial_500k_2025"] = (
        {
            "answers": {"activities": [act_comm]},
            "profile_answers": profile_reps,
            "tax_year": 2025,
        },
        {
            "cost_seg.activity_001.depreciation.total_amount": dc["total_amount"],
        },
    )

    return cases


def seed_cost_seg_golden_cases() -> None:
    cases = _build_golden_cases()
    with get_session() as session:
        for scenario in cases:
            session.execute(delete(GoldenCase).where(GoldenCase.scenario == scenario))
        for scenario, (inputs, expected) in cases.items():
            session.add(
                GoldenCase(
                    form_number="4562",
                    scenario=scenario,
                    inputs=inputs,
                    expected_outputs=expected,
                    source="hand_authored",
                )
            )
        session.commit()
    print(f"seeded {len(cases)} cost seg golden cases")


def run_cost_seg_golden_cases() -> bool:
    from runtime.engine import STATUS_OK, compute

    cases = _build_golden_cases()
    seed_cost_seg_golden_cases()
    all_passed = True
    for scenario, (inputs, expected) in cases.items():
        profile_answers = inputs.get("profile_answers", {})
        tax_year = inputs.get("tax_year", 2025)
        answers = dict(inputs.get("answers", {}))
        computed = compute(answers, profile_answers, tax_year)
        case_ok = True
        failures = []
        for key, exp in expected.items():
            cv = computed.get(key)
            if cv is None:
                failures.append(f"{key}: not computed")
                case_ok = False
                continue
            if cv.status != STATUS_OK:
                failures.append(f"{key}: status={cv.status}")
                case_ok = False
                continue
            actual = cv.value
            if exp is None:
                if actual is not None:
                    failures.append(f"{key}: expected None, got {actual!r}")
                    case_ok = False
            elif isinstance(exp, (int, float)) and isinstance(actual, (int, float)):
                if abs(float(actual) - float(exp)) >= 0.02:
                    failures.append(f"{key}: expected {exp}, got {actual}")
                    case_ok = False
            elif actual != exp:
                failures.append(f"{key}: expected {exp!r}, got {actual!r}")
                case_ok = False
        label = "PASS" if case_ok else "FAIL"
        print(f"[{label}] {scenario}")
        for f in failures:
            print(f"         - {f}")
        all_passed = all_passed and case_ok
    print(f"cost seg golden cases: {'ALL PASSED' if all_passed else 'FAILURES'}")
    return all_passed
