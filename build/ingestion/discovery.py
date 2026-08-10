"""Discovery Agent (Phase 1).

Deterministic, no LLM. Starts only from the "About Form"/"About Publication"
pages listed as `entry_points` in the seed catalog (build/sources/catalog/).
From each entry point it follows only:
  - links inside the "Current revision" section (the form's own instructions/
    form PDF), and
  - links inside the "Other items you may find useful" section (related
    publications).

All followed links are restricted to the irs.gov domain. A discovered link is
only promoted into the download set if its classified doc_type is listed in
the catalog's `include_doc_types`; everything else is recorded as
"discovered but out of scope" for auditability (ADR 0002/0003 — nothing
silently disappears, it's just not downloaded).
"""
from __future__ import annotations

import re
from dataclasses import dataclass
from pathlib import Path
from urllib.parse import urljoin, urlparse

import requests
import structlog
import yaml
from bs4 import BeautifulSoup

log = structlog.get_logger(__name__)

ALLOWED_DOMAIN = "www.irs.gov"
USER_AGENT = "AI-Tax-Engine-Pilot/0.1 (+deterministic IRS ingestion; contact: local pilot)"
CATALOG_DIR = Path(__file__).resolve().parent.parent / "sources" / "catalog"

_SECTIONS_TO_FOLLOW = ("Current revision", "Other items you may find useful")


@dataclass(frozen=True)
class DiscoveredDocument:
    url: str
    doc_type: str  # instructions | publication | form (pdf)
    form_number: str
    tax_year: int
    label: str
    in_scope: bool
    reason: str


def load_catalog(form: str) -> dict:
    path = CATALOG_DIR / f"form_{form}.yaml"
    if not path.exists():
        raise FileNotFoundError(f"No seed catalog for form {form} at {path}")
    return yaml.safe_load(path.read_text())


def classify_doc_type(url: str) -> str | None:
    parsed = urlparse(url)
    path = parsed.path.lower()
    if path.startswith("/instructions/"):
        return "instructions"
    if path.startswith("/publications/"):
        return "publication"
    if path.startswith("/pub/irs-pdf/f") and path.endswith(".pdf"):
        return "form"
    if path.startswith("/pub/irs-pdf/i") and path.endswith(".pdf"):
        # The HTML page at /instructions/<id> carries the same content with
        # native headings/anchors we can structurally parse (Phase 2); the
        # PDF duplicate is skipped rather than downloaded (no PDF parser in
        # this pilot, see plan ADR on structural parsing preferring HTML).
        return None
    return None


def _fetch(url: str) -> str:
    resp = requests.get(url, headers={"User-Agent": USER_AGENT}, timeout=20)
    resp.raise_for_status()
    return resp.text


def _links_in_section(soup: BeautifulSoup, heading_text: str, base_url: str) -> list[tuple[str, str]]:
    """Return (label, absolute_url) pairs found in the DOM section following a
    given <h2>/<h3> heading, up to (but not including) the next heading.

    Matches case-insensitively: confirmed IRS "About" pages are NOT
    consistent about heading case for the same logical section — e.g. About
    Schedule C uses "Current revision" / "Other items you may find useful"
    (sentence case) while About Schedule SE uses "Current Revision" / "Other
    Items You May Find Useful" (title case) for the exact same section."""
    heading = soup.find(
        lambda tag: tag.name in ("h2", "h3") and tag.get_text(strip=True).lower() == heading_text.lower()
    )
    if heading is None:
        return []
    out: list[tuple[str, str]] = []
    sib = heading.find_next_sibling()
    seen_headings = 0
    while sib is not None and seen_headings < 3:
        if sib.name in ("h2", "h3"):
            break
        for a in sib.find_all("a", href=True):
            label = a.get_text(strip=True)
            abs_url = urljoin(base_url, a["href"])
            out.append((label, abs_url))
        sib = sib.find_next_sibling()
        seen_headings += 1
    return out


_DOC_ID_PATTERNS = (
    re.compile(r"/publications/p([\w-]+)"),
    re.compile(r"/pub/irs-pdf/[fi]([\w-]+)\.pdf"),
    re.compile(r"/instructions/i([\w-]+)"),
)


def _extract_doc_id(path: str) -> str | None:
    """Normalize a URL path to a bare catalog-comparable id, e.g.
    '/pub/irs-pdf/f1040s1.pdf' -> '1040s1', '/instructions/i1040tt' -> '1040tt',
    '/publications/p502' -> '502'. Used by `excluded_doc_ids` so a single
    catalog key can exclude publications, forms, or instructions alike."""
    for pattern in _DOC_ID_PATTERNS:
        m = pattern.search(path)
        if m:
            return m.group(1)
    return None


def discover(form: str) -> list[DiscoveredDocument]:
    catalog = load_catalog(form)
    form_number = catalog["form_number"]
    tax_year = catalog["tax_year"]
    include_doc_types = set(catalog.get("include_doc_types", []))
    # `excluded_publications` is the original (narrower) key name, kept for
    # backward compatibility with form_8889.yaml; `excluded_doc_ids` is the
    # general form covering forms/schedules/instructions too (see form_1040.yaml,
    # which needs to exclude sibling schedules discovered from the same
    # "About Form 1040" page, e.g. Form 1040-SR, Schedule 2, Schedule 3).
    excluded_doc_ids = {
        d.lower() for d in [*catalog.get("excluded_publications", []), *catalog.get("excluded_doc_ids", [])]
    }

    discovered: list[DiscoveredDocument] = []
    seen_urls: set[str] = set()

    for entry in catalog["entry_points"]:
        about_url = entry["url"]
        log.info("discovery.fetch_entry_point", url=about_url, role=entry["role"])
        html = _fetch(about_url)
        soup = BeautifulSoup(html, "lxml")

        for section_name in _SECTIONS_TO_FOLLOW:
            for label, link in _links_in_section(soup, section_name, about_url):
                parsed = urlparse(link)
                if parsed.netloc and parsed.netloc != ALLOWED_DOMAIN:
                    continue  # domain-restricted: never leave irs.gov
                if link in seen_urls:
                    continue
                seen_urls.add(link)

                doc_type = classify_doc_type(link)
                if doc_type is None:
                    continue  # not a document link (e.g. nav, "about-publication-*" landing page)

                doc_id = _extract_doc_id(parsed.path.lower())
                if doc_id and doc_id in excluded_doc_ids:
                    discovered.append(
                        DiscoveredDocument(
                            url=link, doc_type=doc_type, form_number=form_number,
                            tax_year=tax_year, label=label, in_scope=False,
                            reason="excluded_doc_ids",
                        )
                    )
                    continue

                # A "form" (PDF) link discovered from a parent catalog's About
                # page can belong to a *different* form identity than the
                # catalog itself -- e.g. form_1040.yaml's About Form 1040 page
                # links both f1040.pdf ("1040") and f1040s1.pdf ("1040s1").
                # Without this, both PDFs would be stored under form_number
                # "1040" and become indistinguishable to anything that later
                # queries Document by form_number (e.g. the PDF field mapper).
                # Only doc_type "form" gets this override; instructions/
                # publications intentionally keep the catalog's form_number.
                link_form_number = doc_id if (doc_type == "form" and doc_id) else form_number

                in_scope = doc_type in include_doc_types
                discovered.append(
                    DiscoveredDocument(
                        url=link, doc_type=doc_type, form_number=link_form_number,
                        tax_year=tax_year, label=label, in_scope=in_scope,
                        reason="ok" if in_scope else f"doc_type '{doc_type}' not in include_doc_types",
                    )
                )

    log.info(
        "discovery.complete",
        form=form_number,
        total_discovered=len(discovered),
        in_scope=sum(1 for d in discovered if d.in_scope),
    )
    return discovered


def run_discovery(form: str) -> None:
    from build.ingestion.download import download_documents

    discovered = discover(form)
    for d in discovered:
        marker = "IN-SCOPE" if d.in_scope else f"skip ({d.reason})"
        print(f"[{marker:28}] {d.doc_type:12} {d.label[:50]:50} {d.url}")

    in_scope = [d for d in discovered if d.in_scope]
    download_documents(in_scope)
