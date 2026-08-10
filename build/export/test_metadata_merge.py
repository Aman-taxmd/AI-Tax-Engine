"""Tests for repeatable_group metadata merge helpers."""
from __future__ import annotations

import unittest

from build.export.metadata_merge import (
    finalize_repeatable_groups,
    merge_metadata_children,
    merge_metadata_field_entry,
    merge_metadata_fields,
)


class MetadataMergeTests(unittest.TestCase):
    def test_merge_metadata_field_entry_preserves_children(self):
        existing = {
            "question_type": "repeatable_group",
            "display_label": "W2 Records",
            "children": [{"canonical_field": "wages_amount", "display_label": "Wages"}],
        }
        patch = {
            "question_type": "repeatable_group",
            "display_label": "W-2 records",
        }
        merged = merge_metadata_field_entry(existing, patch)
        self.assertEqual(merged["display_label"], "W-2 records")
        self.assertEqual(len(merged["children"]), 1)
        self.assertEqual(merged["children"][0]["canonical_field"], "wages_amount")

    def test_merge_metadata_children_from_flat_keys(self):
        parent_path = "multi_instance.w2_records"
        fields = {
            parent_path: {
                "question_type": "repeatable_group",
                "is_array_field": True,
                "children": [
                    {
                        "canonical_field": "control_number",
                        "display_label": "Control Number",
                        "label": "Control Number",
                    }
                ],
            },
            f"{parent_path}.wages_amount": {
                "mutable": True,
                "question_type": "currency",
                "display_label": "W-2 Box 1 Wages",
                "aggregation_method": "sum",
                "aggregation_target": "income.wages_salaries_tips",
                "source_intake_field": "intake_w2_box1_wages",
            },
            f"{parent_path}.employer_name": {
                "mutable": True,
                "question_type": "text",
                "display_label": "Employer Name",
            },
        }
        merged = merge_metadata_children(
            parent_path,
            fields[parent_path],
            fields,
            child_order=["employer_name", "wages_amount"],
        )
        children = merged["children"]
        self.assertEqual(
            [c["canonical_field"] for c in children],
            ["control_number", "employer_name", "wages_amount"],
        )
        wages = next(c for c in children if c["canonical_field"] == "wages_amount")
        self.assertEqual(wages["aggregation_method"], "sum")
        self.assertNotIn("source_intake_field", wages)

    def test_finalize_repeatable_groups(self):
        fields = {
            "multi_instance.w2_records": {
                "question_type": "repeatable_group",
                "is_array_field": True,
            },
            "multi_instance.w2_records.wages_amount": {
                "question_type": "currency",
                "display_label": "Wages",
            },
            "income.wages_salaries_tips": {"question_type": "currency"},
        }
        out = finalize_repeatable_groups(fields)
        children = out["multi_instance.w2_records"]["children"]
        self.assertEqual(len(children), 1)
        self.assertEqual(children[0]["canonical_field"], "wages_amount")

    def test_merge_metadata_fields_does_not_wipe_sibling_keys(self):
        base = {
            "multi_instance.w2_records": {
                "question_type": "repeatable_group",
                "children": [{"canonical_field": "legacy_field"}],
            },
            "income.wages_salaries_tips": {"question_type": "currency"},
        }
        patch = {
            "multi_instance.w2_records": {
                "question_type": "repeatable_group",
                "display_label": "W-2 records",
            },
            "multi_instance.w2_records.wages_amount": {"question_type": "currency"},
        }
        merged = merge_metadata_fields(base, patch)
        self.assertEqual(
            merged["income.wages_salaries_tips"]["question_type"], "currency"
        )
        self.assertEqual(
            merged["multi_instance.w2_records"]["children"][0]["canonical_field"],
            "legacy_field",
        )


    def test_merge_metadata_fields_merges_partial_children(self):
        base = {
            "multi_instance.w2_records": {
                "question_type": "repeatable_group",
                "children": [
                    {"canonical_field": "control_number", "display_label": "Control"},
                    {"canonical_field": "wages_amount", "display_label": "Old Wages"},
                ],
            },
        }
        patch = {
            "multi_instance.w2_records": {
                "question_type": "repeatable_group",
                "display_label": "W-2 records",
                "children": [
                    {
                        "canonical_field": "wages_amount",
                        "display_label": "New Wages",
                        "aggregation_method": "sum",
                    }
                ],
            },
        }
        merged = merge_metadata_fields(base, patch)
        children = merged["multi_instance.w2_records"]["children"]
        self.assertEqual(len(children), 2)
        wages = next(c for c in children if c["canonical_field"] == "wages_amount")
        self.assertEqual(wages["display_label"], "New Wages")
        self.assertEqual(wages["aggregation_method"], "sum")


if __name__ == "__main__":
    unittest.main()
