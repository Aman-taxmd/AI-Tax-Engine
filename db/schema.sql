-- AI Tax Engine — Production Postgres schema (authoritative DDL).
--
-- Design invariants (see docs/adr/):
--   * Nothing is ever UPDATEd in a way that destroys history. "Versioned" tables
--     get a new row per version; status changes are logged in *_transitions.
--   * content_hash columns are indexed lookup keys for dedup/caching, NOT primary
--     keys (ADR 0004) — ordinary surrogate ids remain the join keys.
--   * citation_edges (documentation graph) and dependency_edges (computation
--     graph) are deliberately separate tables (ADR — see plan "citation vs
--     dependency graph").
--
-- NOTE: the runnable pilot code (build/db.py) targets this same logical schema
-- via SQLAlchemy so it can run against SQLite locally and Postgres in
-- production. This file is the authoritative Postgres DDL for production.

CREATE TABLE IF NOT EXISTS documents (
    id              UUID PRIMARY KEY,
    source_url      TEXT NOT NULL,
    doc_type        TEXT NOT NULL CHECK (doc_type IN ('instructions', 'publication', 'form', 'xsd', 'xsl', 'business_rules_csv')),
    form_number     TEXT NOT NULL,
    tax_year        INTEGER NOT NULL,
    revision_date   TEXT,
    fetched_at      TIMESTAMPTZ NOT NULL DEFAULT now(),
    content_hash    TEXT NOT NULL,
    storage_path    TEXT NOT NULL,
    version         INTEGER NOT NULL DEFAULT 1,
    superseded_by   UUID REFERENCES documents(id)
);
CREATE INDEX IF NOT EXISTS idx_documents_hash ON documents (content_hash);
CREATE INDEX IF NOT EXISTS idx_documents_form_year ON documents (form_number, tax_year);

CREATE TABLE IF NOT EXISTS sections (
    id                UUID PRIMARY KEY,
    document_id       UUID NOT NULL REFERENCES documents(id),
    heading           TEXT NOT NULL,
    anchor_id         TEXT,
    irs_line_ref      TEXT,
    parent_section_id UUID REFERENCES sections(id),
    order_index       INTEGER NOT NULL,
    text              TEXT NOT NULL,
    content_hash      TEXT NOT NULL
);
CREATE INDEX IF NOT EXISTS idx_sections_document ON sections (document_id);
CREATE INDEX IF NOT EXISTS idx_sections_line_ref ON sections (irs_line_ref);

CREATE TABLE IF NOT EXISTS citation_edges (
    id                  UUID PRIMARY KEY,
    from_section_id     UUID NOT NULL REFERENCES sections(id),
    edge_type           TEXT NOT NULL CHECK (edge_type IN ('exception_ref', 'carryover_ref', 'cardinality_ref')),
    raw_phrase          TEXT NOT NULL,
    to_document_hint    TEXT,
    to_section_id       UUID REFERENCES sections(id),
    resolution_method   TEXT CHECK (resolution_method IN ('regex', 'llm', 'human', 'unresolved')),
    confidence          REAL,
    created_at          TIMESTAMPTZ NOT NULL DEFAULT now()
);
CREATE INDEX IF NOT EXISTS idx_citation_edges_from ON citation_edges (from_section_id);

CREATE TABLE IF NOT EXISTS evidence_bundles (
    id                    UUID PRIMARY KEY,
    source_type           TEXT NOT NULL CHECK (source_type IN ('llm_extraction', 'human_review', 'deterministic_parse')),
    document_version_id   UUID REFERENCES documents(id),
    section_ids           JSONB NOT NULL DEFAULT '[]',
    exact_quotes          JSONB NOT NULL DEFAULT '[]',
    prompt_version        TEXT,
    model_version         TEXT,
    temperature            REAL,
    extraction_timestamp  TIMESTAMPTZ NOT NULL DEFAULT now(),
    reviewer              TEXT,
    raw_llm_response      TEXT,
    confidence_breakdown  JSONB NOT NULL DEFAULT '{}',
    content_hash          TEXT NOT NULL
);
CREATE INDEX IF NOT EXISTS idx_evidence_bundles_hash ON evidence_bundles (content_hash);

CREATE TABLE IF NOT EXISTS knowledge_packets (
    id                    UUID PRIMARY KEY,
    version               INTEGER NOT NULL DEFAULT 1,
    evidence_bundle_id    UUID NOT NULL REFERENCES evidence_bundles(id),
    form_number           TEXT NOT NULL,
    irs_line              TEXT NOT NULL,
    core_text             TEXT NOT NULL,
    exceptions            JSONB NOT NULL DEFAULT '[]',
    status                TEXT NOT NULL DEFAULT 'draft' CHECK (status IN ('draft', 'needs_review', 'validated')),
    confidence_breakdown  JSONB NOT NULL DEFAULT '{}',
    superseded_by         UUID REFERENCES knowledge_packets(id),
    created_at            TIMESTAMPTZ NOT NULL DEFAULT now()
);
CREATE INDEX IF NOT EXISTS idx_knowledge_packets_line ON knowledge_packets (form_number, irs_line);

CREATE TABLE IF NOT EXISTS concepts (
    id                            UUID PRIMARY KEY,
    name                          TEXT NOT NULL UNIQUE,
    definition                    TEXT NOT NULL,
    effective_year                INTEGER NOT NULL,
    authoritative_source_citation JSONB NOT NULL DEFAULT '{}'
);

CREATE TABLE IF NOT EXISTS concept_references (
    concept_id          UUID NOT NULL REFERENCES concepts(id),
    knowledge_packet_id UUID NOT NULL REFERENCES knowledge_packets(id),
    PRIMARY KEY (concept_id, knowledge_packet_id)
);

CREATE TABLE IF NOT EXISTS dependency_edges (
    id                    UUID PRIMARY KEY,
    field_a               TEXT NOT NULL,
    depends_on_type       TEXT NOT NULL CHECK (depends_on_type IN ('field', 'concept')),
    depends_on_ref        TEXT NOT NULL,
    created_at            TIMESTAMPTZ NOT NULL DEFAULT now()
);
CREATE INDEX IF NOT EXISTS idx_dependency_edges_field_a ON dependency_edges (field_a);
CREATE INDEX IF NOT EXISTS idx_dependency_edges_dep ON dependency_edges (depends_on_ref);

-- tax_year: which tax year this row applies to. The same field_name/rule_id
-- can legitimately have one row per year (form lines are stable identifiers
-- across years; only the underlying rule/constants/mapping data changes) --
-- see docs/adr/0009-tax-year-scoping.md.
CREATE TABLE IF NOT EXISTS canonical_fields (
    id                   UUID PRIMARY KEY,
    field_name           TEXT NOT NULL,
    section              TEXT NOT NULL,
    data_type            TEXT NOT NULL,
    cardinality          TEXT NOT NULL DEFAULT 'single' CHECK (cardinality IN ('single', 'multi_instance')),
    instance_dimension   TEXT,
    source_xsd_element   TEXT,
    source_form_line     TEXT,
    description          TEXT NOT NULL,
    version              INTEGER NOT NULL DEFAULT 1,
    tax_year             INTEGER NOT NULL DEFAULT 2025,
    superseded_by        UUID REFERENCES canonical_fields(id),
    UNIQUE (field_name, version, tax_year)
);

CREATE TABLE IF NOT EXISTS calc_rules (
    id                        UUID PRIMARY KEY,
    rule_id                   TEXT NOT NULL,
    version                   INTEGER NOT NULL DEFAULT 1,
    status                    TEXT NOT NULL DEFAULT 'candidate' CHECK (status IN ('candidate', 'validated', 'production', 'superseded')),
    canonical_field_id        UUID NOT NULL REFERENCES canonical_fields(id),
    formula                   JSONB NOT NULL,
    operands                  JSONB NOT NULL DEFAULT '[]',
    carryover_target          TEXT,
    irs_reference             JSONB NOT NULL DEFAULT '{}',
    source_knowledge_packet_id UUID REFERENCES knowledge_packets(id),
    confidence_breakdown      JSONB NOT NULL DEFAULT '{}',
    created_at                TIMESTAMPTZ NOT NULL DEFAULT now(),
    tax_year                  INTEGER NOT NULL DEFAULT 2025,
    UNIQUE (rule_id, version, tax_year)
);
CREATE INDEX IF NOT EXISTS idx_calc_rules_status ON calc_rules (status);

CREATE TABLE IF NOT EXISTS rule_status_transitions (
    id          UUID PRIMARY KEY,
    rule_id     UUID NOT NULL REFERENCES calc_rules(id),
    from_status TEXT,
    to_status   TEXT NOT NULL,
    changed_by  TEXT NOT NULL,
    changed_at  TIMESTAMPTZ NOT NULL DEFAULT now(),
    reason      TEXT
);

CREATE TABLE IF NOT EXISTS golden_cases (
    id                UUID PRIMARY KEY,
    form_number       TEXT NOT NULL,
    scenario          TEXT NOT NULL,
    inputs            JSONB NOT NULL,
    expected_outputs  JSONB NOT NULL,
    source            TEXT NOT NULL CHECK (source IN ('hand_authored', 'baseline_existing_repo'))
);

CREATE TABLE IF NOT EXISTS evaluation_runs (
    id          UUID PRIMARY KEY,
    run_type    TEXT NOT NULL CHECK (run_type IN ('grounding_check', 'numeric_check', 'baseline_diff', 'rigorous_consistency')),
    target_type TEXT NOT NULL,
    target_id   TEXT NOT NULL,
    result      TEXT NOT NULL CHECK (result IN ('pass', 'fail', 'warn')),
    detail      JSONB NOT NULL DEFAULT '{}',
    run_at      TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE TABLE IF NOT EXISTS human_review_items (
    id               UUID PRIMARY KEY,
    related_type     TEXT NOT NULL,
    related_id       TEXT NOT NULL,
    reason           TEXT NOT NULL,
    status           TEXT NOT NULL DEFAULT 'pending' CHECK (status IN ('pending', 'resolved')),
    resolution_notes TEXT,
    resolved_at      TIMESTAMPTZ,
    created_at       TIMESTAMPTZ NOT NULL DEFAULT now(),
    -- Everything a reviewer needs to render this item without further joins
    -- or LangGraph-checkpoint access (source_url, exact quote, draft packet
    -- or formula/operands + judge issues). See docs/adr/0007.
    detail           JSONB NOT NULL DEFAULT '{}'
);
CREATE INDEX IF NOT EXISTS idx_human_review_status ON human_review_items (status);

-- The taxpayer-facing Question Registry (build-time artifact). Form-line
-- questions set maps_to_canonical_field; profile questions (age, etc.) set
-- maps_to_condition instead — never both. See runtime/condition_rules.py.
CREATE TABLE IF NOT EXISTS intake_questions (
    id                       UUID PRIMARY KEY,
    form_number              TEXT NOT NULL,
    question_key             TEXT NOT NULL,
    prompt_text              TEXT NOT NULL,
    input_type               TEXT NOT NULL CHECK (input_type IN ('currency', 'integer', 'boolean', 'choice', 'date', 'currency_multi_instance')),
    choices                  JSONB,
    maps_to_canonical_field  TEXT,
    maps_to_condition        JSONB,
    justification            TEXT NOT NULL,
    irs_reference            JSONB NOT NULL DEFAULT '{}',
    order_index              INTEGER NOT NULL DEFAULT 0,
    required                 BOOLEAN NOT NULL DEFAULT true,
    -- question_key is no longer globally unique on its own since the same
    -- question can recur, unchanged, across years.
    tax_year                 INTEGER NOT NULL DEFAULT 2025,
    UNIQUE (question_key, tax_year)
);
CREATE INDEX IF NOT EXISTS idx_intake_questions_form ON intake_questions (form_number);

-- An on-demand LLM "CPA review" run (see docs/adr/0007) — advisory only,
-- never influences a computed value. Taxpayer answers/computed values are
-- NOT persisted anywhere else (ephemeral, browser-session-only); only the
-- review outcome is logged here for audit/quality-improvement purposes.
CREATE TABLE IF NOT EXISTS runtime_review_findings (
    id                  UUID PRIMARY KEY,
    triggered_at        TIMESTAMPTZ NOT NULL DEFAULT now(),
    form_chain          TEXT NOT NULL,
    computed_snapshot   JSONB NOT NULL DEFAULT '{}',
    findings            JSONB NOT NULL DEFAULT '[]',
    model_version       TEXT,
    prompt_version      TEXT
);

-- Maps a canonical field to the real AcroForm field code on the actual IRS
-- PDF (e.g. form_8889_line_2 -> topmostSubform[0].Page1[0].f1_2[0]). IRS
-- fillable PDFs use auto-generated field codes with no embedded description
-- text, so this can't be derived mechanically; an LLM proposes it, scoped to
-- only the pilot's in-scope fields. Low-confidence proposals are routed to
-- human_review_items instead of trusted silently. See docs/adr/0008 and
-- build/synthesis/pdf_field_mapper.py.
CREATE TABLE IF NOT EXISTS pdf_field_mappings (
    id                    UUID PRIMARY KEY,
    canonical_field_id    UUID NOT NULL REFERENCES canonical_fields(id),
    form_number           TEXT NOT NULL,
    pdf_field_code        TEXT NOT NULL,
    page_number           INTEGER NOT NULL DEFAULT 0,
    confidence            REAL NOT NULL DEFAULT 0.0,
    reasoning             TEXT,
    model_version         TEXT,
    prompt_version        TEXT,
    -- Non-null "" for an ordinary single-widget mapping; the specific
    -- canonical-field value that should check THIS widget for a
    -- multi-widget checkbox-choice field (e.g. "self_only"/"family") --
    -- see db/models.py's PdfFieldMapping docstring.
    checkbox_match_value  TEXT NOT NULL DEFAULT '',
    created_at            TIMESTAMPTZ NOT NULL DEFAULT now(),
    -- Denormalized copy of the mapped canonical_field's tax_year, kept
    -- purely for cheap indexed filtering without a join (see
    -- docs/adr/0009-tax-year-scoping.md).
    tax_year              INTEGER NOT NULL DEFAULT 2025,
    UNIQUE (canonical_field_id, form_number, checkbox_match_value)
);
CREATE INDEX IF NOT EXISTS idx_pdf_field_mappings_form ON pdf_field_mappings (form_number);
CREATE INDEX IF NOT EXISTS idx_pdf_field_mappings_year ON pdf_field_mappings (tax_year);

-- Immutable header row for one build-time extraction of a year's IRS Tax
-- Table or Tax Computation Worksheet from the stored i1040gi HTML (see
-- build/ingestion/tax_table_extractor.py). At most one row is
-- is_active=true per (tax_year, dataset_type) at a time; superseded
-- datasets' rows are kept (never deleted) for audit history.
CREATE TABLE IF NOT EXISTS tax_datasets (
    id                    UUID PRIMARY KEY,
    tax_year              INTEGER NOT NULL,
    dataset_type          TEXT NOT NULL CHECK (dataset_type IN ('tax_table', 'tax_computation_brackets')),
    source_document_id    UUID NOT NULL REFERENCES documents(id),
    source_content_hash   TEXT NOT NULL,
    parser_version        TEXT NOT NULL,
    row_count             INTEGER NOT NULL,
    is_active             BOOLEAN NOT NULL DEFAULT false,
    created_at            TIMESTAMPTZ NOT NULL DEFAULT now(),
    notes                 TEXT
);
CREATE INDEX IF NOT EXISTS idx_tax_datasets_lookup ON tax_datasets (tax_year, dataset_type, is_active);

-- One (income bracket, filing status) row of the IRS Tax Table (taxable
-- income < $100,000). [at_least, less_than) is half-open, matching the Tax
-- Table's own "At least / But less than" columns.
CREATE TABLE IF NOT EXISTS tax_table_rows (
    id            UUID PRIMARY KEY,
    dataset_id    UUID NOT NULL REFERENCES tax_datasets(id),
    filing_status TEXT NOT NULL,
    at_least      REAL NOT NULL,
    less_than     REAL NOT NULL,
    tax_amount    REAL NOT NULL
);
CREATE INDEX IF NOT EXISTS idx_tax_table_rows_lookup ON tax_table_rows (dataset_id, filing_status, at_least);

-- One marginal-rate bracket of the IRS Tax Computation Worksheet (taxable
-- income >= $100,000): Line 16 = income * rate - subtract_amount for
-- whichever bracket the income falls in. income_less_than=NULL marks the
-- top (unbounded, "Over $X") bracket.
CREATE TABLE IF NOT EXISTS tax_computation_brackets (
    id                 UUID PRIMARY KEY,
    dataset_id         UUID NOT NULL REFERENCES tax_datasets(id),
    filing_status      TEXT NOT NULL,
    bracket_order      INTEGER NOT NULL,
    income_at_least    REAL NOT NULL,
    income_less_than   REAL,
    rate               REAL NOT NULL,
    subtract_amount    REAL NOT NULL
);
CREATE INDEX IF NOT EXISTS idx_tax_computation_brackets_lookup ON tax_computation_brackets (dataset_id, filing_status, income_at_least);

-- Flat-dollar/rate IRS constants for a given tax year (one row per year) --
-- the database-backed replacement for the `_2025`-suffixed Python dict
-- constants previously hardcoded in runtime/tax_constants.py and
-- runtime/condition_rules.py. Pattern verified against TaxMD-TaxCore's own
-- TaxConstants model; unlike TaxCore's copy of these figures (found to be
-- stale -- pre-OBBBA standard deduction amounts), this table is always
-- seeded from our own citation-verified values (see
-- scripts/seed_tax_constants.py). `constants` is a nested JSON blob keyed by
-- stable, year-agnostic names -- the year never appears inside a calc rule
-- or condition function, only in which year's row gets loaded. All
-- monetary amounts are plain float DOLLARS (never cents). See
-- docs/adr/0009-tax-year-scoping.md.
CREATE TABLE IF NOT EXISTS tax_constants (
    tax_year             INTEGER PRIMARY KEY,
    constants            JSONB NOT NULL,
    effective_date       TEXT NOT NULL,
    irs_source_citation  TEXT NOT NULL,
    created_at           TIMESTAMPTZ NOT NULL DEFAULT now()
);
