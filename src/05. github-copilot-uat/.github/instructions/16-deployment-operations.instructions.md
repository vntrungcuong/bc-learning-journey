---
description: Rules for Business Central administration, environments, CI/CD, packages, deployment, telemetry, monitoring, storage, support, and operational readiness artifacts.
applyTo: "**/.github/workflows/**/*.{yml,yaml},**/azure-pipelines*.{yml,yaml},**/scripts/**/*.{ps1,sh,py},**/deployment/**/*.{json,yml,yaml,ps1,sh,md},**/operations/**/*.md,**/runbooks/**/*.md,**/monitoring/**/*.{md,json,yml,yaml,kql},**/*.kql"
---

# Deployment and Operations Rules

## Environment governance
- Distinguish development, test, UAT, production, and demo environments by purpose, access, data sensitivity, update policy, and support ownership.
- Do not place production credentials, tenant secrets, certificates, or connection strings in source control, scripts, logs, or pipeline variables stored as plain text.
- Apply least privilege to administrators, service connections, deployment identities, and support users.

## Build and release
- Build packages in a controlled pipeline for shared environments where project policy requires it.
- Promote the same validated artifact through approval gates. Do not rebuild an untraceable package separately for production.
- Validate app dependencies, version ordering, signatures, compatibility, install/upgrade code, permissions, and rollback package before release.
- Keep deployment scripts idempotent, parameterized, environment-aware, and explicit about destructive operations.
- Never deploy or publish to production without the required human approval.

## Monitoring and health
- Define operational signals for failed sessions, telemetry errors, job queues, integrations, API failures, performance degradation, extension update/install failures, authentication, and service health as relevant.
- Use structured telemetry, correlation IDs, safe dimensions, ownership, thresholds, severity, and actionable runbook links.
- Do not log sensitive business data or secrets.
- Establish baseline and measurement evidence before declaring performance regression or improvement.

## Storage and lifecycle
- Monitor database and environment storage, high-growth tables, logs, attachments/media, retention, cleanup jobs, archives, and failed staging/integration records.
- Every custom high-growth store must have an owner, expected growth model, retention rule, cleanup/archive process, and recovery considerations.

## Operational readiness
- Provide deployment plan, validation/smoke tests, backup/export assumptions, rollback steps, monitoring plan, known limitations, support contacts/ownership, and post-release observation checklist.
- Record what was executed, artifact/version, environment, result, evidence, unresolved risks, and required follow-up.
