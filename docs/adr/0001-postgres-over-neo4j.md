# ADR 0001: Postgres (relational) over Neo4j (graph database)

## Status
Accepted

## Context
The pipeline needs to represent two graphs: a citation graph (which document
section references which other section) and a dependency graph (which
calculated field depends on which other field or shared concept). A generic
graph database was considered so these could be modeled natively.

## Decision
Use PostgreSQL with ordinary relational tables (`citation_edges`,
`dependency_edges`, `concepts`, `concept_references`) instead of adopting a
graph database. The graph structure is expressed as edge tables with foreign
keys; queries use ordinary joins/recursive CTEs.

## Rationale
- The graphs here are small, well-typed, and shallow (a handful of hops at
  most) — they do not need general-purpose graph traversal algorithms.
- Postgres is already the natural home for everything else in the system
  (documents, evidence, rules, evaluation runs), so a single relational store
  avoids a second piece of infrastructure to operate, back up, and migrate.
- Immutability and versioning (ADR 0002) are easiest to enforce with
  ordinary relational constraints and append-only tables.
- JSONB columns provide enough schema flexibility for evolving fields
  (confidence breakdowns, formula bodies) without giving up relational
  integrity for the graph edges themselves.

## Consequences
If the dependency/citation graphs grow deep enough that recursive queries
become a bottleneck, a dedicated graph engine can be introduced later without
changing the source-of-truth tables — this ADR is revisited if that
threshold is reached, not before.
