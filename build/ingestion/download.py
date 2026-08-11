"""Download + stage (Phase 1).

Two sources feed the version store:
  1. Live HTTP fetch of in-scope documents found by discovery.py.
  2. Local staging of the real XSD/XSL files bundled with this repo under
     build/ingestion/input/ (copied from TaxMD-Schema-Automation-New — see
     the plan's repo reference manifest). These are registered exactly like
     any other document so they participate in the same immutable/versioned
     store and can be cited from canonical fields (Phase 7).
"""
from __future__ import annotations

from pathlib import Path

import requests
import structlog

from build.ingestion.discovery import USER_AGENT, DiscoveredDocument
from build.ingestion.store.version_store import store_document

log = structlog.get_logger(__name__)

INPUT_ROOT = Path(__file__).resolve().parent / "input"

# (relative path under input/, doc_type, form_number this artifact belongs to)
STAGED_LOCAL_FILES = [
    ("irs_xsd_schemas/ty2025/IRS8889.xsd", "xsd", "8889"),
    ("irs_xsd_schemas/ty2025/efileTypes.xsd", "xsd", "8889"),
    ("irs_xsd_schemas/ty2025/efileMessageCommon.xsd", "xsd", "8889"),
    ("irs_xsl_stylesheets/ty2025/IRS8889.xsl", "xsl", "8889"),
    # Form 1040 — needed so the HSA deduction chain (8889 -> Schedule 1 -> 1040)
    # has real destination canonical fields to carry over into (see
    # build/consolidation/cross_form_bridge.py).
    ("irs_xsd_schemas/ty2025/IRS1040.xsd", "xsd", "1040"),
    ("irs_xsl_stylesheets/ty2025/IRS1040.xsl", "xsl", "1040"),
    # Schedule 1 (Form 1040) is its own e-file schema/form identity even though
    # it has no separate "About" page (its line instructions live inside the
    # general i1040gi booklet) — tagged with the distinct form_number "1040s1"
    # so its canonical fields don't collide with Form 1040's own line numbers
    # (both forms have, for example, an unrelated "line 13").
    ("irs_xsd_schemas/ty2025/IRS1040Schedule1.xsd", "xsd", "1040s1"),
    ("irs_xsl_stylesheets/ty2025/IRS1040Schedule1.xsl", "xsl", "1040s1"),
    # Schedule 1-A (Form 1040) — new for tax year 2025 (OBBBA additional
    # deductions: tips, overtime, car loan interest, enhanced senior
    # deduction). Same distinct-form-identity reasoning as Schedule 1: its
    # own e-file schema, own line numbering ("line 3" here is MAGI, not
    # Schedule 1's or Form 1040's unrelated "line 3"). Every element in this
    # XSD carries a clean <LineNumber> annotation (verified directly), so it
    # walks through canonical_field_writer.py exactly like 1040/8889/1040s1
    # with no special-casing.
    ("irs_xsd_schemas/ty2025/IRS1040Schedule1A.xsd", "xsd", "1040s1a"),
    ("irs_xsl_stylesheets/ty2025/IRS1040Schedule1A.xsl", "xsl", "1040s1a"),
    # Schedule C (Form 1040) — Profit or Loss from Business. Its own e-file
    # schema/form identity, own "About Schedule C" page, own line numbering
    # (Part I income lines 1-7, Part II expenses 8-27a, net profit line 31).
    ("irs_xsd_schemas/ty2025/IRS1040ScheduleC.xsd", "xsd", "1040sc"),
    ("irs_xsl_stylesheets/ty2025/IRS1040ScheduleC.xsl", "xsl", "1040sc"),
    # Schedule SE (Form 1040) — Self-Employment Tax. Own e-file schema/form
    # identity, own "About Schedule SE" page, own line numbering (Part I
    # regular-method computation, lines 1-13).
    ("irs_xsd_schemas/ty2025/IRS1040ScheduleSE.xsd", "xsd", "1040sse"),
    ("irs_xsl_stylesheets/ty2025/IRS1040ScheduleSE.xsl", "xsl", "1040sse"),
    # Schedule 2 (Form 1040) — Additional Taxes. Same "no separate About
    # page" situation as Schedule 1 (see form_1040s2.yaml) -- own e-file
    # schema/form identity, own line numbering (Part I lines 1-3 AMT/excess
    # APTC, Part II lines 4-21 other taxes incl. self-employment tax on line
    # 4 and HSA additional taxes on lines 17c/17d).
    ("irs_xsd_schemas/ty2025/IRS1040Schedule2.xsd", "xsd", "1040s2"),
    ("irs_xsl_stylesheets/ty2025/IRS1040Schedule2.xsl", "xsl", "1040s2"),
    # Form 4562 — Depreciation and Amortization (cost segregation pilot).
    ("irs_xsd_schemas/ty2025/IRS4562.xsd", "xsd", "4562"),
    ("irs_xsl_stylesheets/ty2025/IRS4562.xsl", "xsl", "4562"),
    # Schedule E (Form 1040) — rental income (cost seg chain).
    ("irs_xsd_schemas/ty2025/IRS1040ScheduleE.xsd", "xsd", "1040se"),
    ("irs_xsl_stylesheets/ty2025/IRS1040ScheduleE.xsl", "xsl", "1040se"),
    # Form W-2 — employer wage statement (multi-instance intake pilot).
    ("irs_xsd_schemas/ty2025/IRSW2.xsd", "xsd", "w2"),
    ("irs_xsl_stylesheets/ty2025/IRSW2.xsl", "xsl", "w2"),
]

# Primary e-file schema file for each form identity — the one actually walked
# by canonical_field_writer.py (as opposed to shared support schemas like
# efileTypes.xsd, which every form's XSD imports but which isn't itself a
# per-form element inventory).
PRIMARY_XSD_FILENAME_BY_FORM = {
    "8889": "IRS8889.xsd",
    "1040": "IRS1040.xsd",
    "1040s1": "IRS1040Schedule1.xsd",
    "1040s1a": "IRS1040Schedule1A.xsd",
    "1040sc": "IRS1040ScheduleC.xsd",
    "1040sse": "IRS1040ScheduleSE.xsd",
    "1040s2": "IRS1040Schedule2.xsd",
    "4562": "IRS4562.xsd",
    "1040se": "IRS1040ScheduleE.xsd",
    "w2": "IRSW2.xsd",
}


def download_documents(discovered: list[DiscoveredDocument]) -> None:
    for d in discovered:
        log.info("download.fetch", url=d.url, doc_type=d.doc_type)
        resp = requests.get(d.url, headers={"User-Agent": USER_AGENT}, timeout=30)
        resp.raise_for_status()
        doc = store_document(
            source_url=d.url,
            doc_type=d.doc_type,
            form_number=d.form_number,
            tax_year=d.tax_year,
            content=resp.content,
        )
        print(f"stored: {d.doc_type:12} v{doc.version}  {doc.content_hash[:12]}  {d.url}")

    stage_local_xsd_xsl()


def stage_local_xsd_xsl() -> None:
    for rel_path, doc_type, form_number in STAGED_LOCAL_FILES:
        path = INPUT_ROOT / rel_path
        if not path.exists():
            log.warning("download.staged_file_missing", path=str(path))
            continue
        content = path.read_bytes()
        doc = store_document(
            source_url=f"local-staged://{rel_path}",
            doc_type=doc_type,
            form_number=form_number,
            tax_year=2025,
            content=content,
        )
        print(f"staged:  {doc_type:12} v{doc.version}  {doc.content_hash[:12]}  {rel_path}")
