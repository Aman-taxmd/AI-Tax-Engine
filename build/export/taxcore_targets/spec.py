"""Shared FormSpec shape for TaxCore export target trees."""
from __future__ import annotations

from dataclasses import dataclass, field


@dataclass(frozen=True)
class FormSpec:
    """Import contract for one IRS form's TaxCore drop-in package."""

    form: str
    form_type: str
    display_label: str
    module_id: str

    # calculation_results.<worksheet_key>.*
    worksheet_key: str

    # e.g. calc_form_{form}_hsa_deduction_worksheet_{leaf}
    rule_id_template: str = "calc_form_{form}_worksheet_{leaf}"

    # Leaf -> type for calculation_schema patch.
    worksheet_fields: dict[str, str] = field(default_factory=dict)

    # Canonical fields to omit from form_mapping (still OK in metadata/schema).
    form_mapping_exclude: frozenset[str] = field(default_factory=frozenset)

    # Extra form_mapping entries (e.g. TaxCore L1 booleans not in our DB fields).
    form_mapping_extras: list[dict] = field(default_factory=list)

    # Canonical paths that are true inputs (mutable user/document).
    canonical_inputs: list[str] = field(default_factory=list)

    # Canonical paths that modules must promote from the worksheet.
    must_promote: list[str] = field(default_factory=list)

    # Extra worksheet→canonical promotes for form-view / AGI intermediates.
    form_view_promote: list[str] = field(default_factory=list)

    # Explicit promotion mappings (overrides promote_mappings() when set).
    output_mappings: list[dict[str, str]] | None = None

    # Ordered calc_rules for the avatar module (TaxCore rule_ids).
    calc_rules_order: list[str] = field(default_factory=list)

    # Per-field metadata overrides applied on top of DB-derived patch.
    metadata_overrides: dict[str, dict] = field(default_factory=dict)

    # Extra metadata keys not present as CanonicalField rows (e.g. HDHP booleans).
    extra_metadata_fields: dict[str, dict] = field(default_factory=dict)

    # Extra canonical_schema structure leaves to declare (section -> {leaf: type}).
    canonical_schema_additions: dict[str, dict] = field(default_factory=dict)

    # Canonical rule_ids whose stub constant-0 rules should NOT be exported.
    skip_stub_rule_ids: frozenset[str] = field(default_factory=frozenset)

    # Rule_ids owned elsewhere (e.g. W-2 package) — skip export entirely.
    skip_export_rule_ids: frozenset[str] = field(default_factory=frozenset)

    # Multi-worksheet forms (1040): worksheet_key -> {leaf: type}. When set,
    # replaces single worksheet_fields in calculation_schema / target_tree.
    worksheets: dict[str, dict[str, str]] = field(default_factory=dict)

    # source rule_id -> {taxcore_rule_id, worksheet_key, output_leaf, canonical_target}
    rule_projections: dict[str, dict[str, str]] = field(default_factory=dict)

    # Cross-form operand names -> TaxCore paths (export projection only).
    cross_form_field_map: dict[str, str] = field(default_factory=dict)

    # Canonical rule_id -> TaxCore formula override (e.g. W-2 aggregate shape).
    formula_overrides: dict[str, dict] = field(default_factory=dict)

    # Notes attached when a formula_override is applied.
    formula_override_notes: dict[str, list[str]] = field(default_factory=dict)

    # TaxCore scenario prefix rules that must run before exported form rules
    # (topological sort uses required_rules only — not canonical field reads).
    scenario_rule_dependencies: dict[str, list[str]] = field(default_factory=dict)

    # Additional required_rules merged at export (intra-form ordering gaps).
    extra_rule_dependencies: dict[str, list[str]] = field(default_factory=dict)

    # Canonical fields populated by scenario prefix rules; merged into
    # required_computed_fields for the listed exported rule_ids.
    scenario_computed_field_dependencies: dict[str, list[str]] = field(
        default_factory=dict
    )

    # Import retirement / collision guidance for TaxCore operators.
    retire_rule_id_prefixes: list[str] = field(default_factory=list)
    collide_canonical_targets: list[str] = field(default_factory=list)
    wrappers_to_revisit: list[str] = field(default_factory=list)
    scenarios_do_not_overwrite: list[str] = field(default_factory=list)
    open_risks: list[str] = field(default_factory=list)

    # --- Multi-instance / projection (W-2 pilot) ---
    # SQL LIKE pattern for discovering our DB fields (e.g. intake_w2_%).
    source_field_pattern: str | None = None

    # Our field_name -> TaxCore canonical path (export projection).
    field_name_map: dict[str, str] = field(default_factory=dict)

    # Export order for intake fields (intake names).
    field_export_order: list[str] = field(default_factory=list)

    # Per intake field: XSD / form_view overrides for TaxCore form_mapping.
    field_mapping_xsd: dict[str, dict] = field(default_factory=dict)

    # Pre-built TaxCore rules (used when export_db_rules is False).
    synthetic_rules: list[dict] = field(default_factory=list)

    # When False, do not export CalcRule rows from our DB (W-2 uses synthetic only).
    export_db_rules: bool = True

    # Avatar module instance wiring.
    instance_type: str = "single"
    multi_instance_key: str | None = None

    # form_mapping import: replace whole file vs upsert by canonical_field.
    form_mapping_merge_mode: str = "replace"

    # calculation_schema patch: replace_worksheet_key | upsert_worksheet_leaves
    calculation_schema_merge_mode: str = "replace_worksheet_key"

    module_description: str = ""
    import_decision: str = "REPLACE old form chain — do not run both."

    # Extra keys merged into target_tree_*.json.
    target_tree_extras: dict = field(default_factory=dict)

    def projection_for(self, rule_id: str) -> dict[str, str] | None:
        return self.rule_projections.get(rule_id)

    def rule_id_for(self, field_name: str) -> str:
        proj = self.projection_for(field_name)
        if proj is not None:
            return proj["taxcore_rule_id"]
        leaf = field_name.rsplit(".", 1)[-1]
        return self.rule_id_template.format(form=self.form.replace("-", "_"), leaf=leaf)

    def output_field_for(self, field_name: str) -> str:
        proj = self.projection_for(field_name)
        if proj is not None:
            return f"{proj['worksheet_key']}.{proj['output_leaf']}"
        leaf = field_name.rsplit(".", 1)[-1]
        return f"{self.worksheet_key}.{leaf}"

    def canonical_target_for(self, rule_id: str) -> str | None:
        proj = self.projection_for(rule_id)
        if proj is not None:
            if proj.get("canonical_target"):
                return proj["canonical_target"]
            return None
        return self.field_name_map.get(rule_id, rule_id)

    def worksheet_structure(self) -> dict[str, dict[str, str]]:
        if self.worksheets:
            return {k: dict(v) for k, v in self.worksheets.items()}
        return {self.worksheet_key: dict(self.worksheet_fields)}

    def taxcore_path(self, source_field: str) -> str:
        return self.field_name_map.get(source_field, source_field)

    def promote_mappings(self) -> list[dict[str, str]]:
        if self.output_mappings is not None:
            return list(self.output_mappings)
        targets = list(dict.fromkeys([*self.must_promote, *self.form_view_promote]))
        return [
            {
                "source": self.output_field_for(target),
                "target": target,
            }
            for target in targets
        ]
