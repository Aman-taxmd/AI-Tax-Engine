"""Phase 2 template export smoke tests."""

from __future__ import annotations

import json
from pathlib import Path

from build.consolidation.cost_seg_field_templates import all_templates, templates_for_form
from build.export.cost_seg_export import run_cost_seg_export

OUTPUT_ROOT = Path(__file__).resolve().parent.parent.parent / "output"


def test_template_catalog_has_stable_ids():
    templates = all_templates()
    ids = [t.template_id for t in templates]
    assert len(ids) == len(set(ids))
    assert "cost_seg.form_4562.total_depreciation_amount" in ids
    assert "cost_seg.schedule_e.depreciation_expense" in ids
    assert all(t.instance_group == "cost_seg_activity" for t in templates_for_form("4562"))


def test_export_artifacts_are_template_based(tmp_path, monkeypatch):
    monkeypatch.setattr("build.export.cost_seg_export.OUTPUT_ROOT", tmp_path)
    run_cost_seg_export(2025)

    tpl_4562 = json.loads((tmp_path / "ty2025" / "4562" / "field_templates.json").read_text())
    assert tpl_4562["export_mode"] == "template_based"
    assert "activity_003" not in json.dumps(tpl_4562)
    assert all("template_id" in row for row in tpl_4562["templates"])

    mapping = json.loads((tmp_path / "ty2025" / "form_mappings" / "form_mapping_4562.json").read_text())
    assert mapping["export_mode"] == "template_based"
    assert all("relative_field" in row for row in mapping["field_mappings"])
    assert not any("activity_003" in row.get("runtime_binding_pattern", "") for row in mapping["field_mappings"])

    examples = json.loads((tmp_path / "ty2025" / "cost_seg" / "instance_examples.json").read_text())
    assert "activity_001" in json.dumps(examples)
    assert "activity_003" not in json.dumps(examples)
