---
name: al-issue-diagnosis
description: Diagnose Business Central compile, runtime, data, posting, permission, page, report, integration, background, performance, upgrade, deployment, or regression issues using evidence-first root-cause analysis.
---

# AL Issue Diagnosis

## Purpose
Establish an evidence-backed root cause and the smallest safe correction without broad speculative refactoring.

## Primary agent
`Technical Consultant - Issue Diagnosis (Custom)`

## Workflow
1. **Normalize the issue**
   - Actual behavior, expected behavior, business impact, environment, version, company, user/permissions, frequency, reproduction steps, error/stack/session/telemetry evidence, and recent changes.
2. **Classify the failure**
   - Requirement/configuration, compile/analyzer, runtime, data/setup, permission/license, report/layout, integration, background/job queue, performance/locking, upgrade/deployment, or environment/service.
3. **Trace the execution path**
   - Separate custom from Microsoft/dependency behavior. Inspect source, symbols, events, configuration, permissions, data state, logs, telemetry, and package/version evidence.
4. **Form hypotheses**
   - Rank falsifiable hypotheses by evidence and impact.
   - Run the cheapest safe diagnostic to confirm or reject each hypothesis.
5. **State the root cause**
   - Mark Verified Root Cause, Probable Cause, or Unresolved. Do not overstate confidence.
6. **Recommend the correction direction**
   - Root-cause fix direction, temporary mitigation, impacted areas, side effects, regression risk, rollback, and required approvals.
7. **Route the verified correction**
   - If the root cause is verified and a code or configuration change is required, recommend handoff to `Technical Architect - Implementation Planning (Custom)` for the persistent execution plan.

## Required output
- Issue summary and scope
- Evidence collected
- Classification and execution path
- Hypothesis table with diagnostic result
- Root-cause status and explanation
- Fix versus workaround
- Impacted areas and data/configuration impact, if any exist from the investigation
- Diagnostic evidence and recommended validation scenarios
- Residual uncertainty, monitoring, rollback, and handoff

## Common guardrails
- Follow `.github/copilot-instructions.md`, applicable `.github/instructions/*.instructions.md`, the selected Custom Agent, `app.json`, and established repository conventions.
- Treat current workspace source, downloaded symbols, compiler output, analyzer output, test evidence, and approved project documents as evidence. Separate verified facts from assumptions.
- Prefer standard Business Central features, setup, extension objects, published events, and supported APIs before custom frameworks or copied standard logic.
- Never invent AL objects, fields, events, procedures, signatures, platform behavior, environment facts, business decisions, or test results.
- Keep work scoped. Preserve unrelated changes. Do not commit, merge, publish to production, change dependencies, perform destructive data operations, or broaden permissions without explicit approval.
- Escalate a human gate for financial posting behavior, destructive schema/data changes, public API breaking changes, security boundaries, dependency/app identity changes, production deployment, or unresolved material business rules.
