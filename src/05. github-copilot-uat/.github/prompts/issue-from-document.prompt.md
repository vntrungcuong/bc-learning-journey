---
name: issue-from-document
description: Start evidence-first Business Central issue diagnosis from an attached issue document.
agent: al-debugger
argument-hint: 'Attach the issue document and optionally add environment, reproduction evidence, and recent changes.'
---

# Diagnose Issue from a Document

Use the attached document as the primary issue source. Apply `al-issue-diagnosis`.

## Mission
Establish an evidence-backed root cause or clearly bounded uncertainty, then prepare the smallest safe routing or fix handoff.

## Required work
1. Extract actual behavior, expected behavior, business impact, environment/version/company, affected user or service identity, frequency, reproduction steps, errors, stack/session/telemetry evidence, data conditions, and recent changes.
2. Separate verified facts from hypotheses, assumptions, contradictions, and missing evidence.
3. Classify the issue as requirement/configuration, compile/analyzer, runtime, data/setup, posting, permission/license, page/report, integration, background/job queue, performance/locking, upgrade/deployment, or environment/service.
4. Trace Architecture, then Functional behavior, then Technical execution. Distinguish custom, Microsoft standard, dependency, configuration, data, and environment behavior.
5. Rank falsifiable hypotheses and perform or propose the cheapest safe diagnostic for each.
6. Mark the result as Verified Root Cause, Probable Cause, or Unresolved.
7. Distinguish permanent fix, mitigation, and workaround. Identify regression, security, financial, performance, storage, and upgrade risks.

## Routing
- Functional/configuration gap: hand off to `Functional Consultant - Solution Analysis (Custom)`.
- Architecture gap: hand off to the relevant Architect.
- Verified technical correction: hand off to `Technical Architect - Implementation Planning (Custom)`, which routes through human plan review before `Technical Consultant - AL Development (Custom)`.

## Output
- Incident brief and evidence inventory
- Classification and execution path
- Hypothesis/diagnostic table
- Root-cause status
- Proposed routing or focused fix plan
- Regression-test requirements, rollback, monitoring, and residual uncertainty

Do not implement an unverified root-cause hypothesis.
