---
name: bc-integration-development
description: "Use for Business Central integrations involving APIs, HttpClient, web services, authentication, retries, idempotency, Job Queue, telemetry, or operational recovery."
user-invocable: true
---

# Business Central Integration Development

## Workflow

1. Read `app.json`, applicable instructions, and the relevant integration docs.
2. Define the contract, direction, authentication boundary, data mapping, versioning, and failure states.
3. Identify the AL objects: API Page/Query, codeunit, interface, XMLport, staging table, permission set, and Job Queue where applicable.
4. Verify Microsoft and external API signatures from official sources before writing code.
5. Design least-privilege permissions, secret handling, outbound HTTP allowlisting/configuration, timeout, rate-limit, and payload behavior.
6. Implement idempotency, retry/backoff, duplicate prevention, correlation identifiers, and safe transaction boundaries.
7. Keep external calls outside database transactions when correctness allows; define recovery and replay behavior.
8. Add tests for success, invalid responses, timeout, rate limit, authentication failure, duplicate delivery, retry exhaustion, and partial failure.
9. Review telemetry, sensitive-data scrubbing, Job Queue scheduling, and operational ownership.

## Required output

- Contract and data flow.
- Security and permission model.
- Failure-state and retry model.
- Idempotency and replay strategy.
- Objects and dependencies.
- Tests and validation.
- Assumptions, unavailable verification, and residual risks.

Never hardcode secrets or invent endpoint signatures. Prefer AL-native integration events, codeunits, interfaces, and staging patterns where appropriate.
