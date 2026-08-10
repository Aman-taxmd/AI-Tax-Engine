"""Phase 8 entrypoint. Currently wires the grounding check (LLM-as-judge).

numeric_check (golden-case execution) and baseline_diff (vs. hand-authored
rules in the reference repos) are not built yet — this pilot has no runtime
calculation engine to execute golden cases against (that's Phase 10) and no
baseline rule set loaded for Form 8889/1040/Schedule 1 to diff against. Both
are future work; `run_type` values for them already exist in the
evaluation_runs CHECK constraint (db/schema.sql / db/models.py) so adding
them later doesn't require a schema change.
"""
from __future__ import annotations

from build.evaluation.grounding_check import run_grounding_check


def run_all_evaluations(form: str, tax_year: int = 2025) -> None:
    run_grounding_check(form, tax_year)
