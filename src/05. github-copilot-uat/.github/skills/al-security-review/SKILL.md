---
name: al-security-review
description: Review Business Central changes for authorization, permission, sensitive-data, API, integration, tenant/company, secrets, privacy, and privileged-operation risks. Use before and after security-relevant implementation.
---

# AL Security Review

## Purpose
Provide an evidence-based security assessment aligned with least privilege and Business Central trust boundaries.

## Primary agents
- `Technical Architect - Technical Design (Custom)` before implementation
- `Technical Architect - Solution Review (Custom)` after implementation

## Workflow
1. **Define assets and actors**
   - Sensitive/business-critical data, privileged operations, users, approvers, administrators, service identities, external systems, companies, and tenants.
2. **Map trust boundaries and data flow**
   - UI, AL server, APIs, files, integrations, secrets, telemetry, background sessions, control add-ins, and external storage.
3. **Review authorization**
   - License/entitlement assumptions, permission sets, direct/indirect permissions, server-side enforcement, segregation of duties, approval authority, and cross-company behavior.
4. **Review data protection**
   - `DataClassification`, minimum exposure, reports/exports, APIs, logs/errors, telemetry, retention, deletion, attachments/media, and confidential configuration.
5. **Review input and integration security**
   - Authentication, secret storage, endpoint trust, external input/schema validation, payload limits, replay/idempotency, error disclosure, and service-principal scope.
6. **Review secure behavior**
   - Safe defaults, denied paths, state transitions, privileged bypasses, auditability, background identity, and failure/recovery.
7. **Validate findings**
   - Cite source/object/evidence and avoid speculative vulnerability claims.

## Required output
- Scope, assets, roles, and trust boundaries
- Findings by severity with evidence and affected file/object
- Exploit or failure condition stated carefully
- Business impact
- Smallest remediation and validation test
- Permission matrix changes
- Sensitive-data/logging/retention impact
- Residual risk and required human security decisions

## Common guardrails
- Follow `.github/copilot-instructions.md`, applicable `.github/instructions/*.instructions.md`, the selected Custom Agent, `app.json`, and established repository conventions.
- Treat current workspace source, downloaded symbols, compiler output, analyzer output, test evidence, and approved project documents as evidence. Separate verified facts from assumptions.
- Prefer standard Business Central features, setup, extension objects, published events, and supported APIs before custom frameworks or copied standard logic.
- Never invent AL objects, fields, events, procedures, signatures, platform behavior, environment facts, business decisions, or test results.
- Keep work scoped. Preserve unrelated changes. Do not commit, merge, publish to production, change dependencies, perform destructive data operations, or broaden permissions without explicit approval.
- Escalate a human gate for financial posting behavior, destructive schema/data changes, public API breaking changes, security boundaries, dependency/app identity changes, production deployment, or unresolved material business rules.
