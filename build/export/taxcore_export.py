"""Export our validated canonical fields / calc rules / form mappings into
TaxCore's on-disk JSON shape (`data/schema/rules/*.json`,
`data/schema/canonical/form_mappings/*.json`, etc.) so the artifacts can be
dropped into TaxMD-TaxCore and loaded via `manage.py load_schemas`.

This is a pure read-side projection -- it never mutates our own DB. Our
engine, AI pipeline, and Postgres schema stay exactly as they are; only the
*output files* speak TaxCore's dialect.

Per-form import contracts (worksheet key, promotion mappings, metadata
overrides, retirement notes) live in `build/export/taxcore_targets/`. Form
8889 is the pilot; other forms follow the same FormSpec pattern.

See docs/adr/0010-taxcore-field-naming.md for the naming decision.

Formula vocabulary: where our formula type has a direct TaxCore equivalent
we translate it; where ours is more precise (e.g. `subtract_floor_zero`,
`multiply_unless_flag`, `sum_instances`) we re-express using their
`conditional` / `maximum` / nested-formula composition when possible, or
keep an additive type their engine already supports (`aggregate`) even if
their JSON Schema enum is narrower -- see `_translate_formula`. Units stay
in dollars (IRS convention); TaxCore's own schema is inconsistent about
cents vs dollars, and we deliberately do not absorb that inconsistency
except where a FormSpec formula_override points at TaxCore-native paths.
"""
from __future__ import annotations

import json
import re
from datetime import date
from pathlib import Path
from typing import Any

from sqlalchemy import select

from build.export.metadata_merge import (
    merge_metadata_children,
    merge_metadata_field_entry,
    w2_child_order_from_spec,
)
from build.export.taxcore_adapter.overrides import TAXCORE_RUNTIME_OVERRIDES
from build.export.taxcore_targets import get_form_spec
from build.export.taxcore_targets.spec import FormSpec
from db.models import CalcRule, CanonicalField, Document, PdfFieldMapping
from db.session import get_session
from runtime.chain import FORM_FIELD_NAME_OVERRIDES, form_field_condition

OUTPUT_ROOT = Path(__file__).resolve().parent.parent.parent / "output"

# TaxCore form_id / form_type convention (irs_8889, not 8889).
_FORM_ID: dict[str, str] = {
    "8889": "irs_8889",
    "1040": "irs_1040",
    "1040s1": "irs_1040_schedule_1",
    "1040s1a": "irs_1040_schedule_1a",
    "1040s2": "irs_1040_schedule_2",
    "1040sc": "irs_1040_schedule_c",
    "1040sse": "irs_1040_schedule_se",
    "w2": "irs_w2",
}

_FORM_DISPLAY: dict[str, str] = {
    "8889": "Form 8889 — HSA",
    "1040": "Form 1040",
    "1040s1": "Schedule 1 (Form 1040)",
    "1040s1a": "Schedule 1-A (Form 1040)",
    "1040s2": "Schedule 2 (Form 1040)",
    "1040sc": "Schedule C (Form 1040)",
    "1040sse": "Schedule SE (Form 1040)",
    "w2": "Form W-2",
}


def _discovery_condition(column, form: str, spec: FormSpec | None):
    """SQLAlchemy filter for canonical fields / rules belonging to `form`."""
    if spec is not None and spec.source_field_pattern:
        return column.like(spec.source_field_pattern)
    return form_field_condition(column, form)


def _synthetic_rule_dicts(spec: FormSpec, tax_year: int) -> list[dict]:
    """TaxCore rule payloads when export_db_rules is False."""
    if spec.form == "w2":
        from build.export.taxcore_targets.form_w2 import _synthetic_rules

        templates = _synthetic_rules(tax_year)
    else:
        templates = spec.synthetic_rules
    out: list[dict] = []
    for tmpl in templates:
        payload = json.loads(json.dumps(tmpl))
        payload["version"] = f"{tax_year}.1.0"
        if payload.get("metadata"):
            payload["metadata"]["version"] = f"{tax_year}.1.0"
        if payload.get("notes") is None:
            payload.pop("notes", None)
        out.append(payload)
    return out


def _xsd_file_for(form: str) -> str:
    if form == "8889":
        return "IRS8889.xsd"
    if form == "w2":
        return "IRSW2.xsd"
    return f"IRS{form.upper()}.xsd"


def _leaf(name: str) -> str:
    """Canonical path leaf or last segment of a rule/field name."""
    return name.rsplit(".", 1)[-1]


def _rule_id_for(field_name: str, form: str, spec: FormSpec | None) -> str:
    if spec is not None:
        return spec.rule_id_for(field_name)
    leaf = _leaf(field_name)
    form_slug = form.replace("-", "_")
    return f"calc_form_{form_slug}_worksheet_{leaf}"


def _output_field_for(field_name: str, form: str, spec: FormSpec | None) -> str:
    """calculation_results path — never a bare canonical_data category."""
    if spec is not None:
        return spec.output_field_for(field_name)
    return f"form_{form}_worksheet.{_leaf(field_name)}"


def _field_operand(field_name: str, sign: str = "+") -> dict:
    return {
        "type": "field",
        "field": field_name,
        "sign": sign,
        "default_value": 0,
    }


def _constant_operand(value: float | int) -> dict:
    return {"type": "constant", "constant": value}


def _wrap_formula_as_operand(formula: dict) -> dict:
    return {"type": "formula", "formula": formula}


def _translate_formula(formula: dict) -> tuple[dict, list[str]]:
    """Return (TaxCore-shaped formula, list of translation notes)."""
    notes: list[str] = []
    ftype = (formula or {}).get("type")
    operands = list((formula or {}).get("operand_names") or [])
    constant = (formula or {}).get("constant")

    if ftype == "sum":
        ops = [_field_operand(n) for n in operands]
        if constant is not None and not operands:
            return {
                "type": "sum",
                "operands": [_constant_operand(constant)],
                "rounding": "nearest",
                "decimal_places": 0,
            }, notes
        if constant is not None:
            ops.append(_constant_operand(constant))
        return {
            "type": "sum",
            "operands": ops,
            "rounding": "nearest",
            "decimal_places": 0,
        }, notes

    if ftype == "subtract":
        if len(operands) < 2:
            raise ValueError(f"subtract needs >=2 operands, got {operands}")
        ops = [_field_operand(operands[0])] + [
            _field_operand(n, sign="-") for n in operands[1:]
        ]
        return {
            "type": "subtract",
            "operands": ops,
            "rounding": "nearest",
            "decimal_places": 0,
        }, notes

    if ftype == "multiply":
        ops = [_field_operand(n) for n in operands]
        if constant is not None:
            ops.append(_constant_operand(constant))
        return {"type": "multiply", "operands": ops}, notes

    if ftype == "min":
        ops = [_field_operand(n) for n in operands]
        if constant is not None:
            ops.append(_constant_operand(constant))
        return {"type": "minimum", "operands": ops}, notes

    if ftype == "max":
        ops = [_field_operand(n) for n in operands]
        if constant is not None:
            ops.append(_constant_operand(constant))
        return {"type": "maximum", "operands": ops}, notes

    if ftype == "carryover":
        notes.append(
            "carryover → sum with single field operand (TaxCore has no carryover type)"
        )
        return {
            "type": "sum",
            "operands": [_field_operand(operands[0])],
            "rounding": "nearest",
            "decimal_places": 0,
        }, notes

    if ftype == "subtract_floor_zero":
        notes.append("subtract_floor_zero → maximum(subtract(...), 0)")
        if constant is not None:
            inner = {
                "type": "subtract",
                "operands": [_constant_operand(constant)]
                + [_field_operand(n, sign="-") for n in operands],
                "rounding": "nearest",
                "decimal_places": 0,
            }
        elif len(operands) >= 2:
            inner = {
                "type": "subtract",
                "operands": [_field_operand(operands[0])]
                + [_field_operand(n, sign="-") for n in operands[1:]],
                "rounding": "nearest",
                "decimal_places": 0,
            }
        elif len(operands) == 1:
            inner = {
                "type": "subtract",
                "operands": [_field_operand(operands[0])],
                "rounding": "nearest",
                "decimal_places": 0,
            }
        else:
            raise ValueError(f"subtract_floor_zero needs operands or constant, got {operands}")
        return {
            "type": "maximum",
            "operands": [_wrap_formula_as_operand(inner), _constant_operand(0)],
        }, notes

    if ftype == "floor_divide":
        notes.append("floor_divide → divide with rounding floor")
        if len(operands) != 1 or constant is None:
            raise ValueError(
                f"floor_divide needs 1 operand and constant divisor, got {operands!r} / {constant!r}"
            )
        return {
            "type": "divide",
            "operands": [
                _field_operand(operands[0]),
                _constant_operand(constant),
            ],
            "rounding": "floor",
            "decimal_places": 0,
        }, notes

    if ftype == "multiply_floor_zero":
        notes.append("multiply_floor_zero → multiply(maximum(operand, 0), constant)")
        if len(operands) != 1 or constant is None:
            raise ValueError(
                f"multiply_floor_zero needs 1 operand and constant, got {operands!r} / {constant!r}"
            )
        floored = {
            "type": "maximum",
            "operands": [_field_operand(operands[0]), _constant_operand(0)],
        }
        return {
            "type": "multiply",
            "operands": [
                _wrap_formula_as_operand(floored),
                _constant_operand(constant),
            ],
        }, notes

    if ftype == "min_multiply":
        notes.append("min_multiply → multiply(minimum(operands), constant)")
        if not operands or constant is None:
            raise ValueError(f"min_multiply needs operands and constant, got {operands!r}")
        return {
            "type": "multiply",
            "operands": [
                _wrap_formula_as_operand(
                    {
                        "type": "minimum",
                        "operands": [_field_operand(n) for n in operands],
                    }
                ),
                _constant_operand(constant),
            ],
        }, notes

    if ftype == "sum_instances_then_carryover":
        notes.append(
            "sum_instances_then_carryover → sum single promoted canonical field "
            "(8889 module aggregates per-spouse HSA deduction before this line)"
        )
        if not operands:
            raise ValueError(f"sum_instances_then_carryover needs >=1 operand, got {operands}")
        return {
            "type": "sum",
            "operands": [_field_operand(operands[0])],
            "rounding": "nearest",
            "decimal_places": 0,
        }, notes

    if ftype == "multiply_unless_flag":
        notes.append(
            "multiply_unless_flag → conditional(flag equals true → 0, else multiply)"
        )
        flag = (formula or {}).get("flag_operand") or (
            operands[0] if operands else None
        )
        amount = (
            operands[-1]
            if len(operands) >= 2
            else (operands[0] if operands else None)
        )
        rate = constant if constant is not None else 0
        if not flag or not amount:
            raise ValueError(f"multiply_unless_flag missing flag/amount: {formula}")
        return {
            "type": "conditional",
            "condition": {"field": flag, "operator": "equals", "value": True},
            "true_value": _constant_operand(0),
            "false_value": _wrap_formula_as_operand(
                {
                    "type": "multiply",
                    "operands": [_field_operand(amount), _constant_operand(rate)],
                }
            ),
        }, notes

    if ftype == "sum_instances":
        notes.append(
            "sum_instances → aggregate (engine-supported additive type; "
            "rule_schema_FINAL.json enum is narrower than FormulaEvaluator)"
        )
        return {
            "type": "aggregate",
            "operands": [_field_operand(n) for n in operands],
            "aggregation": "sum",
        }, notes

    if ftype == "federal_income_tax":
        notes.append(
            "federal_income_tax → tax_table lookup on "
            "income_calculated.taxable_income_amount + taxpayer.filing_status"
        )
        return {
            "type": "tax_table",
            "table_name": "tax_brackets",
            "table_lookup_field": "income_calculated.taxable_income_amount",
        }, notes

    notes.append(
        f"UNTRANSLATED formula type '{ftype}' -- passed through as-is (additive)"
    )
    out = dict(formula or {})
    if operands and "operands" not in out:
        out["operands"] = [_field_operand(n) for n in operands]
    return out, notes


def _zero_skipped_stub_operands(obj: Any, skip_stubs: set[str]) -> Any:
    """Replace field operands that reference skipped constant-$0 stub rules."""
    if not skip_stubs:
        return obj
    if isinstance(obj, dict):
        if obj.get("type") == "field" and obj.get("field") in skip_stubs:
            return _constant_operand(0)
        return {k: _zero_skipped_stub_operands(v, skip_stubs) for k, v in obj.items()}
    if isinstance(obj, list):
        return [_zero_skipped_stub_operands(v, skip_stubs) for v in obj]
    return obj


def _resolve_field_ref(
    field_name: str,
    computed_canonical: set[str],
    spec: FormSpec | None,
) -> str:
    """Map our field / rule names to TaxCore canonical or worksheet paths."""
    if spec is None:
        return field_name
    if field_name in spec.cross_form_field_map:
        return spec.cross_form_field_map[field_name]
    if field_name in computed_canonical:
        return spec.output_field_for(field_name)
    if field_name in spec.field_name_map:
        return spec.field_name_map[field_name]
    return field_name


def _rewrite_field_refs(
    obj: Any,
    computed_canonical: set[str],
    spec: FormSpec | None,
) -> Any:
    """Rewrite formula field refs to TaxCore canonical / worksheet paths."""
    if spec is None:
        return obj
    if isinstance(obj, dict):
        out = {}
        for k, v in obj.items():
            if k == "field" and isinstance(v, str):
                out[k] = _resolve_field_ref(v, computed_canonical, spec)
            elif k == "condition" and isinstance(v, dict) and isinstance(v.get("field"), str):
                cond = dict(v)
                cond["field"] = _resolve_field_ref(v["field"], computed_canonical, spec)
                out[k] = cond
            else:
                out[k] = _rewrite_field_refs(v, computed_canonical, spec)
        return out
    if isinstance(obj, list):
        return [_rewrite_field_refs(v, computed_canonical, spec) for v in obj]
    return obj


def _irs_reference_string(rule: CalcRule, doc_by_id: dict[str, Document]) -> str:
    ref = rule.irs_reference or {}
    parts: list[str] = []
    quote = ref.get("quote")
    if quote:
        parts.append(f'"{quote}"')
    doc = doc_by_id.get(ref.get("document_id"))
    if doc is not None and doc.source_url:
        parts.append(doc.source_url)
    elif ref.get("source_url"):
        parts.append(ref["source_url"])
    return "; ".join(parts) if parts else ""


def _rule_to_taxcore(
    rule: CalcRule,
    form: str,
    tax_year: int,
    field: CanonicalField | None,
    doc_by_id: dict[str, Document],
    required_rule_ids: list[str],
    spec: FormSpec | None,
    computed_canonical: set[str],
) -> dict:
    notes: list[str] = []
    if spec is not None and rule.rule_id in spec.formula_overrides:
        formula = json.loads(json.dumps(spec.formula_overrides[rule.rule_id]))
        notes.extend(spec.formula_override_notes.get(rule.rule_id, []))
    else:
        formula, notes = _translate_formula(rule.formula or {})
        formula = _rewrite_field_refs(formula, computed_canonical, spec)
        if spec is not None:
            formula = _zero_skipped_stub_operands(formula, set(spec.skip_stub_rule_ids))

    leaf_desc = (
        field.description.split("\u2014")[0].strip()
        if field and field.description
        else rule.rule_id
    )
    conf = rule.confidence_breakdown or {}
    note_bits = [n for n in notes if n]
    if conf.get("note"):
        note_bits.append(str(conf["note"]))

    deps: dict[str, Any] = {
        "required_rules": required_rule_ids,
        "required_mutable_fields": [],
        "required_computed_fields": [],
        "required_schedule_types": [],
        "optional_fields": [],
    }
    # TaxCore W-2 aggregate needs the schedule type declared.
    if isinstance(formula, dict) and formula.get("source") == "schedule_line_items":
        sched = (formula.get("filter") or {}).get("schedule_type")
        if sched:
            deps["required_schedule_types"] = [sched]

    # Populate required_computed_fields from rewritten formula field refs.
    computed_deps: list[str] = []

    def _collect_ws_fields(obj: Any, acc: list[str]) -> None:
        if isinstance(obj, dict):
            if obj.get("type") == "field" and isinstance(obj.get("field"), str):
                f = obj["field"]
                if spec and f.startswith(spec.worksheet_key + "."):
                    if f not in acc:
                        acc.append(f)
            for v in obj.values():
                _collect_ws_fields(v, acc)
        elif isinstance(obj, list):
            for v in obj:
                _collect_ws_fields(v, acc)

    _collect_ws_fields(formula, computed_deps)
    deps["required_computed_fields"] = computed_deps

    if spec is not None:
        taxcore_rid = _rule_id_for(rule.rule_id, form, spec)
        for scenario_rid in spec.scenario_rule_dependencies.get(taxcore_rid, []):
            if scenario_rid not in deps["required_rules"]:
                deps["required_rules"].append(scenario_rid)
        for extra_rid in spec.extra_rule_dependencies.get(taxcore_rid, []):
            if extra_rid not in deps["required_rules"]:
                deps["required_rules"].append(extra_rid)
        for canon_field in spec.scenario_computed_field_dependencies.get(
            taxcore_rid, []
        ):
            if canon_field not in deps["required_computed_fields"]:
                deps["required_computed_fields"].append(canon_field)

    if isinstance(formula, dict) and formula.get("type") == "tax_table":
        deps["required_mutable_fields"] = ["taxpayer.filing_status"]
        if "income_calculated.taxable_income_amount" not in computed_deps:
            deps["required_computed_fields"] = [
                *computed_deps,
                "income_calculated.taxable_income_amount",
            ]

    payload = {
        "rule_id": _rule_id_for(rule.rule_id, form, spec),
        "version": f"{tax_year}.1.0",
        "description": leaf_desc,
        "output_field": _output_field_for(rule.rule_id, form, spec),
        "canonical_target": (
            spec.canonical_target_for(rule.rule_id) if spec else rule.rule_id
        ),
        "formula": formula,
        "dependencies": deps,
        "execution_priority": 0,
        "filing_status_applicable": [],
        "validation": {"min_value": 0},
        "irs_reference": _irs_reference_string(rule, doc_by_id),
        "notes": " | ".join(note_bits) if note_bits else None,
        "metadata": {
            "version": f"{tax_year}.1.0",
            "last_updated": date.today().isoformat(),
            "source": "AI_TAX_ENGINE",
            "source_rule_id": rule.rule_id,
            "source_status": rule.status,
            "tags": [form, "ai_tax_engine", *( [spec.module_id] if spec else [])],
            "translation_notes": notes,
            "storage_unit": "dollars",
        },
    }
    return payload


def _field_mapping_entry(
    field: CanonicalField,
    form: str,
    tax_year: int,
    rule: CalcRule | None,
    pdf: PdfFieldMapping | None,
    spec: FormSpec | None = None,
) -> dict:
    form_id = _FORM_ID.get(form, f"irs_{form}")
    xsd_override = (
        spec.field_mapping_xsd.get(field.field_name, {}) if spec else {}
    )
    canonical_field = (
        spec.taxcore_path(field.field_name)
        if spec and spec.field_name_map
        else field.field_name
    )
    xsd = xsd_override.get("xsd_element") or field.source_xsd_element or ""
    line = field.source_form_line or ""
    calc = "computed" if rule is not None else "direct_copy"
    if xsd_override.get("data_type"):
        data_type = xsd_override["data_type"]
    elif "Amount" in (field.data_type or "") or field.data_type in (
        "USAmountType", "USAmountNNType"
    ):
        data_type = "currency"
    elif field.data_type == "CheckboxType":
        data_type = "boolean"
    else:
        data_type = "string"
    parse_strategy = xsd_override.get(
        "parse_strategy",
        "currency_parser" if data_type == "currency" else "simple_field",
    )
    is_text = data_type == "string"
    return {
        "canonical_field": canonical_field,
        "data_type": data_type,
        "description": (field.description or "").split("\u2014")[0].strip(),
        "form_view": {
            "registry_key": (
                xsd_override.get("registry_key")
                or (f"Form8889Data/{xsd}" if form == "8889" and xsd else xsd)
            ),
            "xsd_element": xsd,
            "xsd_type": xsd_override.get("xsd_type") or field.data_type,
            "xsd_path": xsd_override.get("xsd_path", ""),
            "xsd_file": _xsd_file_for(form),
            "xsl_xpath": None,
            "xsl_leaf": None,
            "mef_element_path": None,
            "source_origin": "ai_tax_engine",
            "display_label": xsd_override.get("display_label") or xsd or canonical_field,
            "pdf_field_code": pdf.pdf_field_code if pdf else None,
            "pdf_field_confidence": pdf.confidence if pdf else None,
        },
        "source_mappings": {
            str(tax_year): {
                "sources": [
                    {
                        "form": form_id,
                        "lines": [line] if line else [],
                        "field_identifier": xsd,
                        "field_label": xsd_override.get("display_label") or xsd,
                        "ocr_strategy": "key_value_pair",
                        "parse_strategy": parse_strategy,
                        "required": False,
                    }
                ]
            }
        },
        "target_line": {
            str(tax_year): {
                "line": line,
                "line_label": (field.description or "").split("\u2014")[0].strip(),
                "calculation": calc,
            }
        },
        "storage_unit": None if is_text else "dollars",
    }


def _topo_required_rules(
    rules: list[CalcRule], form: str, spec: FormSpec | None
) -> dict[str, list[str]]:
    by_name = {r.rule_id: r for r in rules}
    out: dict[str, list[str]] = {}
    for r in rules:
        ops = (r.formula or {}).get("operand_names") or []
        req = []
        for op in ops:
            if op in by_name:
                req.append(_rule_id_for(op, form, spec))
        flag = (r.formula or {}).get("flag_operand")
        if flag and flag in by_name:
            rid = _rule_id_for(flag, form, spec)
            if rid not in req:
                req.append(rid)
        out[r.rule_id] = req
    return out


def _apply_metadata_overrides(meta: dict, overrides: dict) -> dict:
    out = dict(meta)
    for k, v in overrides.items():
        out[k] = v
    return out


def _build_module_payload(spec: FormSpec, tax_year: int, rule_ids: list[str]) -> dict:
    ordered = [rid for rid in spec.calc_rules_order if rid in rule_ids]
    for rid in rule_ids:
        if rid not in ordered:
            ordered.append(rid)
    description = spec.module_description or (
        "Health Savings Account contributions, distributions, and deduction "
        "(AI_TAX_ENGINE Form 8889 chain — replaces prior stub worksheet)."
    )
    return {
        "module_id": spec.module_id,
        "form": spec.form_type,
        "instance_type": spec.instance_type,
        "multi_instance_key": spec.multi_instance_key,
        "display_label": spec.display_label,
        "description": description,
        "eligibility_description": (
            "Active when taxpayer has W-2 wage income."
            if spec.form == "w2"
            else (
                "Core Form 1040 income, tax, and refund chain (AI_TAX_ENGINE pilot)."
                if spec.form == "1040"
                else (
                    "Schedule 1 additional income and adjustments (AI_TAX_ENGINE pilot)."
                    if spec.form == "1040s1"
                    else (
                        "Schedule 1-A tips and senior deductions (AI_TAX_ENGINE pilot)."
                        if spec.form == "1040s1a"
                        else (
                            "Schedule C sole-prop net profit (AI_TAX_ENGINE pilot)."
                            if spec.form == "1040sc"
                            else (
                                "Schedule SE self-employment tax (AI_TAX_ENGINE pilot)."
                                if spec.form == "1040sse"
                                else (
                                    "Schedule 2 other taxes (AI_TAX_ENGINE pilot)."
                                    if spec.form == "1040s2"
                                    else "Active when taxpayer has an HSA."
                                )
                            )
                        )
                    )
                )
            )
        ),
        "calc_rules": ordered,
        "output_fields": list(spec.must_promote),
        "output_mappings": spec.promote_mappings(),
        "metadata": {
            "source": "AI_TAX_ENGINE",
            "tax_year": tax_year,
            "replace_existing_module": True,
            "storage_unit": "dollars",
        },
    }


def _build_target_tree(spec: FormSpec, tax_year: int, rule_ids: list[str]) -> dict:
    tree = {
        "form": spec.form,
        "form_type": spec.form_type,
        "tax_year": tax_year,
        "principle": {
            "canonical_data": "durable taxpayer truth (UI, AGI, filing, MeF)",
            "calculation_results": "purgeable worksheets (line-by-line scratchpad)",
            "rules_write": "worksheets only (never canonical as output_field)",
            "promotion": "avatar/scenario output_mappings",
        },
        "worksheet_key": spec.worksheet_key,
        "calculation_schema": {
            "structure": spec.worksheet_structure(),
        },
        "canonical_inputs": list(spec.canonical_inputs),
        "must_promote": list(spec.must_promote),
        "form_view_promote": list(spec.form_view_promote),
        "output_mappings": spec.promote_mappings(),
        "calc_rules": [rid for rid in spec.calc_rules_order if rid in set(rule_ids)],
        "canonical_schema_additions": spec.canonical_schema_additions,
        "open_risks": list(spec.open_risks),
    }
    if spec.form == "8889":
        tree["w2_employer_hsa_path"] = (
            "multi_instance.w2_records[].box12_code_w_amount_cents"
        )
    tree.update(spec.target_tree_extras)
    return tree


def _avatar_action_text(spec: FormSpec) -> str:
    overrides = TAXCORE_RUNTIME_OVERRIDES.get(spec.form, {})
    patches = overrides.get("avatar_patches") or []
    if patches:
        lines = []
        for patch in patches:
            action = patch.get("action", "")
            mid = patch.get("module_id", spec.module_id)
            if action == "set_calc_rules":
                lines.append(
                    f"Set module_id == '{mid}' calc_rules to {patch.get('calc_rules', [])!r} "
                    f"on all avatars ({patch.get('description', '')})."
                )
            elif action == "replace_calc_rules_from_module":
                mod = patch.get("module_file", f"modules/module_{mid}.json")
                lines.append(
                    f"Replace module_id == '{mid}' calc_rules from bundle {mod} "
                    f"({patch.get('description', '')})."
                )
            elif action == "merge_calc_rules_from_module":
                mod = patch.get("module_file", f"modules/module_{mid}.json")
                lines.append(
                    f"Merge module_id == '{mid}' calc_rules from bundle {mod} "
                    f"(retire-prefix cleanup + upsert pilot rules; keep unrelated rules). "
                    f"{patch.get('description', '')}"
                )
            else:
                lines.append(patch.get("description") or f"Apply avatar patch: {action}")
        retire = spec.retire_rule_id_prefixes
        if retire:
            lines.append(
                "For each retire prefix, disable any rule_id matching the prefix "
                "that is NOT in this package's rule_ids."
            )
        return " ".join(lines)
    if spec.retire_rule_id_prefixes:
        return (
            f"Replace optional/active module_id == '{spec.module_id}' calc_rules "
            f"with module_{spec.module_id}.json. For each retire prefix, disable "
            f"any rule_id matching the prefix that is NOT in this package's rule_ids."
        )
    return f"Replace module_id == '{spec.module_id}'."


def _build_import_notes(spec: FormSpec, tax_year: int) -> dict:
    form_mapping_step = (
        "Merge form_mapping by canonical_field (upsert pilot leaves only; "
        "do NOT wipe TaxCore's other W-2 fields)"
        if spec.form_mapping_merge_mode == "upsert_by_canonical_field"
        else "Replace form_mapping"
    )
    calc_schema_step = (
        "Upsert calculation_schema worksheet leaves (keep prior_userra etc.)"
        if spec.calculation_schema_merge_mode == "upsert_worksheet_leaves"
        else "Merge calculation_schema_patch (replace worksheet key)"
    )
    return {
        "form": spec.form,
        "tax_year": tax_year,
        "decision": spec.import_decision,
        "form_mapping_merge_mode": spec.form_mapping_merge_mode,
        "retire_rule_id_prefixes": list(spec.retire_rule_id_prefixes),
        "collide_canonical_targets": list(spec.collide_canonical_targets),
        "wrappers_to_revisit": list(spec.wrappers_to_revisit),
        "scenarios_do_not_overwrite": list(spec.scenarios_do_not_overwrite),
        "avatar_action": _avatar_action_text(spec),
        "taxcore_adapter": f"taxcore_adapter/{spec.form}.json",
        "load_order": [
            calc_schema_step,
            "Merge canonical_schema_patch leaves if missing (key upsert)",
            "Merge canonical_field_metadata_patch by key",
            form_mapping_step,
            "Copy rules/*.json then: uv run python manage.py load_schemas "
            "--update-latest --type rules",
            f"Apply taxcore_adapter/{spec.form}.json avatar/scenario patches",
            "Disable old competing rules / scenario overwrite of same targets",
            "Smoke tests before next form export",
        ],
        "open_risks": list(spec.open_risks),
    }


def run_taxcore_export(form: str, tax_year: int = 2025) -> None:
    """Write TaxCore-shaped artifacts under output/ty{year}/taxcore/{form}/."""
    out_dir = OUTPUT_ROOT / f"ty{tax_year}" / "taxcore" / form
    rules_dir = out_dir / "rules"
    rules_dir.mkdir(parents=True, exist_ok=True)
    for stale in rules_dir.glob("*.json"):
        stale.unlink()

    form_id = _FORM_ID.get(form, f"irs_{form}")
    spec = get_form_spec(form)

    with get_session() as session:
        fields = session.execute(
            select(CanonicalField).where(
                _discovery_condition(CanonicalField.field_name, form, spec),
                CanonicalField.tax_year == tax_year,
            )
        ).scalars().all()
        fields_by_name = {f.field_name: f for f in fields}

        rules_all: list[CalcRule] = []
        if spec is None or spec.export_db_rules:
            rules_all = session.execute(
                select(CalcRule).where(
                    _discovery_condition(CalcRule.rule_id, form, spec),
                    CalcRule.tax_year == tax_year,
                    CalcRule.status != "superseded",
                )
            ).scalars().all()

        skip = set(spec.skip_stub_rule_ids) if spec else set()
        if spec is not None:
            skip |= set(spec.skip_export_rule_ids)
        rules = [r for r in rules_all if r.rule_id not in skip]
        rules_by_field_id = {r.canonical_field_id: r for r in rules}
        # For form mapping calc flag, stubs we skip should look like inputs.
        rules_for_mapping = {r.canonical_field_id: r for r in rules}

        pdf_maps = session.execute(
            select(PdfFieldMapping).where(
                PdfFieldMapping.form_number == form,
                PdfFieldMapping.tax_year == tax_year,
            )
        ).scalars().all()
        pdf_by_field_id: dict[str, PdfFieldMapping] = {}
        for m in sorted(pdf_maps, key=lambda x: -(x.confidence or 0)):
            pdf_by_field_id.setdefault(m.canonical_field_id, m)

        doc_ids = {
            (r.irs_reference or {}).get("document_id")
            for r in rules
            if (r.irs_reference or {}).get("document_id")
        }
        docs = (
            session.execute(select(Document).where(Document.id.in_(doc_ids)))
            .scalars()
            .all()
            if doc_ids
            else []
        )
        doc_by_id = {d.id: d for d in docs}

        computed_canonical = {r.rule_id for r in rules}
        required = _topo_required_rules(rules, form, spec)

        rule_dicts: list[dict] = []
        if spec is not None and not spec.export_db_rules:
            rule_dicts = _synthetic_rule_dicts(spec, tax_year)
            for payload in rule_dicts:
                (rules_dir / f"{payload['rule_id']}.json").write_text(
                    json.dumps(payload, indent=2) + "\n"
                )
        else:
            for r in sorted(rules, key=lambda x: x.rule_id):
                payload = _rule_to_taxcore(
                    r,
                    form,
                    tax_year,
                    fields_by_name.get(r.rule_id),
                    doc_by_id,
                    required.get(r.rule_id, []),
                    spec,
                    computed_canonical,
                )
                if payload.get("notes") is None:
                    payload.pop("notes", None)
                rule_dicts.append(payload)
                (rules_dir / f"{payload['rule_id']}.json").write_text(
                    json.dumps(payload, indent=2) + "\n"
                )

        def _line_key(f: CanonicalField) -> tuple:
            m = re.match(r"^(\d+)", f.source_form_line or "")
            return (int(m.group(1)) if m else 9999, f.source_form_line or "", f.field_name)

        def _sort_fields(field_list: list[CanonicalField]) -> list[CanonicalField]:
            if spec and spec.field_export_order:
                order = {name: i for i, name in enumerate(spec.field_export_order)}
                return sorted(
                    field_list,
                    key=lambda f: (order.get(f.field_name, 9999), f.field_name),
                )
            return sorted(field_list, key=_line_key)

        exclude_map = set(spec.form_mapping_exclude) if spec else set()
        field_mappings = [
            _field_mapping_entry(
                f,
                form,
                tax_year,
                rules_for_mapping.get(f.id),
                pdf_by_field_id.get(f.id),
                spec,
            )
            for f in _sort_fields(fields)
            if f.field_name not in exclude_map
        ]
        # FormSpec extras first (e.g. L1 HDHP booleans), then DB-derived mappings.
        if spec and spec.form_mapping_extras:
            field_mappings = [
                json.loads(json.dumps(e)) for e in spec.form_mapping_extras
            ] + field_mappings
        # Mark skipped stubs as direct_copy (inputs) in form mapping.
        if skip:
            for entry in field_mappings:
                if entry["canonical_field"] in skip:
                    entry["target_line"][str(tax_year)]["calculation"] = "direct_copy"

        form_mapping = {
            "form_type": form_id,
            "form_name": _FORM_DISPLAY.get(form, f"Form {form}"),
            "irs_form_number": form.upper() if form == "w2" else form,
            "tax_year": tax_year,
            "irs_schema_version": "",
            "supports_multiple_instances": (
                spec.multi_instance_key is not None
                if spec
                else form == "8889"
            ),
            "multi_instance_key": spec.multi_instance_key if spec else None,
            "return_type": "individual",
            "folds_into_core": True,
            "field_mappings": field_mappings,
            "metadata": {
                "source": "AI_TAX_ENGINE",
                "storage_unit": "dollars",
                "field_count": len(field_mappings),
                "worksheet_key": spec.worksheet_key if spec else f"form_{form}_worksheet",
                "form_mapping_merge_mode": (
                    spec.form_mapping_merge_mode if spec else "replace"
                ),
                "line1_model": (
                    "deductions.is_hdhp_self_only_coverage + "
                    "deductions.is_hdhp_family_coverage"
                    if form == "8889"
                    else None
                ),
                "projection": (
                    "intake_w2_* → multi_instance.w2_records.* (export only)"
                    if form == "w2"
                    else (
                        "form_1040_line_* → TaxCore domain paths (export only)"
                        if form == "1040"
                        else None
                    )
                ),
            },
        }
        (out_dir / f"form_mapping_{form_id}.json").write_text(
            json.dumps(form_mapping, indent=2) + "\n"
        )

        # --- canonical field metadata patch ---
        meta_fields: dict[str, dict] = {}
        for f in fields:
            rule = rules_for_mapping.get(f.id)
            is_checkbox = f.data_type == "CheckboxType"
            is_input = rule is None
            # User-entered checkboxes/flags must be mutable (checklist §6).
            mutable = is_input
            meta_key = (
                spec.taxcore_path(f.field_name)
                if spec and spec.field_name_map
                else f.field_name
            )
            section = meta_key.split(".", 1)[0] if "." in meta_key else "unknown"
            meta_fields[meta_key] = {
                "mutable": mutable,
                "source": (
                    "document_extraction"
                    if spec and spec.form == "w2"
                    else ("calculated" if rule is not None else "user_input")
                ),
                "section": section,
                "question_type": (
                    "boolean"
                    if is_checkbox
                    else (
                        "currency"
                        if "Amount" in (f.data_type or "")
                        or f.data_type in ("USAmountType", "USAmountNNType")
                        else "text"
                    )
                ),
                "display_label": (f.description or f.field_name)
                .split("\u2014")[0]
                .strip(),
                "comparison_label": None,
                "document_source": (
                    "W-2 Wage and Tax Statement" if spec and spec.form == "w2" else None
                ),
                "can_skip_if_document": spec.form == "w2" if spec else False,
                "is_array_field": False,
                "storage_unit": (
                    None
                    if f.data_type == "TextType"
                    else ("dollars" if not is_checkbox else None)
                ),
                "computed_by": (
                    _rule_id_for(rule.rule_id, form, spec) if rule else None
                ),
                "bookmarkable": True,
                "gdpr_erasure_category": "financial",
                "irs_pub_1075_fti": True,
                "enum_values": None,
                "children": None,
                "is_engine_question": False,
                "default_config": None,
                "source_form_line": f.source_form_line,
                "source_xsd_element": (
                    (spec.field_mapping_xsd.get(f.field_name) or {}).get("xsd_element")
                    if spec
                    else f.source_xsd_element
                ),
                "source_intake_field": (
                    f.field_name if spec and spec.field_name_map else None
                ),
            }

        if spec is not None:
            for name, overrides in spec.metadata_overrides.items():
                if name in meta_fields:
                    meta_fields[name] = _apply_metadata_overrides(
                        meta_fields[name], overrides
                    )
                else:
                    # Override for a field we still want in the patch.
                    base = {
                        "mutable": True,
                        "source": "user_input",
                        "section": name.split(".", 1)[0],
                        "question_type": "currency",
                        "display_label": _leaf(name),
                        "computed_by": None,
                        "storage_unit": "dollars",
                        "bookmarkable": True,
                        "gdpr_erasure_category": "financial",
                        "irs_pub_1075_fti": True,
                    }
                    meta_fields[name] = _apply_metadata_overrides(base, overrides)
            for name, extra in spec.extra_metadata_fields.items():
                meta_fields[name] = merge_metadata_field_entry(
                    meta_fields.get(name), extra
                )
            if spec.multi_instance_key:
                group_path = f"multi_instance.{spec.multi_instance_key}"
                parent = meta_fields.get(group_path)
                if isinstance(parent, dict):
                    meta_fields[group_path] = merge_metadata_children(
                        group_path,
                        parent,
                        meta_fields,
                        child_order=w2_child_order_from_spec(spec),
                    )

        meta_payload = {
            "version": f"{tax_year}.1.0",
            "generated_at": date.today().isoformat(),
            "schema_version": f"{tax_year}.1.0",
            "tax_year": tax_year,
            "irs_schema_version": "",
            "fields": meta_fields,
            "metadata": {
                "source": "AI_TAX_ENGINE",
                "form": form,
                "note": (
                    "Partial patch -- only this form's fields. Merge into TaxCore's "
                    "canonical_field_metadata by key (key-level upsert), do NOT replace "
                    "the whole file."
                ),
            },
        }
        (out_dir / f"canonical_field_metadata_patch_{form}.json").write_text(
            json.dumps(meta_payload, indent=2) + "\n"
        )

        rule_ids = [r["rule_id"] for r in rule_dicts]

        # --- FormSpec-driven artifacts (calculation schema, module, tree) ---
        if spec is not None:
            calc_patch = {
                "version": f"{tax_year}.1.0",
                "generated_at": date.today().isoformat(),
                "tax_year": tax_year,
                "storage_destination": "calculation_results",
                "can_be_purged_after_filing": True,
                "merge_mode": spec.calculation_schema_merge_mode,
                "structure": spec.worksheet_structure(),
                "metadata": {
                    "source": "AI_TAX_ENGINE",
                    "form": form,
                    "note": (
                        f"Upsert structure.{spec.worksheet_key} leaves in "
                        f"calculation_schema_{tax_year}.json "
                        "(keep existing leaves like prior_userra_contribution_year)."
                        if spec.calculation_schema_merge_mode == "upsert_worksheet_leaves"
                        else (
                            f"Replace structure.{spec.worksheet_key} in "
                            f"calculation_schema_{tax_year}.json entirely."
                        )
                    ),
                },
            }
            (out_dir / f"calculation_schema_patch_{form}.json").write_text(
                json.dumps(calc_patch, indent=2) + "\n"
            )

            canon_patch = {
                "version": f"{tax_year}.1.0",
                "generated_at": date.today().isoformat(),
                "tax_year": tax_year,
                "merge_mode": "upsert_leaves",
                "structure": spec.canonical_schema_additions,
                "metadata": {
                    "source": "AI_TAX_ENGINE",
                    "form": form,
                    "note": (
                        "Key-level upsert into canonical_schema structure sections. "
                        "Do NOT whole-replace canonical_schema."
                    ),
                },
            }
            (out_dir / f"canonical_schema_patch_{form}.json").write_text(
                json.dumps(canon_patch, indent=2) + "\n"
            )

            module = _build_module_payload(spec, tax_year, rule_ids)
            (out_dir / f"module_{spec.module_id}.json").write_text(
                json.dumps(module, indent=2) + "\n"
            )

            target_tree = _build_target_tree(spec, tax_year, rule_ids)
            (out_dir / f"target_tree_{form}.json").write_text(
                json.dumps(target_tree, indent=2) + "\n"
            )

            import_notes = _build_import_notes(spec, tax_year)
            (out_dir / f"import_notes_{form}.json").write_text(
                json.dumps(import_notes, indent=2) + "\n"
            )

        manifest = {
            "form": form,
            "form_type": form_id,
            "tax_year": tax_year,
            "rules_exported": len(rule_dicts),
            "fields_exported": len(fields),
            "pdf_mappings_attached": len(pdf_by_field_id),
            "storage_unit": "dollars",
            "worksheet_key": (
                spec.worksheet_key if spec else f"form_{form}_worksheet"
            ),
            "module_id": spec.module_id if spec else None,
            "decision": spec.import_decision if spec else "REPLACE old form chain — do not run both.",
            "drop_into_taxcore": {
                "rules": "data/schema/rules/",
                "form_mapping": (
                    f"Merge into data/schema/canonical/form_mappings/"
                    f"form_mapping_{form_id}.json by canonical_field"
                    if spec and spec.form_mapping_merge_mode == "upsert_by_canonical_field"
                    else f"data/schema/canonical/form_mappings/form_mapping_{form_id}.json"
                ),
                "calculation_schema_patch": (
                    "Replace structure.<worksheet_key> in "
                    "data/schema/canonical/calculation_schema_*.json"
                ),
                "canonical_schema_patch": (
                    "Upsert structure leaves into "
                    "data/schema/canonical/canonical_schema_*.json"
                ),
                "field_metadata_patch": (
                    "Merge fields{} into "
                    "data/schema/canonical/canonical_field_metadata_*.json by key"
                ),
                "module": (
                    f"Replace avatar optional_form_modules / active_form_modules "
                    f"entry module_id == '{spec.module_id}'"
                    if spec
                    else None
                ),
                "load": (
                    "uv run python manage.py load_schemas --update-latest "
                    "--type rules  # plus mappings/metadata as you normally do"
                ),
            },
            "artifacts": sorted(
                p.name for p in out_dir.iterdir() if p.is_file()
            )
            + [f"rules/{p.name}" for p in sorted(rules_dir.glob("*.json"))],
            "rule_ids": rule_ids,
            "skipped_stub_rule_ids": sorted(skip),
            "checklist": {
                "0_replace_old_chain": True,
                "1_worksheet_naming": (
                    (
                        spec.worksheet_key == "form_8889_hsa_deduction_worksheet"
                        and all(
                            rid.startswith("calc_form_8889_hsa_deduction_worksheet_")
                            for rid in rule_ids
                        )
                    )
                    if form == "8889" and spec is not None
                    else (
                        spec.worksheet_key == "w2_employer_use_worksheet"
                        and all(
                            not p.startswith("intake_w2_")
                            for p in (
                                e["canonical_field"] for e in field_mappings
                            )
                        )
                        if form == "w2" and spec is not None
                        else spec is not None
                    )
                ),
                "2_copy_merge_files": True,
                "3_calculation_schema_patch": spec is not None,
                "4_retire_notes": spec is not None,
                "5_module_wiring": spec is not None,
                "6_multi_instance_projection": (
                    form == "w2" and spec.multi_instance_key == "w2_records"
                    if spec
                    else None
                ),
                "7_smoke_tests": "TaxCore-side after import",
            },
            "open_risks": list(spec.open_risks) if spec else [],
        }
        # Recompute artifacts after writing manifest siblings (already written).
        manifest["artifacts"] = sorted(
            [p.name for p in out_dir.iterdir() if p.is_file() and p.name != "MANIFEST.json"]
            + [f"rules/{p.name}" for p in sorted(rules_dir.glob("*.json"))]
        )
        (out_dir / "MANIFEST.json").write_text(json.dumps(manifest, indent=2) + "\n")

    (out_dir / "rules.json").write_text(
        json.dumps(
            {
                "form": form,
                "tax_year": tax_year,
                "worksheet_key": (
                    spec.worksheet_key if spec else f"form_{form}_worksheet"
                ),
                "rules": rule_dicts,
            },
            indent=2,
        )
        + "\n"
    )

    print(
        f"taxcore export complete (form={form}): {len(rule_dicts)} rules, "
        f"{len(fields)} field mappings -> {out_dir}"
        + (f" worksheet={spec.worksheet_key}" if spec else "")
    )


def run_taxcore_export_all_renamed(tax_year: int = 2025) -> None:
    """Export every form that already uses TaxCore dot-notation names."""
    for form in FORM_FIELD_NAME_OVERRIDES:
        run_taxcore_export(form, tax_year)
