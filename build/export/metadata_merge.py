"""Merge helpers for TaxCore canonical_field_metadata repeatable groups.

Flat dot-path keys (e.g. ``multi_instance.w2_records.wages_amount``) are the
export patch shape. TaxCore questionnaire code also expects nested ``children[]``
on the parent repeatable_group (``multi_instance.w2_records``).
"""
from __future__ import annotations

from typing import Any

# Export-only keys — keep on flat top-level metadata, omit from children[].
_CHILD_OMIT_KEYS = frozenset(
    {
        "source_intake_field",
        "source_xsd_element",
        "source_form_line",
        "is_engine_question",
        "default_config",
        "notes",
        "children",
    }
)


def flat_metadata_to_child(canonical_field: str, flat: dict[str, Any]) -> dict[str, Any]:
    """Project a flat metadata entry into a repeatable_group child dict."""
    child: dict[str, Any] = {"canonical_field": canonical_field}
    for key, value in flat.items():
        if key in _CHILD_OMIT_KEYS:
            continue
        child[key] = value
    label = child.get("label") or child.get("display_label")
    if label is not None:
        child["label"] = label
    return child


def _flat_children_for_group(
    parent_path: str, all_fields: dict[str, dict[str, Any]]
) -> dict[str, dict[str, Any]]:
    prefix = parent_path + "."
    out: dict[str, dict[str, Any]] = {}
    for key, meta in all_fields.items():
        if not key.startswith(prefix):
            continue
        suffix = key[len(prefix) :]
        if not suffix or "." in suffix:
            continue
        if not isinstance(meta, dict):
            continue
        out[suffix] = flat_metadata_to_child(suffix, meta)
    return out


def merge_metadata_children(
    parent_path: str,
    parent_meta: dict[str, Any],
    all_fields: dict[str, dict[str, Any]],
    *,
    child_order: list[str] | None = None,
) -> dict[str, Any]:
    """Merge baseline ``children[]`` with flat dot-path patch entries."""
    flat_children = _flat_children_for_group(parent_path, all_fields)
    existing_children = [
        c
        for c in (parent_meta.get("children") or [])
        if isinstance(c, dict) and c.get("canonical_field")
    ]
    by_leaf: dict[str, dict[str, Any]] = {
        c["canonical_field"]: dict(c) for c in existing_children
    }
    for leaf, child in flat_children.items():
        if leaf in by_leaf:
            by_leaf[leaf] = {**by_leaf[leaf], **child}
        else:
            by_leaf[leaf] = child

    ordered: list[dict[str, Any]] = []
    seen: set[str] = set()

    for child in existing_children:
        leaf = child["canonical_field"]
        if leaf in by_leaf and leaf not in seen:
            ordered.append(by_leaf[leaf])
            seen.add(leaf)

    if child_order:
        for leaf in child_order:
            if leaf in by_leaf and leaf not in seen:
                ordered.append(by_leaf[leaf])
                seen.add(leaf)

    for leaf in sorted(by_leaf):
        if leaf not in seen:
            ordered.append(by_leaf[leaf])

    out = dict(parent_meta)
    if ordered:
        out["children"] = ordered
    return out


def _merge_children_arrays(
    existing_children: list[dict[str, Any]],
    patch_children: list[dict[str, Any]],
) -> list[dict[str, Any]]:
    by_leaf: dict[str, dict[str, Any]] = {
        c["canonical_field"]: dict(c)
        for c in existing_children
        if isinstance(c, dict) and c.get("canonical_field")
    }
    patch_order: list[str] = []
    for child in patch_children:
        if not isinstance(child, dict) or not child.get("canonical_field"):
            continue
        leaf = child["canonical_field"]
        patch_order.append(leaf)
        if leaf in by_leaf:
            by_leaf[leaf] = {**by_leaf[leaf], **child}
        else:
            by_leaf[leaf] = dict(child)

    ordered: list[dict[str, Any]] = []
    seen: set[str] = set()
    for child in existing_children:
        if not isinstance(child, dict):
            continue
        leaf = child.get("canonical_field")
        if leaf and leaf in by_leaf and leaf not in seen:
            ordered.append(by_leaf[leaf])
            seen.add(leaf)
    for leaf in patch_order:
        if leaf in by_leaf and leaf not in seen:
            ordered.append(by_leaf[leaf])
            seen.add(leaf)
    for leaf in sorted(by_leaf):
        if leaf not in seen:
            ordered.append(by_leaf[leaf])
    return ordered


def merge_metadata_field_entry(
    existing: dict[str, Any] | None, patch: dict[str, Any]
) -> dict[str, Any]:
    """Deep-merge one metadata entry; preserve nested group data when omitted."""
    if existing is None:
        return dict(patch)
    if not isinstance(existing, dict) or not isinstance(patch, dict):
        return dict(patch)

    merged = {**existing, **patch}
    if patch.get("question_type") == "repeatable_group" or existing.get(
        "question_type"
    ) == "repeatable_group":
        existing_children = existing.get("children") or []
        patch_children = patch.get("children") or []
        if patch_children and existing_children:
            merged["children"] = _merge_children_arrays(existing_children, patch_children)
        elif not patch_children and existing_children:
            merged["children"] = existing_children
        if not patch.get("document_instances_config") and existing.get(
            "document_instances_config"
        ):
            merged["document_instances_config"] = existing["document_instances_config"]
        if not patch.get("array_config") and existing.get("array_config"):
            merged["array_config"] = existing["array_config"]
        if not patch.get("upload") and existing.get("upload"):
            merged["upload"] = existing["upload"]
    return merged


def merge_metadata_fields(
    base: dict[str, dict[str, Any]],
    patch: dict[str, dict[str, Any]],
) -> dict[str, dict[str, Any]]:
    """Key-level metadata upsert with repeatable_group-safe merging."""
    out = dict(base)
    for key, patch_meta in patch.items():
        if not isinstance(patch_meta, dict):
            out[key] = patch_meta
            continue
        out[key] = merge_metadata_field_entry(out.get(key), patch_meta)
    return out


def finalize_repeatable_groups(
    fields: dict[str, dict[str, Any]],
    *,
    group_child_order: dict[str, list[str]] | None = None,
) -> dict[str, dict[str, Any]]:
    """Attach ``children[]`` on repeatable_group parents from flat dot-path keys."""
    group_child_order = group_child_order or {}
    out = dict(fields)
    for key, meta in fields.items():
        if not isinstance(meta, dict):
            continue
        if meta.get("question_type") != "repeatable_group":
            continue
        if not meta.get("is_array_field"):
            continue
        out[key] = merge_metadata_children(
            key,
            out.get(key) or meta,
            out,
            child_order=group_child_order.get(key),
        )
    return out


def w2_child_order_from_spec(spec: Any) -> list[str]:
    """Export order for W-2 pilot leaves under multi_instance.w2_records."""
    order: list[str] = []
    for intake in spec.field_export_order:
        path = spec.field_name_map.get(intake)
        if not path:
            continue
        leaf = path.rsplit(".", 1)[-1]
        if leaf not in order:
            order.append(leaf)
    return order
