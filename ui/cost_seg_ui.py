"""Cost segregation Streamlit UI helpers (Phase 2)."""
from __future__ import annotations

from datetime import date
from typing import Any

import streamlit as st

from build.consolidation.cost_seg_field_templates import all_templates
from runtime.cost_seg import field_prefix, instance_field_name
from runtime.engine import ComputedValue

BUILDING_TYPES = [
    "residential_sfh",
    "commercial_office_building",
    "commercial_retail",
    "multifamily",
]

CALCULATION_MODES = [
    ("estimate", "Strategy Estimate"),
    ("study_backed", "Study-Backed Calculation"),
]

_F4562_DISPLAY = [
    ("form_4562.instance_status", "Instance status"),
    ("form_4562.special_allowance_amount", "Part II — Special allowance"),
    ("form_4562.macrs_5_year_amount", "Part III — 5-year property"),
    ("form_4562.macrs_7_year_amount", "Part III — 7-year property"),
    ("form_4562.macrs_15_year_amount", "Part III — 15-year property"),
    ("form_4562.residential_real_property_amount", "Part III — Residential real property"),
    ("form_4562.nonresidential_real_property_amount", "Part III — Nonresidential real property"),
    ("form_4562.total_depreciation_amount", "Part IV — Total depreciation"),
]

_DEP_DISPLAY = [
    ("depreciation.calculation_status", "Calculation status"),
    ("depreciation.bonus_amount", "Bonus depreciation"),
    ("depreciation.macrs_amount", "MACRS depreciation"),
    ("depreciation.total_amount", "Total depreciation"),
]


def _next_activity_id(rows: list[dict]) -> str:
    used = {r.get("tax_activity_id") for r in rows}
    n = 1
    while True:
        candidate = f"activity_{n:03d}"
        if candidate not in used:
            return candidate
        n += 1


def _default_activity_row() -> dict:
    return {
        "tax_activity_id": "activity_001",
        "activity_label": "Rental Activity 1",
        "calculation_mode": "estimate",
        "building_type": "residential_sfh",
        "cost_or_other_basis": 500_000.0,
        "date_placed_in_service": "2025-06-15",
        "acquisition_date": "2025-06-01",
        "assets": [],
    }


def _parse_date_str(value: Any) -> str | None:
    if value is None:
        return None
    if isinstance(value, date):
        return value.isoformat()
    return str(value)[:10]


def format_amount(value: Any, reason_codes: list | None = None) -> str:
    if value is None:
        codes = ", ".join(reason_codes or []) or "blocked"
        return f"Cannot calculate — {codes}"
    if isinstance(value, (int, float)):
        return f"${float(value):,.2f}"
    return str(value)


def render_activities_input(store: dict) -> None:
    """Structured multi-activity intake → answers['activities']."""
    rows_key = "cost_seg_activity_rows"
    if rows_key not in st.session_state:
        st.session_state[rows_key] = [_default_activity_row()]

    rows: list[dict] = st.session_state[rows_key]
    st.caption("Each activity gets its own depreciation run and, when required, its own Form 4562 instance.")

    for i, row in enumerate(rows):
        tid = row.get("tax_activity_id") or _next_activity_id(rows)
        row["tax_activity_id"] = tid
        header = st.columns([4, 1])
        with header[0]:
            st.markdown(f"**Activity {i + 1}** — `{tid}` (immutable ID)")
        with header[1]:
            if len(rows) > 1 and st.button("Remove", key=f"cost_seg_remove_{i}"):
                rows.pop(i)
                st.rerun()

        row["activity_label"] = st.text_input(
            "Display label",
            value=row.get("activity_label") or f"Activity {i + 1}",
            key=f"cost_seg_label_{tid}",
        )
        mode_labels = {k: v for k, v in CALCULATION_MODES}
        mode_keys = list(mode_labels.keys())
        current_mode = row.get("calculation_mode") or "estimate"
        mode_idx = mode_keys.index(current_mode) if current_mode in mode_keys else 0
        row["calculation_mode"] = st.selectbox(
            "Calculation mode",
            options=mode_keys,
            index=mode_idx,
            format_func=lambda k: mode_labels[k],
            key=f"cost_seg_mode_{tid}",
        )

        if row["calculation_mode"] == "estimate":
            row["building_type"] = st.selectbox(
                "Building type",
                options=BUILDING_TYPES,
                index=BUILDING_TYPES.index(row.get("building_type") or BUILDING_TYPES[0]),
                key=f"cost_seg_building_{tid}",
            )
            row["cost_or_other_basis"] = st.number_input(
                "Cost or other basis",
                min_value=0.0,
                step=10000.0,
                format="%.2f",
                value=float(row.get("cost_or_other_basis") or 0),
                key=f"cost_seg_basis_{tid}",
            )
            pis = row.get("date_placed_in_service")
            acq = row.get("acquisition_date")
            d_pis = st.date_input(
                "Date placed in service",
                value=date.fromisoformat(pis) if pis else None,
                key=f"cost_seg_pis_{tid}",
            )
            d_acq = st.date_input(
                "Acquisition date",
                value=date.fromisoformat(acq) if acq else None,
                key=f"cost_seg_acq_{tid}",
            )
            row["date_placed_in_service"] = _parse_date_str(d_pis)
            row["acquisition_date"] = _parse_date_str(d_acq)
            row["assets"] = []
        else:
            st.markdown("**Study-backed assets** (minimal editor)")
            assets_key = f"cost_seg_assets_{tid}"
            if assets_key not in st.session_state:
                st.session_state[assets_key] = row.get("assets") or [
                    {"depreciable_basis": 100000.0, "recovery_period": 5.0, "placed_in_service_date": "2025-06-15"}
                ]
            asset_rows = st.session_state[assets_key]
            for j, asset in enumerate(asset_rows):
                acols = st.columns([2, 1, 2, 1])
                with acols[0]:
                    asset["depreciable_basis"] = st.number_input(
                        f"Basis (asset {j + 1})",
                        min_value=0.0,
                        value=float(asset.get("depreciable_basis") or 0),
                        key=f"asset_basis_{tid}_{j}",
                    )
                with acols[1]:
                    asset["recovery_period"] = st.selectbox(
                        "Recovery",
                        options=[5.0, 7.0, 15.0, 27.5, 39.0],
                        index=[5.0, 7.0, 15.0, 27.5, 39.0].index(float(asset.get("recovery_period") or 5.0)),
                        key=f"asset_recovery_{tid}_{j}",
                    )
                with acols[2]:
                    pis_a = asset.get("placed_in_service_date")
                    d = st.date_input(
                        "Placed in service",
                        value=date.fromisoformat(pis_a) if pis_a else None,
                        key=f"asset_pis_{tid}_{j}",
                    )
                    asset["placed_in_service_date"] = _parse_date_str(d)
                with acols[3]:
                    if len(asset_rows) > 1 and st.button("X", key=f"asset_rm_{tid}_{j}"):
                        asset_rows.pop(j)
                        st.rerun()
            if st.button("Add asset", key=f"asset_add_{tid}"):
                asset_rows.append({"depreciable_basis": 0.0, "recovery_period": 5.0, "placed_in_service_date": "2025-06-15"})
                st.rerun()
            row["assets"] = asset_rows

        st.divider()

    if st.button("Add another activity", key="cost_seg_add_activity"):
        new_row = _default_activity_row()
        new_row["tax_activity_id"] = _next_activity_id(rows)
        new_row["activity_label"] = f"Rental Activity {len(rows) + 1}"
        rows.append(new_row)
        st.rerun()

    activities_out = []
    for row in rows:
        act = {
            "tax_activity_id": row["tax_activity_id"],
            "activity_label": row.get("activity_label"),
            "activity_type": "rental_real_estate",
            "calculation_mode": row.get("calculation_mode", "estimate"),
        }
        if act["calculation_mode"] == "estimate":
            act.update({
                "building_type": row.get("building_type"),
                "cost_or_other_basis": row.get("cost_or_other_basis"),
                "date_placed_in_service": row.get("date_placed_in_service"),
                "acquisition_date": row.get("acquisition_date"),
            })
        else:
            act["assets"] = row.get("assets") or []
        activities_out.append(act)
    store["activities"] = activities_out


def _cv(computed: dict[str, ComputedValue], key: str) -> Any:
    cv = computed.get(key)
    return cv.value if cv else None


def _reason_codes(computed: dict[str, ComputedValue], prefix: str) -> list:
    cv = computed.get(f"{prefix}.depreciation.reason_codes")
    if cv and cv.value:
        return list(cv.value)
    return []


def render_cost_seg_results(
    answers: dict,
    computed: dict[str, ComputedValue],
    tax_year: int = 2025,
    profile_answers: dict | None = None,
) -> None:
    activities = answers.get("activities") or []
    if not activities:
        st.info("Add rental/business activities in the sidebar to see depreciation results.")
        return

    st.markdown("### Cost segregation / depreciation")
    summary_status = _cv(computed, "taxpayer.depreciation_summary.summary_status")
    summary_total = _cv(computed, "taxpayer.depreciation_summary.total_amount")
    blocked = _cv(computed, "taxpayer.depreciation_summary.blocked_activity_count") or 0
    supported = _cv(computed, "taxpayer.depreciation_summary.supported_activity_count") or 0

    scols = st.columns(4)
    scols[0].metric("Summary status", summary_status or "—")
    scols[1].metric("Supported activities", supported)
    scols[2].metric("Blocked activities", blocked)
    scols[3].metric("Total (supported only)", format_amount(summary_total))

    if summary_status == "incomplete":
        st.warning("Summary is incomplete — one or more activities could not be calculated.")

    profile = profile_answers or {}
    from ui.cost_seg_pdf_render import build_flat_for_pdf

    flat = build_flat_for_pdf(answers, profile, tax_year, computed)

    for activity in activities:
        tid = activity["tax_activity_id"]
        label = activity.get("activity_label") or tid
        prefix = field_prefix(tid)
        reasons = _reason_codes(computed, prefix)

        with st.expander(f"{label} (`{tid}`)", expanded=len(activities) <= 3):
            t4562, tsche = st.tabs(["Form 4562", "Schedule E"])
            with t4562:
                st.markdown(f"**Form 4562 — {label}**")
                for rel, title in _DEP_DISPLAY + _F4562_DISPLAY:
                    key = instance_field_name(tid, rel)
                    val = _cv(computed, key)
                    if "calculation_status" in rel or "instance_status" in rel:
                        st.write(f"**{title}:** {val or '—'}")
                    else:
                        st.write(f"**{title}:** {format_amount(val, reasons)}")
            with tsche:
                st.markdown(f"**Schedule E — {label}**")
                dep_key = instance_field_name(tid, "schedule_e.depreciation_expense")
                st.write(f"**Line 18 — Depreciation expense:** {format_amount(_cv(computed, dep_key), reasons)}")

            lim_key = instance_field_name(tid, "limitations.passive_allowed_loss_amount")
            passive = _cv(computed, lim_key)
            st.caption(
                f"Limitations preview — passive allowed loss: {format_amount(passive)} "
                "(simplified; full Form 8582 is Phase 3+)"
            )

            _render_engine_breakdown(activity, profile, tax_year)

            _render_form_4562_pdf(activity, flat, tax_year)

    _render_schedule_e_pdfs(activities, flat, tax_year)


def _render_engine_breakdown(activity: dict, profile_answers: dict, tax_year: int) -> None:
    """Show allocation → bonus/MACRS breakdown from the depreciation engine."""
    from runtime.depreciation.classification import classify_estimate_activity
    from runtime.depreciation.engine import compute_activities
    from runtime.depreciation.profiles import profile_for

    mode = activity.get("calculation_mode") or "estimate"
    with st.expander("Engine breakdown", expanded=False):
        if mode == "estimate":
            building_type = activity.get("building_type") or "residential_sfh"
            total_basis = float(activity.get("cost_or_other_basis") or 0)
            cfg = profile_for(str(building_type))
            land = round(total_basis * cfg["land_pct"], 2)
            depreciable = round(total_basis - land, 2)
            st.markdown(
                f"| | |\n|---|---|\n"
                f"| Input basis | {format_amount(total_basis)} |\n"
                f"| Land allocation ({cfg['land_pct']:.0%}) | {format_amount(land)} |\n"
                f"| Depreciable basis | {format_amount(depreciable)} |"
            )
            classified = classify_estimate_activity(activity)
            rows = []
            for asset in classified:
                role = asset.get("record_role", "")
                label = role.replace("gds_", "").replace("_", " ")
                rows.append(
                    f"| {label} | {format_amount(asset['depreciable_basis'])} |"
                )
            if rows:
                st.markdown("**Classification (Strategy Estimate)**\n\n| Bucket | Basis |\n|---|---|\n" + "\n".join(rows))

        result = compute_activities([activity], tax_year=tax_year, profile_answers=profile_answers)
        if not result.get("activities"):
            st.caption("No engine output for this activity.")
            return
        act_result = result["activities"][0]
        dep = act_result.get("depreciation") or {}
        asset_rows = []
        for asset in act_result.get("assets") or []:
            role = asset.get("record_role", asset.get("asset_id", ""))
            bonus = asset.get("bonus_deduction")
            macrs = asset.get("macrs_year1")
            total = asset.get("current_year_depreciation")
            eligible = "yes" if asset.get("bonus_eligible") else "no"
            asset_rows.append(
                f"| {role} | {format_amount(asset.get('depreciable_basis'))} | {eligible} | "
                f"{format_amount(bonus)} | {format_amount(macrs)} | {format_amount(total)} |"
            )
        if asset_rows:
            st.markdown(
                "**Per-asset year-1 depreciation**\n\n"
                "| Asset | Basis | Bonus eligible | Bonus | MACRS | Total |\n"
                "|---|---|---|---|---|---|\n" + "\n".join(asset_rows)
            )
        st.markdown(
            f"**Totals:** bonus {format_amount(dep.get('bonus_amount'))} · "
            f"MACRS {format_amount(dep.get('macrs_amount'))} · "
            f"year-1 {format_amount(dep.get('total_amount'))}"
        )


def _render_form_4562_pdf(activity: dict, flat: dict, tax_year: int) -> None:
    import ui.data_access as da
    from ui.cost_seg_pdf_render import (
        build_4562_projection_values,
        get_form_4562_instance_status,
        render_filled_4562_pdf,
        should_render_form_4562_pdf,
    )

    tid = activity["tax_activity_id"]
    label = activity.get("activity_label") or tid
    status = get_form_4562_instance_status(tid, flat)

    if not should_render_form_4562_pdf(tid, flat):
        st.caption(f"Form 4562 PDF not generated — instance status: `{status}` (not required).")
        return

    with st.expander(f"Realistic form view — Form 4562 ({label})", expanded=False):
        if status == "blocked":
            st.warning(
                "Depreciation is blocked for this activity — PDF shows blank amount fields. "
                "See text panel above for reason codes."
            )
        pdf_path = da.get_form_pdf_path("4562")
        if pdf_path is None:
            st.caption("Run Discover for Form 4562 on Build Control, then form-4562-pdf-bridge.")
            return
        mappings = da.get_pdf_field_mappings("4562", tax_year)
        if not mappings:
            st.caption("Run form-4562-pdf-bridge on Build Control.")
            return
        projection = build_4562_projection_values(tid, flat)
        rendered = render_filled_4562_pdf(pdf_path, mappings, projection)
        if rendered is None:
            st.caption("Could not render Form 4562 PDF.")
            return
        st.caption(
            f"{rendered.mapped_count}/{rendered.total_in_scope} projection fields placed on the IRS PDF."
        )
        for i, page_png in enumerate(rendered.page_images):
            st.image(page_png, caption=f"Form 4562 — {label} — page {i + 1}", width="stretch")
        st.download_button(
            "Download filled Form 4562 PDF",
            data=rendered.pdf_bytes,
            file_name=f"4562_{tid}_filled.pdf",
            mime="application/pdf",
            key=f"download_4562_pdf_{tid}",
        )


def _render_schedule_e_pdfs(activities: list[dict], flat: dict, tax_year: int) -> None:
    import ui.data_access as da
    from ui.cost_seg_pdf_render import (
        build_schedule_e_projection_pages,
        merge_rendered_pdfs,
        render_filled_schedule_e_pdfs,
    )

    pages = build_schedule_e_projection_pages(activities, flat)
    if not pages:
        return

    st.markdown("#### Realistic Schedule E")
    pdf_path = da.get_form_pdf_path("1040se")
    mappings = da.get_pdf_field_mappings("1040se", tax_year)
    if pdf_path is None or not mappings:
        st.caption(
            "Schedule E PDF not available — run discover --form 1040se and schedule-e-pdf-bridge."
        )
        return

    rendered_list = render_filled_schedule_e_pdfs(pdf_path, mappings, pages)
    for page, rendered in zip(pages, rendered_list):
        with st.expander(f"Schedule E — Instance {page.instance}", expanded=len(pages) == 1):
            for slot in page.activities:
                st.write(f"**{slot['column']}** — {slot['activity_label']} (`{slot['tax_activity_id']}`)")
            st.caption(
                f"{rendered.mapped_count}/{rendered.total_in_scope} line 18 slots placed on the IRS PDF."
            )
            for i, page_png in enumerate(rendered.page_images):
                st.image(page_png, caption=f"Schedule E — instance {page.instance} — page {i + 1}", width="stretch")
            st.download_button(
                f"Download Schedule E instance {page.instance}",
                data=rendered.pdf_bytes,
                file_name=f"1040se_instance_{page.instance}_filled.pdf",
                mime="application/pdf",
                key=f"download_1040se_pdf_{page.instance}",
            )

    if len(rendered_list) > 1:
        packet = merge_rendered_pdfs(rendered_list)
        if packet:
            st.download_button(
                "Download Schedule E packet (all instances)",
                data=packet,
                file_name="1040se_packet_filled.pdf",
                mime="application/pdf",
                key="download_1040se_packet",
            )


def get_template_field_labels() -> dict[str, str]:
    return {t.relative_field: t.description for t in all_templates() if t.instance_group}
