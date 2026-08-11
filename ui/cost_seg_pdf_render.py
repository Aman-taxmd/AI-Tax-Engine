"""Cost segregation PDF projection builders and render helpers."""
from __future__ import annotations

from dataclasses import dataclass
from typing import Any

from runtime.cost_seg import instance_field_name, merge_cost_seg_into_answers
from runtime.engine import ComputedValue

_F4562_RELATIVE = [
    "form_4562.special_allowance_amount",
    "form_4562.macrs_5_year_amount",
    "form_4562.macrs_7_year_amount",
    "form_4562.macrs_15_year_amount",
    "form_4562.residential_real_property_amount",
    "form_4562.nonresidential_real_property_amount",
    "form_4562.total_depreciation_amount",
]

_SCHEDULE_E_SLOTS = ("a", "b", "c")


@dataclass(frozen=True)
class ScheduleEProjectionPage:
    instance: int
    activities: list[dict[str, Any]]
    projection: dict[str, Any]


def _flat_activity_values(
    answers: dict,
    profile_answers: dict,
    tax_year: int,
    computed: dict[str, ComputedValue],
) -> dict[str, Any]:
    """Engine flatten for all activities (not limited to compute closure)."""
    merged = merge_cost_seg_into_answers(dict(answers), profile_answers, tax_year)
    flat = {k: v for k, v in merged.items() if isinstance(k, str) and k.startswith("cost_seg.")}
    for key, cv in computed.items():
        if key.startswith("cost_seg."):
            flat[key] = cv.value
    return flat


def _value(flat: dict[str, Any], key: str) -> Any:
    return flat.get(key)


def get_form_4562_instance_status(
    tax_activity_id: str,
    flat: dict[str, Any],
) -> str:
    key = instance_field_name(tax_activity_id, "form_4562.instance_status")
    status = _value(flat, key)
    return str(status) if status else "not_required"


def should_render_form_4562_pdf(tax_activity_id: str, flat: dict[str, Any]) -> bool:
    status = get_form_4562_instance_status(tax_activity_id, flat)
    return status in ("generated", "blocked")


def build_4562_projection_values(tax_activity_id: str, flat: dict[str, Any]) -> dict[str, Any]:
    out: dict[str, Any] = {}
    status = get_form_4562_instance_status(tax_activity_id, flat)
    for rel in _F4562_RELATIVE:
        src = instance_field_name(tax_activity_id, rel)
        proj = f"cost_seg_projection.{rel}"
        value = _value(flat, src)
        out[proj] = None if status == "blocked" else value
    return out


def build_schedule_e_projection_pages(
    activities: list[dict],
    flat: dict[str, Any],
    *,
    activities_per_schedule: int = 3,
) -> list[ScheduleEProjectionPage]:
    if activities_per_schedule < 1:
        raise ValueError("activities_per_schedule must be >= 1")
    pages: list[ScheduleEProjectionPage] = []
    for page_index in range(0, len(activities), activities_per_schedule):
        chunk = activities[page_index : page_index + activities_per_schedule]
        projection: dict[str, Any] = {}
        slot_activities: list[dict[str, Any]] = []
        for slot_index, activity in enumerate(chunk):
            slot = _SCHEDULE_E_SLOTS[slot_index]
            tid = activity["tax_activity_id"]
            src = instance_field_name(tid, "schedule_e.depreciation_expense")
            projection[f"cost_seg_projection.schedule_e.depreciation_expense_{slot}"] = _value(flat, src)
            slot_activities.append(
                {
                    "tax_activity_id": tid,
                    "activity_label": activity.get("activity_label") or tid,
                    "column": slot.upper(),
                }
            )
        pages.append(
            ScheduleEProjectionPage(
                instance=page_index // activities_per_schedule + 1,
                activities=slot_activities,
                projection=projection,
            )
        )
    return pages


def build_flat_for_pdf(
    answers: dict,
    profile_answers: dict,
    tax_year: int,
    computed: dict[str, ComputedValue],
) -> dict[str, Any]:
    return _flat_activity_values(answers, profile_answers, tax_year, computed)


def _row_values(projection: dict[str, Any]) -> dict[str, Any]:
    from dataclasses import dataclass

    @dataclass
    class _RowValue:
        value: object

    return {name: _RowValue(value=value) for name, value in projection.items()}


def render_filled_4562_pdf(pdf_path: str, field_mappings: dict, projection_values: dict) -> Any:
    from ui.pdf_render import render_filled_pdf

    return render_filled_pdf(pdf_path, field_mappings, _row_values(projection_values))


def render_filled_schedule_e_pdfs(
    pdf_path: str, field_mappings: dict, pages: list[ScheduleEProjectionPage]
) -> list[Any]:
    from ui.pdf_render import render_filled_pdf

    rendered = []
    for page in pages:
        r = render_filled_pdf(pdf_path, field_mappings, _row_values(page.projection))
        if r is not None:
            rendered.append(r)
    return rendered


def merge_rendered_pdfs(rendered_list: list[Any]) -> bytes | None:
    if not rendered_list:
        return None
    import fitz

    merged = fitz.open()
    try:
        for rendered in rendered_list:
            src = fitz.open(stream=rendered.pdf_bytes, filetype="pdf")
            merged.insert_pdf(src)
            src.close()
        return merged.tobytes()
    finally:
        merged.close()
