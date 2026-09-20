---
name: bc-release-readiness
description: Assess Business Central release readiness across requirements, code, tests, permissions, data migration, package/version, deployment, monitoring, storage, rollback, support, and human approvals.
---

# Business Central Release Readiness

## Purpose
Provide an independent, evidence-based gate for promotion to a shared environment. This skill does not authorize or perform production deployment.

## Primary agent
`Technical Architect - Solution Review (Custom)`

## Workflow
1. **Confirm release identity and scope**
   - App/package version, commit/reference, included requirements/fixes, target environment, dependencies, release owner, and exclusions.
2. **Check functional readiness**
   - Approved requirements/FIT-GAP/design, acceptance criteria, configuration, permissions, documentation, training/UAT needs, and known limitations.
3. **Check technical quality**
   - Build, configured analyzers, code review, architecture conformance, security, performance, database growth, integration, background processing, and upgrade findings.
4. **Check test evidence**
   - Unit/component, regression, permission, integration, upgrade, performance, UAT, and smoke tests. Distinguish compiled from executed and passed.
5. **Check deployment readiness**
   - Environment prerequisites, artifact provenance, app version/dependency order, install/upgrade behavior, data backup/export assumptions, deployment steps, downtime/maintenance, and rollback.
6. **Check operational readiness**
   - Telemetry, health signals, dashboards/queries, job queues, integration monitoring, storage/retention, support ownership, runbooks, escalation, and post-release observation.
7. **Make the gate decision**
   - `READY FOR HUMAN APPROVAL`
   - `READY WITH CONDITIONS`
   - `CHANGES REQUIRED`
   - `BLOCKED BY MISSING EVIDENCE`

## Required output
- Release summary and artifact identity
- Readiness checklist with evidence references
- Requirement/test traceability status
- Open defects, conditions, and owners
- Security/performance/upgrade/storage conclusions
- Deployment, smoke-test, monitoring, and rollback plan status
- Gate decision and explicit `HUMAN APPROVAL REQUIRED`
- Never claim approval for production or execute production deployment

## Common guardrails
- Follow `.github/copilot-instructions.md`, applicable `.github/instructions/*.instructions.md`, the selected Custom Agent, `app.json`, and established repository conventions.
- Treat current workspace source, downloaded symbols, compiler output, analyzer output, test evidence, and approved project documents as evidence. Separate verified facts from assumptions.
- Prefer standard Business Central features, setup, extension objects, published events, and supported APIs before custom frameworks or copied standard logic.
- Never invent AL objects, fields, events, procedures, signatures, platform behavior, environment facts, business decisions, or test results.
- Keep work scoped. Preserve unrelated changes. Do not commit, merge, publish to production, change dependencies, perform destructive data operations, or broaden permissions without explicit approval.
- Escalate a human gate for financial posting behavior, destructive schema/data changes, public API breaking changes, security boundaries, dependency/app identity changes, production deployment, or unresolved material business rules.
