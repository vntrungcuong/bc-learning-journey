---
name: validate-release
description: Run the final evidence-based Business Central release-readiness gate without deploying to production.
agent: solution-reviewer
argument-hint: 'version=... artifact=... targetEnvironment=... releaseScope=... evidence=...'
---

# Validate Business Central Release Readiness

Use `bc-release-readiness` for an independent gate. Do not deploy or publish to production.

Release identity and scope:
${input:release:Provide app/package version, artifact or commit, included requirements/fixes, target environment, owner, and exclusions}

Evidence references:
${input:evidence:Provide requirement approvals, designs, build/analyzer output, test results, security/performance/upgrade reviews, deployment plan, and runbooks}

## Required checks
1. Functional scope, acceptance criteria, FIT/GAP/design approvals, setup, permissions, documentation, UAT/training needs, and known limitations.
2. Artifact provenance, `app.json`, version/dependency order, build, configured analyzers, code review, architecture conformance, and unchanged unapproved scope.
3. Security, performance, scalability, database growth/retention, integration, background processing, telemetry, and upgrade/migration findings.
4. Test evidence for unit/component, regression, permission, integration, performance, upgrade, UAT, and smoke tests. Separate compilation from execution.
5. Deployment prerequisites, environment compatibility, install/upgrade behavior, backup/export assumptions, maintenance window, smoke validation, rollback, and irreversible steps.
6. Monitoring, job queues, integration health, storage, retention/cleanup, support ownership, runbooks, escalation, and post-release observation.

## Output
- Release summary and artifact identity
- Evidence-based readiness checklist
- Requirement/test traceability status
- Open defects, missing evidence, conditions, owners, and human gates
- Deployment, smoke-test, monitoring, rollback, and support readiness
- One decision:
  - `READY FOR HUMAN APPROVAL`
  - `READY WITH CONDITIONS`
  - `CHANGES REQUIRED`
  - `BLOCKED BY MISSING EVIDENCE`
- Explicit `HUMAN APPROVAL REQUIRED`

Never claim production approval or execute release actions.
