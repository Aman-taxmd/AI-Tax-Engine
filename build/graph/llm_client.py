"""LLM client abstraction for the extractor node (Phase 4).

Tries a real model (AWS Bedrock Claude Sonnet 4.5, invoked the same way as
TaxMD-TaxCore's intent classifier — see apps/ai_chatbot/intent_classification/
intent_classifier.py and utils/aws.py in that repo) first. If no credentials
are configured, or the call fails for any reason, falls back to a
deterministic stub extractor so the pipeline remains fully runnable
end-to-end in an environment without LLM credentials — this pilot was built
in exactly such an environment. The stub is clearly labeled
(`model_version="stub-deterministic-v1"`) everywhere it's recorded (evidence
bundles, confidence breakdowns) so nobody mistakes a stub extraction for a
reviewed, LLM-assisted one; ADR 0003 requires every evidence bundle to carry
its real model version for exactly this reason.

Wiring real credentials requires no code changes — set AWS_ACCESS_KEY_ID /
AWS_SECRET_ACCESS_KEY in .env (or leave them blank to use the default boto3
credential chain: env vars → ~/.aws/credentials → IAM role) and ensure the
target account has Bedrock model access enabled for BEDROCK_MODEL_ID.
"""
from __future__ import annotations

import json
import os
import re
from dataclasses import dataclass
from pathlib import Path

import structlog
from dotenv import load_dotenv

log = structlog.get_logger(__name__)

load_dotenv(Path(__file__).resolve().parent.parent.parent / ".env")

_JSON_FENCE_RE = re.compile(r"```(?:json)?\s*([\s\S]*?)\s*```")


def _parse_json_response(text: str) -> dict:
    """Claude routinely wraps JSON responses in a ```json ... ``` markdown
    fence even when the system prompt says "return ONLY JSON" — strip that
    before parsing rather than letting json.loads() fail on the fence
    markers (which would silently look like "the API call failed" to
    callers that catch-and-fall-back-to-stub, masking a working LLM call as
    a missing-credentials situation)."""
    try:
        return json.loads(text)
    except json.JSONDecodeError:
        pass
    m = _JSON_FENCE_RE.search(text)
    if m:
        return json.loads(m.group(1))
    raise ValueError(f"could not parse JSON from LLM response: {text[:200]!r}")


BEDROCK_MODEL_ID = os.environ.get("BEDROCK_MODEL_ID", "us.anthropic.claude-sonnet-4-5-20250929-v1:0")
BEDROCK_REGION = os.environ.get("AWS_BEDROCK_REGION_NAME", "us-east-1")
BEDROCK_MAX_TOKENS = int(os.environ.get("BEDROCK_MAX_TOKENS", "4096"))
# PDF field mapping answers for the WHOLE form in one call (one JSON object
# per required field, each carrying a reasoning string) rather than one
# quote at a time like every other call site -- a form with 30-40 in-scope
# fields (e.g. Schedule C) can genuinely need more than the general default,
# and a silently-truncated JSON response was observed failing to parse
# entirely (zero mappings) rather than partially succeeding.
BEDROCK_PDF_MAPPING_MAX_TOKENS = int(os.environ.get("BEDROCK_PDF_MAPPING_MAX_TOKENS", "8192"))
BEDROCK_TEMPERATURE = float(os.environ.get("BEDROCK_TEMPERATURE", "0.0"))
PROMPT_VERSION = "extract_knowledge_packet_v2"
JUDGE_PROMPT_VERSION = "grounding_judge_v2"
STUB_MODEL_VERSION = "stub-deterministic-v1"

EXTRACTION_SYSTEM_PROMPT = """You are extracting tax-rule knowledge from ONE scoped excerpt of official \
IRS instructions. You will be given the primary text for a specific form line, plus a small number of \
explicitly resolved reference excerpts (definitions/exceptions/worksheets it points to).

Rules:
- Only use the provided text. Never use outside knowledge of tax law.
- Produce `core_text`: a faithful, complete restatement of the computational rule/definition for this line. \
This one field may paraphrase/summarize for clarity.
- Produce `exceptions`: a list of {text, citation} for every exception/special-case mentioned. Unlike \
core_text, `text` MUST be copied VERBATIM (exact character-for-character substring) from the provided excerpt \
— do not paraphrase, reword, fix punctuation, or combine sentences. A later automated check verifies each \
exception's text is an exact substring of the excerpt you were given; a paraphrased exception will fail that \
check and be sent to human review, so quote precisely. If no excerpt sentence cleanly states an exception, \
omit it rather than approximating one.
- Set needs_more_context=true ONLY if the rule is impossible to state correctly without a specific missing \
definition/threshold/table that is NOT in the provided reference excerpts — not merely because a topic is \
*mentioned* in passing. Most lines can be fully and correctly stated from the primary text alone; leave this \
false unless a number, definition, or condition the FORMULA on this line actually depends on is missing.
- Return ONLY JSON matching: {"core_text": str, "exceptions": [{"text": str, "citation": str|null}], \
"needs_more_context": bool, "requested_topic": str|null}
"""


@dataclass
class ExtractionResult:
    core_text: str
    exceptions: list[dict]
    needs_more_context: bool
    requested_topic: str | None
    model_version: str
    raw_response: str
    extraction_confidence: float


def extract(scoped_context: str, irs_line: str) -> ExtractionResult:
    bedrock_result = _try_bedrock(scoped_context, irs_line)
    if bedrock_result is not None:
        return bedrock_result
    return _stub_extract(scoped_context, irs_line)


def extract_with_feedback(scoped_context: str, irs_line: str, feedback: str) -> ExtractionResult:
    """Re-invokes extraction with a human reviewer's note injected into the
    prompt (the "Retry with feedback" action in the Human Review Queue UI).

    Falls back to the plain deterministic stub if no LLM credentials are
    configured — the stub can't act on feedback (it doesn't reason at all),
    but it must still return *something* so the pipeline stays runnable
    end-to-end without credentials, same as extract()."""
    bedrock_result = _try_bedrock(scoped_context, irs_line, feedback=feedback)
    if bedrock_result is not None:
        return bedrock_result
    return _stub_extract(scoped_context, irs_line)


def _bedrock_client():
    """Build a bedrock-runtime client the same way TaxMD-TaxCore's
    get_bedrock_client_intent_local() does: explicit keys from env when
    present, otherwise boto3's default credential chain (env → ~/.aws → IAM
    role) — no STS AssumeRole for local/dev use."""
    import boto3

    kwargs: dict = {"region_name": BEDROCK_REGION}
    access_key = os.environ.get("AWS_ACCESS_KEY_ID")
    secret_key = os.environ.get("AWS_SECRET_ACCESS_KEY")
    session_token = os.environ.get("AWS_SESSION_TOKEN")
    if access_key:
        kwargs["aws_access_key_id"] = access_key
    if secret_key:
        kwargs["aws_secret_access_key"] = secret_key
    if session_token:
        # Required alongside access_key/secret_key whenever the key is a
        # temporary credential (AWS_ACCESS_KEY_ID starting with "ASIA", e.g.
        # from AWS SSO / STS AssumeRole) — permanent IAM user keys ("AKIA...")
        # don't need this.
        kwargs["aws_session_token"] = session_token
    return boto3.Session(**kwargs).client("bedrock-runtime")


def _try_bedrock(scoped_context: str, irs_line: str, feedback: str | None = None) -> ExtractionResult | None:
    try:
        client = _bedrock_client()
        user_content = f"IRS Line: {irs_line}\n\nScoped excerpt:\n{scoped_context}"
        if feedback:
            user_content += (
                f"\n\nA human reviewer rejected a previous extraction attempt for this line with this "
                f"feedback — address it directly in your revised extraction:\n{feedback}"
            )
        body = {
            "anthropic_version": "bedrock-2023-05-31",
            "max_tokens": BEDROCK_MAX_TOKENS,
            "temperature": BEDROCK_TEMPERATURE,
            "system": EXTRACTION_SYSTEM_PROMPT,
            "messages": [{"role": "user", "content": user_content}],
        }
        response = client.invoke_model(modelId=BEDROCK_MODEL_ID, body=json.dumps(body))
        payload = json.loads(response["body"].read())
        text = payload["content"][0]["text"]
        parsed = _parse_json_response(text)
        return ExtractionResult(
            core_text=parsed["core_text"],
            exceptions=parsed.get("exceptions", []),
            needs_more_context=parsed.get("needs_more_context", False),
            requested_topic=parsed.get("requested_topic"),
            model_version=BEDROCK_MODEL_ID,
            raw_response=text,
            extraction_confidence=0.9,
        )
    except Exception as e:
        # Falls back to the stub extractor below — but log loudly, since a
        # silently-swallowed exception here looks identical to "no
        # credentials configured" and previously masked a real bug (Claude's
        # markdown-fenced JSON failing a naive json.loads()).
        log.warning("llm_client.bedrock_extract_failed", error=repr(e))
        return None


_SENTENCE_SPLIT = re.compile(r"(?<=[.!?])\s+")


def _stub_extract(scoped_context: str, irs_line: str) -> ExtractionResult:
    """Deterministic fallback: the primary section's text IS the core_text
    (maximally grounded — it's an exact quote, not a paraphrase), and any
    unresolved same-document topic mentions become a `needs_more_context`
    request so the cross-ref resolver loop has something real to do even
    without an LLM driving it."""
    primary_text = scoped_context.split("\n\n---\n\n")[0]
    sentences = [s.strip() for s in _SENTENCE_SPLIT.split(primary_text) if s.strip()]

    exceptions = [
        {"text": s, "citation": None}
        for s in sentences
        if re.search(r"\b(except|unless|however|does not apply|special rule)\b", s, re.IGNORECASE)
    ]

    unresolved_topic = None
    m = re.search(r"\bSee\s+([A-Z][A-Za-z0-9 '\-]{3,40}?)\s*,\s*(?:earlier|later)\b", primary_text)
    if m:
        reference_blocks = scoped_context.split("\n\n---\n\n")[1:]  # excludes the primary block itself
        already_covered = any(m.group(1) in block for block in reference_blocks)
        if not already_covered:
            unresolved_topic = m.group(1).strip()

    return ExtractionResult(
        core_text=primary_text,
        exceptions=exceptions,
        needs_more_context=unresolved_topic is not None,
        requested_topic=unresolved_topic,
        model_version=STUB_MODEL_VERSION,
        raw_response=json.dumps(
            {"note": "deterministic stub — no LLM credentials configured", "irs_line": irs_line}
        ),
        extraction_confidence=0.55,
    )


# ---------------------------------------------------------------------------
# Phase 8: LLM-as-judge grounding check.
#
# This is deliberately a SEPARATE model call from extract() above, made at a
# different phase (evaluation, not extraction) — the point (per the original
# architecture discussion) is that a rule shouldn't just be trusted because
# the model that produced it says so. A second, independent pass re-reads
# the *synthesized* rule (formula + operands) against the *original* IRS
# quote it cites and judges whether the rule is actually a faithful,
# complete restatement of that quote — a different question than "extract
# the rule" and one the extractor itself has no way to self-check.
# ---------------------------------------------------------------------------

JUDGE_SYSTEM_PROMPT = """You are auditing a synthesized tax calculation rule against the exact IRS \
instruction text it claims to be derived from. You did NOT write this rule — your job is purely to check it.

You will be given:
- The IRS source quote (verbatim text from an official IRS document).
- The synthesized rule: a formula type, its operands (with descriptions), and any conditions.

Judge strictly on whether the rule is a faithful, complete, and correct restatement of what the quote says —
not on general tax knowledge, and not on anything outside the quote. Look specifically for:
- Wrong formula type (e.g. the quote says "smaller of" but the rule sums).
- Wrong or missing operands (the rule references a line/field the quote doesn't mention, or omits one it does).
- Missed conditions or exceptions stated in the quote but absent from the rule.
- A rule that is directionally right but imprecise (e.g. right operands, wrong operation).

If NOT grounded, also classify the most likely root cause as `likely_cause`:
- "formula_construction": the quote itself is clear and sufficient, but the formula/operands/conditions
  built from it are wrong (e.g. wrong operation, an excluded line was summed anyway, a real operand is
  missing even though the quote supports it). This is by far the most common cause — fixable by re-deciding
  the formula from the SAME quote.
- "extraction_incomplete": the quote itself is incomplete, truncated mid-sentence, missing an exception that
  would change the formula, or otherwise not a sufficient/faithful basis to build ANY correct rule from —
  fixable only by re-extracting the underlying quote, not by re-deciding the formula.
- "unclear": you cannot confidently tell which of the above applies.
If grounded=true, set likely_cause to null.

Return ONLY JSON matching exactly:
{"grounded": bool, "confidence": float (0.0-1.0), "issues": [str, ...], \
"likely_cause": "formula_construction"|"extraction_incomplete"|"unclear"|null}

"grounded" is true only if the rule has no material discrepancy from the quote. List every discrepancy found
in "issues" (empty list if none). Be skeptical — if the quote doesn't clearly support the rule, say so.
"""


@dataclass
class GroundingJudgment:
    grounded: bool
    confidence: float
    issues: list[str]
    model_version: str
    raw_response: str
    likely_cause: str | None = None


def judge_grounding(*, quote: str, formula: dict, operands: list[dict]) -> GroundingJudgment:
    bedrock_result = _try_bedrock_judge(quote=quote, formula=formula, operands=operands)
    if bedrock_result is not None:
        return bedrock_result
    return _stub_judge(quote=quote, formula=formula, operands=operands)


def _try_bedrock_judge(*, quote: str, formula: dict, operands: list[dict]) -> GroundingJudgment | None:
    try:
        client = _bedrock_client()
        user_content = (
            f"IRS source quote:\n{quote}\n\n"
            f"Synthesized rule:\n"
            f"formula = {json.dumps(formula)}\n"
            f"operands = {json.dumps(operands)}"
        )
        body = {
            "anthropic_version": "bedrock-2023-05-31",
            "max_tokens": 1024,
            "temperature": 0.0,
            "system": JUDGE_SYSTEM_PROMPT,
            "messages": [{"role": "user", "content": user_content}],
        }
        response = client.invoke_model(modelId=BEDROCK_MODEL_ID, body=json.dumps(body))
        payload = json.loads(response["body"].read())
        text = payload["content"][0]["text"]
        parsed = _parse_json_response(text)
        return GroundingJudgment(
            grounded=bool(parsed["grounded"]),
            confidence=float(parsed.get("confidence", 0.5)),
            issues=list(parsed.get("issues", [])),
            model_version=BEDROCK_MODEL_ID,
            raw_response=text,
            likely_cause=parsed.get("likely_cause"),
        )
    except Exception as e:
        log.warning("llm_client.bedrock_judge_failed", error=repr(e))
        return None


REVIEW_PROMPT_VERSION = "return_review_v1"

# ---------------------------------------------------------------------------
# On-demand "CPA review" of a computed return — see
# docs/adr/0007-runtime-review-is-advisory-only.md. This is a THIRD,
# independent LLM call site (distinct from extract() and judge_grounding()
# above), invoked only when the taxpayer/reviewer clicks "Review my return"
# in the UI — never by runtime/engine.py itself, and never in a way that can
# change a computed number. It reasons about plausibility in plain language
# (e.g. "a $9,500 family HSA contribution exceeds the statutory limit"),
# which is a different question from judge_grounding()'s "does this rule
# faithfully restate its IRS quote" — this call cross-references that
# grounding result but doesn't repeat the work.
# ---------------------------------------------------------------------------

REVIEW_SYSTEM_PROMPT = """You are a CPA doing a final, plain-language sanity check on a taxpayer's computed \
HSA deduction chain (Form 8889 -> Schedule 1 -> Form 1040) before they file. You are NOT re-deriving the \
numbers — a deterministic engine already computed them from IRS-grounded rules. Your job is narrower and \
different: does the result look right to an experienced human preparer?

You will be given a list of fields, each with: its form/line, description, the taxpayer's answer or computed \
value, its status (ok/missing_input/blocked/error), the calc rule's review status (candidate/validated/\
production), its exact IRS quote, and — if it already went through an automated grounding check — that \
check's result (pass/fail/warn) and issues.

Look for:
- Implausible amounts (e.g. a contribution well above the statutory limit for the stated coverage type/age).
- Inputs that don't correspond to anything realistic (e.g. a negative amount on a line that can't be negative).
- Any field whose status is "blocked"/"error", or whose grounding result is "fail"/"warn" — surface these \
plainly so the taxpayer understands their number may not be reliable yet, referencing the existing grounding \
issues rather than re-analyzing the rule yourself.
- Internal inconsistency across fields (e.g. an answer that implies family coverage while another field was \
answered as if coverage were self-only).

Return ONLY JSON matching exactly:
{"findings": [{"severity": "info"|"warning"|"error", "plain_language": str, "technical_note": str, \
"related_field": str|null}]}

"plain_language" is what the taxpayer reads — short, concrete, no jargon. "technical_note" is for the human \
reviewer — reference the specific rule_id/grounding issue when applicable. If nothing looks wrong, return a \
single "info" finding saying so. Never invent a statutory number not given to you in the field list.
"""


@dataclass
class ReviewFinding:
    severity: str  # info | warning | error
    plain_language: str
    technical_note: str
    related_field: str | None


@dataclass
class ReviewResult:
    findings: list[ReviewFinding]
    model_version: str
    prompt_version: str
    raw_response: str


def review_return(field_summaries: list[dict]) -> ReviewResult:
    """Advisory-only "CPA review" of an already-computed return.

    `field_summaries`: one dict per field in the modeled HSA chain, e.g.
    {"field_name": str, "form": str, "line": str|None, "description": str,
     "value": Any, "status": str, "rule_status": str|None,
     "irs_quote": str|None, "grounding_result": str|None,
     "grounding_issues": list[str]}.

    Never writes to `computed_values` — purely returns findings for display.
    See persist_review_finding() for the separate, explicit audit-log write.
    """
    bedrock_result = _try_bedrock_review(field_summaries)
    if bedrock_result is not None:
        return bedrock_result
    return _stub_review(field_summaries)


def _try_bedrock_review(field_summaries: list[dict]) -> ReviewResult | None:
    try:
        client = _bedrock_client()
        body = {
            "anthropic_version": "bedrock-2023-05-31",
            "max_tokens": BEDROCK_MAX_TOKENS,
            "temperature": 0.0,
            "system": REVIEW_SYSTEM_PROMPT,
            "messages": [
                {"role": "user", "content": f"Computed HSA return fields:\n{json.dumps(field_summaries, indent=2, default=str)}"}
            ],
        }
        response = client.invoke_model(modelId=BEDROCK_MODEL_ID, body=json.dumps(body))
        payload = json.loads(response["body"].read())
        text = payload["content"][0]["text"]
        parsed = _parse_json_response(text)
        findings = [
            ReviewFinding(
                severity=f.get("severity", "info"),
                plain_language=f.get("plain_language", ""),
                technical_note=f.get("technical_note", ""),
                related_field=f.get("related_field"),
            )
            for f in parsed.get("findings", [])
        ]
        return ReviewResult(
            findings=findings, model_version=BEDROCK_MODEL_ID, prompt_version=REVIEW_PROMPT_VERSION, raw_response=text
        )
    except Exception as e:
        log.warning("llm_client.bedrock_review_failed", error=repr(e))
        return None


def _stub_review(field_summaries: list[dict]) -> ReviewResult:
    """Deterministic fallback when no LLM credentials are configured: surface
    exactly what's mechanically checkable without an LLM (a field that's
    blocked/errored, or whose calc rule already failed/warned Phase 8's
    grounding check) rather than fabricating a plausibility opinion."""
    findings: list[ReviewFinding] = []
    for f in field_summaries:
        if f.get("status") in ("blocked", "error"):
            findings.append(ReviewFinding(
                severity="warning",
                plain_language=(
                    f"{f.get('form', '')} Line {f.get('line', '')} ({f.get('description', f.get('field_name'))}) "
                    "could not be computed yet — its value is not reliable until this is resolved."
                ),
                technical_note=f"field={f.get('field_name')} status={f.get('status')}",
                related_field=f.get("field_name"),
            ))
        elif f.get("grounding_result") in ("fail", "warn"):
            findings.append(ReviewFinding(
                severity="warning" if f.get("grounding_result") == "fail" else "info",
                plain_language=(
                    f"{f.get('form', '')} Line {f.get('line', '')} ({f.get('description', f.get('field_name'))}) "
                    "is computed by a rule that an automated grounding check already flagged — treat this "
                    "number with caution until a reviewer confirms it."
                ),
                technical_note=f"grounding_result={f.get('grounding_result')} issues={f.get('grounding_issues')}",
                related_field=f.get("field_name"),
            ))
    if not findings:
        findings.append(ReviewFinding(
            severity="info",
            plain_language="No LLM credentials configured — this is a deterministic placeholder check, not a full CPA review.",
            technical_note="stub review: no mechanically-detectable issues found (blocked/errored/flagged fields only)",
            related_field=None,
        ))
    return ReviewResult(
        findings=findings,
        model_version=STUB_MODEL_VERSION,
        prompt_version=REVIEW_PROMPT_VERSION,
        raw_response=json.dumps({"note": "deterministic stub review"}),
    )


def persist_review_finding(*, form_chain: str, computed_snapshot: dict, result: ReviewResult) -> str:
    """Logs one on-demand review run to `runtime_review_findings` for audit
    and future quality analysis (see docs/adr/0007) — the taxpayer's raw
    answers are never persisted, only this outcome."""
    from db.models import RuntimeReviewFinding
    from db.session import get_session

    with get_session() as session:
        row = RuntimeReviewFinding(
            form_chain=form_chain,
            computed_snapshot=computed_snapshot,
            findings=[
                {
                    "severity": f.severity,
                    "plain_language": f.plain_language,
                    "technical_note": f.technical_note,
                    "related_field": f.related_field,
                }
                for f in result.findings
            ],
            model_version=result.model_version,
            prompt_version=result.prompt_version,
        )
        session.add(row)
        session.commit()
        return row.id


# ---------------------------------------------------------------------------
# Calc Rule Agent (Phase 6/7 replacement) — see docs/adr/0008.
#
# Replaces the old regex-based dependency-edge detection (Phase 6) + verb-
# keyword formula classification (Phase 7). Both were deterministic and
# had no way to recognize negation ("do not include line 9") vs a real
# composition ("add line 9"), silently dropped operands whose line number
# didn't have an exact-match Section (e.g. worksheet-only lines), and
# defaulted to a bare "sum" guess whenever no known verb matched. This is a
# fourth, independent LLM call site (distinct from extract(), judge_grounding(),
# review_return()) — one call per canonical field, scoped to that field's
# exact IRS quote plus the REAL list of other canonical fields on the same
# form (so it can never invent a field name that doesn't exist).
# ---------------------------------------------------------------------------

CALC_RULE_PROMPT_VERSION = "calc_rule_agent_v1"

CALC_RULE_SYSTEM_PROMPT = """You are deciding how ONE line of an IRS tax form is calculated, from its exact \
instruction text. You will be given: the line's quote, and a list of every OTHER canonical field already \
known to exist on this form (its field_name, line number, and description) — these are the ONLY valid \
operand choices.

First decide: is this line a PURE INPUT (the taxpayer or a W-2/1099 reports a number directly onto it — \
phrases like "Line N reports...", "enter the amount from your W-2", "enter the total contributions you \
made") with NO formula, or is it COMPUTED from other lines? Most lines that merely describe or define what \
belongs on them, without an arithmetic instruction (add/subtract/multiply/divide/compare), are pure input.

If COMPUTED:
- Choose operand field_names ONLY from the provided candidate list. Never invent a field name. If the line \
you need isn't in the candidate list, omit it rather than guessing a name.
- Watch carefully for EXCLUSION / NEGATION language: "do not include X", "not included", "excluding", \
"other than" — a line mentioned in that context is explicitly NOT an operand to sum; it is describing what \
is left OUT. Do not add it as an operand just because its line number is mentioned nearby.
- Map the actual arithmetic verb to formula_type: "smaller of / lesser of" -> min, "larger of / greater of" \
-> max, "subtract A from B" -> subtract (operand order: [B, A] so B - A), "multiply" -> multiply, "divide" -> \
divide, "add / total of / combine" -> sum.
- If you cannot find a specific, real formula_type = "sum" and confidence >= 0.6 is not a safe default: if \
you are unsure, prefer a lower confidence and explain why in `reasoning` rather than silently guessing \
"sum".
- Capture every exception/special case explicitly stated in the quote as {"trigger_quote": exact substring \
of the quote, "reason_if_true": str, "reason_if_false": str}.
- Set carryover_target to the exact cross-form line named in the quote (e.g. "Schedule 1 (Form 1040), line \
13"), only if one is explicitly named; otherwise null.

Return ONLY JSON matching exactly:
{"is_pure_input": bool, "formula_type": "sum"|"min"|"max"|"subtract"|"multiply"|"divide"|null, \
"operand_field_names": [str, ...], "conditions": [{"trigger_quote": str, "reason_if_true": str, \
"reason_if_false": str}], "carryover_target": str|null, "confidence": float, "reasoning": str}
"""


@dataclass
class CalcRuleDecision:
    is_pure_input: bool
    formula_type: str | None
    operand_field_names: list[str]
    conditions: list[dict]
    carryover_target: str | None
    confidence: float
    reasoning: str
    model_version: str
    raw_response: str


def synthesize_calc_rule(
    *, field_name: str, line_number: str, quote: str, candidate_operands: list[dict], feedback: str | None = None
) -> CalcRuleDecision:
    """Decides, for ONE canonical field, whether it's a pure taxpayer input or
    a computed line — and if computed, its formula type/operands/conditions/
    carryover target. `candidate_operands` is the full list of every OTHER
    canonical field on the same form ({"field_name", "line", "description"}),
    the only valid operand choices. `feedback` carries a Phase 8 judge's
    issues when this is a repair re-synthesis (see grounding_check.py)."""
    bedrock_result = _try_bedrock_calc_rule(
        field_name=field_name, line_number=line_number, quote=quote, candidate_operands=candidate_operands, feedback=feedback
    )
    if bedrock_result is not None:
        return bedrock_result
    return _stub_synthesize_calc_rule(field_name=field_name, line_number=line_number, quote=quote, candidate_operands=candidate_operands)


def _try_bedrock_calc_rule(
    *, field_name: str, line_number: str, quote: str, candidate_operands: list[dict], feedback: str | None = None
) -> CalcRuleDecision | None:
    try:
        client = _bedrock_client()
        user_content = (
            f"Field: {field_name} (line {line_number})\n\nQuote:\n{quote}\n\n"
            f"Candidate operands (the ONLY valid choices):\n{json.dumps(candidate_operands, indent=2)}"
        )
        if feedback:
            user_content += (
                f"\n\nA Phase 8 grounding judge rejected a previous version of this rule with this "
                f"feedback — address it directly in your revised decision:\n{feedback}"
            )
        body = {
            "anthropic_version": "bedrock-2023-05-31",
            "max_tokens": BEDROCK_MAX_TOKENS,
            "temperature": BEDROCK_TEMPERATURE,
            "system": CALC_RULE_SYSTEM_PROMPT,
            "messages": [{"role": "user", "content": user_content}],
        }
        response = client.invoke_model(modelId=BEDROCK_MODEL_ID, body=json.dumps(body))
        payload = json.loads(response["body"].read())
        text = payload["content"][0]["text"]
        parsed = _parse_json_response(text)
        return CalcRuleDecision(
            is_pure_input=bool(parsed.get("is_pure_input", False)),
            formula_type=parsed.get("formula_type"),
            operand_field_names=list(parsed.get("operand_field_names", [])),
            conditions=list(parsed.get("conditions", [])),
            carryover_target=parsed.get("carryover_target"),
            confidence=float(parsed.get("confidence", 0.5)),
            reasoning=parsed.get("reasoning", ""),
            model_version=BEDROCK_MODEL_ID,
            raw_response=text,
        )
    except Exception as e:
        log.warning("llm_client.bedrock_calc_rule_failed", error=repr(e))
        return None


def _stub_synthesize_calc_rule(
    *, field_name: str, line_number: str, quote: str, candidate_operands: list[dict]
) -> CalcRuleDecision:
    """Deterministic fallback when no LLM credentials are configured. Unlike
    the old regex writer, this NEVER guesses a formula — without an LLM
    there is no reliable way to tell composition from exclusion/negation, so
    it always reports low confidence and defers to human review rather than
    silently producing a plausible-looking but potentially-wrong rule."""
    return CalcRuleDecision(
        is_pure_input=False,
        formula_type=None,
        operand_field_names=[],
        conditions=[],
        carryover_target=None,
        confidence=0.0,
        reasoning="stub calc rule agent: no LLM credentials configured — cannot safely infer a formula from text",
        model_version=STUB_MODEL_VERSION,
        raw_response=json.dumps({"note": "deterministic stub calc rule agent", "field_name": field_name}),
    )


# ---------------------------------------------------------------------------
# PDF field mapping — see docs/adr/0008.
#
# IRS fillable PDFs use auto-generated AcroForm field codes (e.g.
# "topmostSubform[0].Page1[0].f1_2[0]") with no embedded description text, so
# there's no mechanical way to know which field code corresponds to which
# canonical field/line. This is a fifth, independent LLM call site — one
# call per form, scoped to only the pilot's in-scope canonical fields (not
# all ~229 PDF fields), each matched against the raw field codes extracted
# from the real PDF via PyMuPDF. Low-confidence proposals are routed to the
# existing Human Review Queue rather than trusted silently.
# ---------------------------------------------------------------------------

PDF_FIELD_MAPPING_PROMPT_VERSION = "pdf_field_mapping_v2"

PDF_FIELD_MAPPING_SYSTEM_PROMPT = """You are matching canonical tax-form fields to the raw AcroForm field codes \
of the actual IRS PDF for the same form. IRS PDFs use auto-generated, non-descriptive field codes (e.g. \
"topmostSubform[0].Page1[0].f1_4[0]") that do NOT reliably correspond to the printed line number (the "4" in \
"f1_4[0]" might actually be the field for line 2, line 5, or anything else) — NEVER assume `f1_N` = "line N".

PRIMARY SIGNAL — `nearby_text`: each candidate includes `nearby_text`, the ACTUAL text printed on the PDF page \
immediately to the left of that field's box, extracted directly from the page (not inferred). This is real \
ground truth, e.g. `"z  Add lines 1a through 1h . . . . . . . . . . . . . . . . . . . . . . 1z"` unambiguously \
tells you this box is for line 1z. Always match a candidate to a canonical field by first checking whether \
`nearby_text` contains that field's line number/letter (e.g. "10", "1z", "13") immediately before or after the \
label text, or wording that matches the field's description. Trust `nearby_text` over position/counting \
whenever the two would disagree.

SECONDARY SIGNAL — position/reading order: only when `nearby_text` is blank, truncated, or ambiguous (e.g. a \
multi-line label where the line number got cut off), fall back to the field's page number and position (the \
`rect` bounding box: [x0, y0, x1, y1] in PDF points, origin top-left, so a LARGER y0 means further DOWN the \
page) cross-referenced against the candidates immediately before/after it in reading order (already sorted by \
page, then top-to-bottom). In this fallback case:
1. The first 1-3 Text-type candidates at the very top of page 1 are almost always taxpayer name / SSN / EIN \
header fields, not any numbered line — do not map these to any line.
2. Checkbox ("Btn" type) widgets correspond to checkbox lines (e.g. "check here if...") — never to a \
currency/text canonical field, and vice versa.
3. Walk the remaining candidates in order and count them off 1:1 against the form's actual line sequence (1, \
2, 3, ... including any lettered sub-lines like 14a/14b/14c) — you are given the FULL list of this form's \
canonical fields (not just the ones you need to output) precisely so you can do this counting correctly \
across the whole page, even for lines you don't need to report.
4. A noticeably larger vertical gap between two consecutive candidates usually means a section/part header (no \
form field) was skipped in between — re-anchor your count using the nearest candidate whose `nearby_text` IS \
legible rather than letting the gap silently shift your count.

You will be given:
- The FULL list of this form's canonical fields: {field_name, line, description, required}. Fields with \
`required: true` are the ones you must attempt to map (they matter for this pilot); fields with `required: \
false` are given only so you can correctly count/order the sequence — do not skip over them while counting, \
but do not include them in your output.
- Every candidate PDF field code on this form, already sorted in reading order (page, then top-to-bottom): \
{pdf_field_code, page_number, rect, field_type, nearby_text}.

Rules:
- Only emit mappings for `required: true` fields. Every canonical field maps to AT MOST one PDF field code; \
every PDF field code is used for AT MOST one canonical field.
- If `nearby_text` doesn't clearly identify a `required: true` field's line AND the position-counting fallback \
isn't confident either, omit it entirely rather than guessing — an omitted field is routed to a human \
reviewer, which is far better than a wrong mapping silently filling the WRONG box on a real tax form.
- Before finalizing, sanity-check each mapping: does the `nearby_text` you cited actually contain that line's \
number/letter or matching wording? If you fell back to position/counting, does the position fall between the \
mappings (or known-position anchors) of the line immediately before and after it? If not, you likely miscounted.
- Give each mapping you DO propose a confidence 0.0-1.0, and a short `reasoning` that quotes the `nearby_text` \
(or, if you used the position fallback, names which neighboring fields you counted from).

Return ONLY JSON matching exactly:
{"mappings": [{"field_name": str, "pdf_field_code": str, "page_number": int, "confidence": float, \
"reasoning": str}]}
"""


@dataclass
class PdfFieldMappingProposal:
    field_name: str
    pdf_field_code: str
    page_number: int
    confidence: float
    reasoning: str


@dataclass
class PdfFieldMappingResult:
    mappings: list[PdfFieldMappingProposal]
    model_version: str
    prompt_version: str
    raw_response: str


def map_pdf_fields(*, form: str, in_scope_fields: list[dict], pdf_field_candidates: list[dict]) -> PdfFieldMappingResult:
    """One call per form (small enough to fit in one prompt). `in_scope_fields`
    is the FULL list of this form's canonical fields, each tagged
    `required: bool` (true = in the pilot's ancestor-closure scope, needs a
    mapping; false = provided only so the model can correctly count/order
    the full line sequence — see the system prompt's off-by-one-avoidance
    instructions). `pdf_field_candidates` should already be sorted in
    reading order (page, then top-to-bottom). `form` is used only for
    logging/error context."""
    bedrock_result = _try_bedrock_pdf_mapping(form=form, in_scope_fields=in_scope_fields, pdf_field_candidates=pdf_field_candidates)
    if bedrock_result is not None:
        return bedrock_result
    return _stub_map_pdf_fields(form=form)


def _try_bedrock_pdf_mapping(
    *, form: str, in_scope_fields: list[dict], pdf_field_candidates: list[dict]
) -> PdfFieldMappingResult | None:
    try:
        client = _bedrock_client()
        user_content = (
            f"Form: {form}\n\n"
            f"Full canonical field list (only `required: true` need a mapping in your output):\n"
            f"{json.dumps(in_scope_fields, indent=2)}\n\n"
            f"Candidate PDF field codes (reading order — page, then top-to-bottom):\n"
            f"{json.dumps(pdf_field_candidates, indent=2)}"
        )
        body = {
            "anthropic_version": "bedrock-2023-05-31",
            "max_tokens": BEDROCK_PDF_MAPPING_MAX_TOKENS,
            "temperature": BEDROCK_TEMPERATURE,
            "system": PDF_FIELD_MAPPING_SYSTEM_PROMPT,
            "messages": [{"role": "user", "content": user_content}],
        }
        response = client.invoke_model(modelId=BEDROCK_MODEL_ID, body=json.dumps(body))
        payload = json.loads(response["body"].read())
        text = payload["content"][0]["text"]
        parsed = _parse_json_response(text)
        mappings = [
            PdfFieldMappingProposal(
                field_name=m["field_name"],
                pdf_field_code=m["pdf_field_code"],
                page_number=int(m.get("page_number", 0)),
                confidence=float(m.get("confidence", 0.5)),
                reasoning=m.get("reasoning", ""),
            )
            for m in parsed.get("mappings", [])
        ]
        return PdfFieldMappingResult(
            mappings=mappings, model_version=BEDROCK_MODEL_ID, prompt_version=PDF_FIELD_MAPPING_PROMPT_VERSION, raw_response=text
        )
    except Exception as e:
        log.warning("llm_client.bedrock_pdf_mapping_failed", error=repr(e), form=form)
        return None


def _stub_map_pdf_fields(*, form: str) -> PdfFieldMappingResult:
    """Deterministic fallback when no LLM credentials are configured: field
    codes are non-descriptive by construction, so there is no reliable
    heuristic mapping available without an LLM — return zero mappings
    (every in-scope field then surfaces for human mapping) rather than
    fabricate a plausible-looking but likely-wrong position-based guess."""
    return PdfFieldMappingResult(
        mappings=[],
        model_version=STUB_MODEL_VERSION,
        prompt_version=PDF_FIELD_MAPPING_PROMPT_VERSION,
        raw_response=json.dumps({"note": "deterministic stub — no LLM credentials configured", "form": form}),
    )


def _stub_judge(*, quote: str, formula: dict, operands: list[dict]) -> GroundingJudgment:
    """Deterministic fallback when no LLM credentials are configured: the
    only check available without an LLM is a crude substring/keyword check
    (does the quote at least mention words related to each operand's
    description?). This deliberately never returns grounded=True — a
    heuristic keyword match is not a real grounding judgment, so the honest
    result is "cannot verify, needs human review", surfaced as a 'warn'
    result rather than a false pass."""
    issues = []
    quote_lower = quote.lower()
    for op in operands:
        desc_words = [w for w in re.findall(r"[A-Za-z]{4,}", (op.get("description") or "")) if w.lower() not in
                      {"amount", "line"}]
        if desc_words and not any(w.lower() in quote_lower for w in desc_words[:3]):
            issues.append(f"stub judge: no keyword overlap found between quote and operand '{op.get('name')}'")

    return GroundingJudgment(
        grounded=False,
        confidence=0.5,
        issues=[*issues, "stub judge: no LLM credentials configured — cannot verify semantic grounding"],
        model_version=STUB_MODEL_VERSION,
        raw_response=json.dumps({"note": "deterministic stub grounding judge"}),
        # Without an LLM there's no way to distinguish "bad formula" from
        # "bad quote" — "unclear" routes straight to human review rather than
        # guessing which repair path to try (see grounding_check.py's loop).
        likely_cause="unclear",
    )
