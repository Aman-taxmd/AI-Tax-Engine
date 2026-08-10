"""Deterministic, LLM-free build-time extractor for the IRS Tax Table and Tax
Computation Worksheet (Form 1040 Line 16), parsed straight out of the
already-fetched, versioned i1040gi HTML (`documents` where
form_number='1040', doc_type='instructions' -- the same document
runtime/tax_constants.py already cites for the standard deduction). See the
plan for Form 1040 Lines 16-24: "store generated tax table data in Postgres,
not JSON files" + "deterministic build-time parser, not an LLM".

Two distinct data shapes, both grounded in the SAME document:

1. Tax Table (used when Form 1040 Line 15 < $100,000): a long list of
   $25/$50-wide income brackets, each row giving the exact tax dollar amount
   for all 4 filing-status columns directly -- no arithmetic needed, just a
   lookup. ~2,000 rows/year.

2. Tax Computation Worksheet (used when Line 15 >= $100,000): 4 filing-status
   sections ("Section A" Single, "Section B" MFJ/QSS, "Section C" MFS,
   "Section D" HOH), each a handful of marginal-rate brackets of the form
   "tax = income * rate - subtract_amount".

Both are located by searching the raw HTML for stable, IRS-authored markers
(the `role-taxtable` CSS class IRS's own publishing pipeline attaches to the
Tax Table's heading; the "Section A/B/C/D-Use if your filing status is..."
sentences IRS prints verbatim above each worksheet block) rather than any
year-specific id= anchor (those numeric ids reportedly shift between
revisions), so this should keep working as the underlying HTML is refreshed
for a later tax year.

Idempotent + versioned like every other build phase: a fresh
`TaxDataset` (+ its rows) is only written if the source document's
content_hash or this module's PARSER_VERSION changed since the last active
dataset for that (tax_year, dataset_type); otherwise this is a no-op.
Activating a newly-written dataset and deactivating the previous one for the
same (tax_year, dataset_type) happens in one transaction (see
`_activate_dataset`) so a reader (runtime/tax_lookup.py) never observes zero
or two active datasets at once.
"""
from __future__ import annotations

import re
from dataclasses import dataclass

import structlog
from bs4 import BeautifulSoup
from sqlalchemy import select

from db.models import Document, TaxComputationBracket, TaxDataset, TaxTableRow
from db.session import get_session

log = structlog.get_logger(__name__)

PARSER_VERSION = "1"

_TAX_TABLE_ROW_COUNT_RANGE = (1900, 2200)  # loose sanity bound, not a hardcoded exact count

# Column order in each Tax Table data row, after (at_least, less_than) --
# matches the printed header "Single | Married filing jointly * | Married
# filing sepa-rately | Head of house-hold" verified against the live HTML.
_TAX_TABLE_FILING_STATUS_COLUMNS = [
    "single",
    "married_filing_jointly",
    "married_filing_separately",
    "head_of_household",
]

# Tax Computation Worksheet section letter -> the filing status(es) its
# bracket set applies to (Section B is explicitly shared by MFJ and
# Qualifying Surviving Spouse, mirroring the Tax Table's own "*This column
# must also be used by a qualifying surviving spouse" footnote).
_WORKSHEET_SECTION_FILING_STATUSES = {
    "A": ["single"],
    "B": ["married_filing_jointly", "qualifying_surviving_spouse"],
    "C": ["married_filing_separately"],
    "D": ["head_of_household"],
}

_MONEY_RE = re.compile(r"[\d,]+(?:\.\d+)?")


def _parse_money(text: str) -> float | None:
    m = _MONEY_RE.search(text.replace(",", ""))
    return float(m.group().replace(",", "")) if m else None


@dataclass
class ParsedTaxTable:
    rows: list[dict]  # {"at_least", "less_than", "filing_status", "tax_amount"}


@dataclass
class ParsedTaxComputationWorksheet:
    brackets: list[dict]  # {"filing_status", "bracket_order", "income_at_least", "income_less_than", "rate", "subtract_amount"}


def _tax_table_heading_end(html: str) -> int:
    start_match = re.search(r'<h2[^>]*class="[^"]*role-taxtable[^"]*"[^>]*>.*?Tax Table\s*</h2>', html, re.DOTALL)
    if not start_match:
        raise ValueError("could not locate the Tax Table heading (h2.role-taxtable) in the i1040gi HTML")
    return start_match.end()


def _extract_tax_table_html(html: str) -> str:
    table_start = _tax_table_heading_end(html)
    # The FIRST "Tax Computation Worksheet" mention AFTER the Tax Table
    # heading is the real one (the doc's table-of-contents/index mentions it
    # earlier too, which is why this search must not start from html[0]).
    end_idx = html.find("Tax Computation Worksheet", table_start)
    if end_idx == -1:
        raise ValueError("could not locate the end of the Tax Table section (no 'Tax Computation Worksheet' marker found after it)")
    return html[table_start:end_idx]


def _extract_worksheet_html(html: str) -> str:
    table_start = _tax_table_heading_end(html)
    start_idx = html.find("Tax Computation Worksheet", table_start)
    if start_idx == -1:
        raise ValueError("could not locate 'Tax Computation Worksheet' in the i1040gi HTML")
    end_match = re.search(r'<h2[^>]*class="[^"]*role-major-section[^"]*"', html[start_idx:])
    if not end_match:
        raise ValueError("could not locate the end of the Tax Computation Worksheet section (no h2.role-major-section marker found after it)")
    return html[start_idx:start_idx + end_match.start()]


def parse_tax_table(html: str) -> ParsedTaxTable:
    section_html = _extract_tax_table_html(html)
    soup = BeautifulSoup(section_html, "lxml")

    rows: list[dict] = []
    for tr in soup.find_all("tr"):
        tds = tr.find_all("td", recursive=False)
        if len(tds) != 6:
            continue
        texts = [td.get_text(" ", strip=True) for td in tds]
        if not any(texts):
            continue  # blank separator row between printed table "pages"
        at_least = _parse_money(texts[0])
        less_than = _parse_money(texts[1])
        amounts = [_parse_money(t) for t in texts[2:]]
        if at_least is None or less_than is None or any(a is None for a in amounts):
            continue  # not a genuine data row (e.g. a stray header remnant)
        for filing_status, amount in zip(_TAX_TABLE_FILING_STATUS_COLUMNS, amounts):
            rows.append(
                {
                    "at_least": at_least,
                    "less_than": less_than,
                    "filing_status": filing_status,
                    "tax_amount": amount,
                }
            )
        # Qualifying surviving spouse shares the MFJ column, per the Tax
        # Table's own printed footnote -- duplicated here so the lookup in
        # runtime/tax_lookup.py never needs a filing-status alias table.
        mfj_amount = amounts[_TAX_TABLE_FILING_STATUS_COLUMNS.index("married_filing_jointly")]
        rows.append(
            {
                "at_least": at_least,
                "less_than": less_than,
                "filing_status": "qualifying_surviving_spouse",
                "tax_amount": mfj_amount,
            }
        )

    return ParsedTaxTable(rows=rows)


def _parse_worksheet_section(section_soup: "BeautifulSoup", filing_statuses: list[str]) -> list[dict]:
    brackets: list[dict] = []
    order = 0
    for tr in section_soup.find_all("tr"):
        tds = tr.find_all("td", recursive=False)
        if len(tds) != 6:
            continue
        range_text = tds[0].get_text(" ", strip=True)
        rate_text = tds[2].get_text(" ", strip=True)
        subtract_text = tds[4].get_text(" ", strip=True)

        range_match = re.match(
            r"(?:At least|Over)\s*\$?([\d,]+)(?:\s*but not over\s*\$?([\d,]+))?", range_text
        )
        rate_match = re.search(r"\(([\d.]+)\)", rate_text)  # e.g. "x 22% (0.22)" -> 0.22
        if not range_match or not rate_match:
            continue  # the header row ("Taxable income. If line 15 is-...") or a non-data row

        income_at_least = float(range_match.group(1).replace(",", ""))
        income_less_than = float(range_match.group(2).replace(",", "")) if range_match.group(2) else None
        rate = float(rate_match.group(1))
        subtract_amount = _parse_money(subtract_text)
        if subtract_amount is None:
            continue

        for filing_status in filing_statuses:
            brackets.append(
                {
                    "filing_status": filing_status,
                    "bracket_order": order,
                    "income_at_least": income_at_least,
                    "income_less_than": income_less_than,
                    "rate": rate,
                    "subtract_amount": subtract_amount,
                }
            )
        order += 1
    return brackets


_SECTION_MARKER_RE = re.compile(r"Section ([A-D])\u2014Use if your filing status is")


def parse_tax_computation_worksheet(html: str) -> ParsedTaxComputationWorksheet:
    section_html = _extract_worksheet_html(html)

    # Each section's title sentence is printed TWICE right next to each other
    # (once as a visible <p class="title">, once again as the immediately-
    # following <table summary="...">) -- so for each letter, the SECOND of
    # its two occurrences is the one that actually sits right before the
    # real data table; a naive "up to the next Section marker" scan from the
    # FIRST occurrence would stop almost immediately, at that very duplicate.
    markers_by_letter: dict[str, list[int]] = {}
    for m in _SECTION_MARKER_RE.finditer(section_html):
        markers_by_letter.setdefault(m.group(1), []).append(m.start())

    brackets: list[dict] = []
    for letter, filing_statuses in _WORKSHEET_SECTION_FILING_STATUSES.items():
        starts = markers_by_letter.get(letter)
        if not starts or len(starts) < 2:
            raise ValueError(
                f"could not locate Tax Computation Worksheet Section {letter} in the i1040gi HTML "
                f"(expected 2 occurrences of its title, found {len(starts) if starts else 0})"
            )
        section_start = starts[-1]
        next_marker = _SECTION_MARKER_RE.search(section_html, section_start + 1)
        section_end = next_marker.start() if next_marker else len(section_html)

        section_soup = BeautifulSoup(section_html[section_start:section_end], "lxml")
        section_brackets = _parse_worksheet_section(section_soup, filing_statuses)
        if not section_brackets:
            raise ValueError(f"Tax Computation Worksheet Section {letter} matched but no brackets were parsed from it")
        brackets.extend(section_brackets)

    return ParsedTaxComputationWorksheet(brackets=brackets)


def _validate_tax_table(parsed: ParsedTaxTable, tax_year: int) -> None:
    by_status: dict[str, list[dict]] = {}
    for row in parsed.rows:
        by_status.setdefault(row["filing_status"], []).append(row)

    expected_statuses = set(_TAX_TABLE_FILING_STATUS_COLUMNS) | {"qualifying_surviving_spouse"}
    if set(by_status) != expected_statuses:
        raise ValueError(f"tax table: expected filing statuses {expected_statuses}, got {set(by_status)}")

    for status, rows in by_status.items():
        rows = sorted(rows, key=lambda r: r["at_least"])
        n = len(rows)
        if not (_TAX_TABLE_ROW_COUNT_RANGE[0] <= n <= _TAX_TABLE_ROW_COUNT_RANGE[1]):
            raise ValueError(
                f"tax table ({status}): {n} rows is outside the expected sanity range {_TAX_TABLE_ROW_COUNT_RANGE}"
            )
        if rows[0]["at_least"] != 0:
            raise ValueError(f"tax table ({status}): first bracket must start at 0, got {rows[0]['at_least']}")
        if rows[-1]["less_than"] != 100000:
            raise ValueError(f"tax table ({status}): last bracket must end at 100000, got {rows[-1]['less_than']}")
        prev_less_than = None
        prev_amount = -1.0
        for row in rows:
            if prev_less_than is not None and row["at_least"] != prev_less_than:
                raise ValueError(
                    f"tax table ({status}): gap/overlap between brackets at {prev_less_than} -> {row['at_least']}"
                )
            if row["tax_amount"] < 0:
                raise ValueError(f"tax table ({status}): negative tax amount {row['tax_amount']}")
            if row["tax_amount"] < prev_amount:
                raise ValueError(
                    f"tax table ({status}): tax amount decreased from {prev_amount} to {row['tax_amount']} "
                    f"at bracket [{row['at_least']}, {row['less_than']})"
                )
            prev_less_than = row["less_than"]
            prev_amount = row["tax_amount"]

    if tax_year == 2025:
        # Cross-check against the worked "Example" IRS prints verbatim
        # directly above this same table: "$25,300-25,350 ... married filing
        # jointly ... $2,562."
        mfj_example = next(
            r for r in by_status["married_filing_jointly"] if r["at_least"] == 25300 and r["less_than"] == 25350
        )
        if mfj_example["tax_amount"] != 2562:
            raise ValueError(
                f"tax table 2025 golden check failed: MFJ $25,300-25,350 should be $2,562 per the IRS's own "
                f"worked example, got {mfj_example['tax_amount']}"
            )


def _validate_tax_computation_worksheet(parsed: ParsedTaxComputationWorksheet, tax_year: int) -> None:
    by_status: dict[str, list[dict]] = {}
    for b in parsed.brackets:
        by_status.setdefault(b["filing_status"], []).append(b)

    for status, brackets in by_status.items():
        brackets = sorted(brackets, key=lambda b: b["bracket_order"])
        if brackets[0]["income_at_least"] != 100000:
            raise ValueError(f"tax computation worksheet ({status}): first bracket must start at 100000")
        if brackets[-1]["income_less_than"] is not None:
            raise ValueError(f"tax computation worksheet ({status}): last bracket must be unbounded (Over $X)")
        prev_less_than = None
        prev_rate = -1.0
        for b in brackets:
            if prev_less_than is not None and b["income_at_least"] != prev_less_than:
                raise ValueError(
                    f"tax computation worksheet ({status}): gap/overlap at {prev_less_than} -> {b['income_at_least']}"
                )
            if not (0 < b["rate"] < 1):
                raise ValueError(f"tax computation worksheet ({status}): rate {b['rate']} out of (0,1) range")
            if b["rate"] <= prev_rate:
                raise ValueError(f"tax computation worksheet ({status}): rate did not increase monotonically")
            prev_less_than = b["income_less_than"]
            prev_rate = b["rate"]

    if tax_year == 2025:
        single_100k = next(
            b for b in by_status["single"] if b["bracket_order"] == 0
        )
        if single_100k["rate"] != 0.22 or single_100k["income_less_than"] != 103350:
            raise ValueError(
                "tax computation worksheet 2025 golden check failed: Single's first bracket should be "
                f"[100000, 103350) @ 22%, got [{single_100k['income_at_least']}, {single_100k['income_less_than']}) "
                f"@ {single_100k['rate']}"
            )


def _activate_dataset(
    tax_year: int, dataset_type: str, source_document_id: str, source_content_hash: str, rows: list
) -> str:
    """Writes a new (inactive) TaxDataset + its rows, then atomically flips
    it to active and deactivates whatever was active before, in one
    transaction -- a reader never observes zero or two active datasets."""
    with get_session() as session:
        existing_active = session.execute(
            select(TaxDataset).where(
                TaxDataset.tax_year == tax_year,
                TaxDataset.dataset_type == dataset_type,
                TaxDataset.is_active.is_(True),
            )
        ).scalars().first()
        if (
            existing_active is not None
            and existing_active.source_content_hash == source_content_hash
            and existing_active.parser_version == PARSER_VERSION
        ):
            return "unchanged"  # source document + parser both identical to what's already active

        dataset = TaxDataset(
            tax_year=tax_year,
            dataset_type=dataset_type,
            source_document_id=source_document_id,
            source_content_hash=source_content_hash,
            parser_version=PARSER_VERSION,
            row_count=len(rows),
            is_active=False,
        )
        session.add(dataset)
        session.flush()

        for row in rows:
            session.add(row(dataset_id=dataset.id))

        if existing_active is not None:
            existing_active.is_active = False
        dataset.is_active = True
        session.commit()
        return "created"


def run_tax_table_extraction(tax_year: int) -> None:
    with get_session() as session:
        doc = session.execute(
            select(Document)
            .where(
                Document.form_number == "1040",
                Document.doc_type == "instructions",
                Document.tax_year == tax_year,
                Document.superseded_by.is_(None),
            )
        ).scalars().first()
        if doc is None:
            print(f"tax table extraction: no catalogued i1040gi instructions document for tax_year={tax_year}")
            return
        document_id, content_hash, storage_path = doc.id, doc.content_hash, doc.storage_path

    html = open(storage_path, encoding="utf-8", errors="ignore").read()

    parsed_table = parse_tax_table(html)
    _validate_tax_table(parsed_table, tax_year)
    table_result = _activate_dataset(
        tax_year,
        "tax_table",
        document_id,
        content_hash,
        [
            lambda dataset_id, r=r: TaxTableRow(
                dataset_id=dataset_id, filing_status=r["filing_status"],
                at_least=r["at_least"], less_than=r["less_than"], tax_amount=r["tax_amount"],
            )
            for r in parsed_table.rows
        ],
    )

    parsed_worksheet = parse_tax_computation_worksheet(html)
    _validate_tax_computation_worksheet(parsed_worksheet, tax_year)
    worksheet_result = _activate_dataset(
        tax_year,
        "tax_computation_brackets",
        document_id,
        content_hash,
        [
            lambda dataset_id, b=b: TaxComputationBracket(
                dataset_id=dataset_id, filing_status=b["filing_status"], bracket_order=b["bracket_order"],
                income_at_least=b["income_at_least"], income_less_than=b["income_less_than"],
                rate=b["rate"], subtract_amount=b["subtract_amount"],
            )
            for b in parsed_worksheet.brackets
        ],
    )

    print(
        f"tax table extraction complete (tax_year={tax_year}): "
        f"tax_table {table_result} ({len(parsed_table.rows)} rows), "
        f"tax_computation_brackets {worksheet_result} ({len(parsed_worksheet.brackets)} brackets)"
    )


def check_tax_table_extraction(tax_year: int) -> bool:
    """CI-ready verification: re-parses + re-validates from the currently
    catalogued source document WITHOUT writing to the database. Returns True
    (and prints a summary) if extraction + all structural/golden checks pass,
    False otherwise -- see `python -m build.cli extract-tax-table --check`."""
    with get_session() as session:
        doc = session.execute(
            select(Document)
            .where(
                Document.form_number == "1040",
                Document.doc_type == "instructions",
                Document.tax_year == tax_year,
                Document.superseded_by.is_(None),
            )
        ).scalars().first()
        if doc is None:
            print(f"CHECK FAILED: no catalogued i1040gi instructions document for tax_year={tax_year}")
            return False
        storage_path = doc.storage_path

    html = open(storage_path, encoding="utf-8", errors="ignore").read()
    try:
        parsed_table = parse_tax_table(html)
        _validate_tax_table(parsed_table, tax_year)
        parsed_worksheet = parse_tax_computation_worksheet(html)
        _validate_tax_computation_worksheet(parsed_worksheet, tax_year)
    except ValueError as exc:
        print(f"CHECK FAILED (tax_year={tax_year}): {exc}")
        return False

    print(
        f"CHECK PASSED (tax_year={tax_year}): tax_table {len(parsed_table.rows)} rows, "
        f"tax_computation_brackets {len(parsed_worksheet.brackets)} brackets, all structural + golden checks OK"
    )
    return True
