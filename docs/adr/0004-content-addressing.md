# ADR 0004: Content hashes as cache/dedup keys, not primary keys

## Status
Accepted

## Context
"Content-addressed" storage (hash of inputs identifies the artifact) enables
a build cache: skip re-extraction if a section's text, prompt version, and
model version are unchanged since the last run.

## Decision
Every table that benefits from this (`documents`, `sections`,
`evidence_bundles`) carries an indexed `content_hash` column used for cache
lookups and change detection. Ordinary surrogate UUIDs remain the primary
keys and foreign key join columns.

## Rationale
- Gets the build-cache and change-detection benefit (skip work when nothing
  changed) without the ergonomic and indexing cost of joining on long hash
  strings everywhere.
- Keeps foreign keys short and consistent regardless of how large the
  underlying content is.

## Consequences
Any pipeline stage that produces a cacheable artifact must compute and store
its content hash, and must check for an existing matching hash before
redoing expensive work (particularly LLM calls in the extraction phase).
