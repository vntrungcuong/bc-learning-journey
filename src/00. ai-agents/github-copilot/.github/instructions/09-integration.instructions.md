---
description: Rules for Business Central integrations using HttpClient, JSON/XML, web services, Dataverse, Power Platform, Azure services, files, and external systems.
applyTo: "**/Integration/**/*.al,**/Integrations/**/*.al,**/Connectors/**/*.al,**/Dataverse/**/*.al,**/PowerPlatform/**/*.al,**/Azure/**/*.al"
---

# External Integration Rules

## Architecture and ownership
- Define the system of record, direction, trigger, contract, ownership, frequency, expected volume, latency, and support responsibility.
- Separate transport, serialization, mapping, validation, orchestration, and core business logic.
- Prefer standard Business Central APIs and supported connectors before custom endpoints.

## Authentication and secrets
- Use approved authentication and secret-management mechanisms. Never store or log secrets, tokens, passwords, certificates, or connection strings in source or business tables.
- Apply least privilege to service principals, users, APIs, and permission sets.
- Define token renewal, environment-specific configuration, and access revocation.

## Reliability
- Define timeouts, retries with backoff, idempotency, deduplication, correlation IDs, ordering, partial success, replay, poison-message handling, and recovery.
- Do not hold critical database transactions open across external calls.
- Make asynchronous processing restart-safe where the business operation permits.
- Validate HTTP status, content type, payload schema, required fields, business semantics, and size limits.

## Mapping and data quality
- Keep external models separate from internal business models.
- Define field mapping, units, currencies, date/time zones, cultures, rounding, master-data references, and version compatibility.
- Reject or quarantine invalid messages rather than silently dropping required data.

## Observability and scale
- Record safe, structured telemetry with correlation and operation outcome, without sensitive payloads.
- Define expected throughput, batching, pagination, rate limits, storage/queue growth, retention, cleanup, and operational alerts.
- Document manual recovery and reconciliation procedures.
