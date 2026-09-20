---
name: al-integration-development
description: Design or implement a Business Central integration using standard APIs, API pages/queries, HttpClient, JSON/XML, files, Dataverse, Power Platform, Azure services, middleware, webhooks, or background processing.
---

# AL Integration Development

## Purpose
Implement a secure, observable, supportable integration without coupling external transport contracts directly to core Business Central logic.

## Primary agent
`Technical Consultant - AL Development (Custom)`

## Workflow
1. **Confirm the integration contract**
   - Direction, trigger, system of record, ownership, synchronous/asynchronous pattern, endpoint/version, authentication, identifiers, expected volume, latency, and SLA assumptions.
2. **Verify reuse options**
   - Prefer standard Business Central APIs/connectors and existing project integration abstractions.
3. **Design layers**
   - Setup/secret access, client/transport, DTO or external model, serialization, mapper, validation, domain/service orchestration, staging if needed, telemetry, and retry/recovery.
4. **Secure the boundary**
   - Least-privilege identity and permissions, secret management, TLS/endpoint validation, input/schema validation, payload limits, and safe logging.
5. **Design reliability**
   - Timeout, retry/backoff, idempotency, deduplication, correlation, pagination/batching, ordering, partial success, poison messages, replay, and reconciliation.
6. **Protect Business Central transactions**
   - Avoid external calls inside posting or long database transactions.
   - Bound work and use Job Queue/background processing when appropriate.
7. **Validate**
   - Build, happy path, invalid payload, authentication/authorization, timeout, non-success status, duplicate, retry, partial failure, scale, permission, and recovery tests.

## Required output
- Contract and responsibility summary
- Data flow and component list
- Files/objects changed
- Mapping and validation rules
- Authentication and permissions approach
- Failure/retry/idempotency/recovery behavior
- Throughput, payload, storage/retention, and telemetry analysis
- Build and test evidence
- Unverified external dependencies, operational runbook needs, and human gates

## Common guardrails
- Follow `.github/copilot-instructions.md`, applicable `.github/instructions/*.instructions.md`, the selected Custom Agent, `app.json`, and established repository conventions.
- Treat current workspace source, downloaded symbols, compiler output, analyzer output, test evidence, and approved project documents as evidence. Separate verified facts from assumptions.
- Prefer standard Business Central features, setup, extension objects, published events, and supported APIs before custom frameworks or copied standard logic.
- Never invent AL objects, fields, events, procedures, signatures, platform behavior, environment facts, business decisions, or test results.
- Keep work scoped. Preserve unrelated changes. Do not commit, merge, publish to production, change dependencies, perform destructive data operations, or broaden permissions without explicit approval.
- Escalate a human gate for financial posting behavior, destructive schema/data changes, public API breaking changes, security boundaries, dependency/app identity changes, production deployment, or unresolved material business rules.
