---
name: al-integration-development
description: Design or implement Business Central AL integrations with external services. Use for HTTP/API calls, authentication, serialization, retries, idempotency, and integration error handling.
---

# Al Integration Development

## Workflow
1. Define the external contract, direction, authentication, identifiers, and failure behavior first.
2. Inspect existing integration abstractions and reuse them when suitable.
3. Validate inputs and external responses; never expose or log secrets.
4. Design timeout, retry, idempotency, transaction, and recovery behavior according to the business operation.
5. Separate transport concerns from reusable business logic where practical.
6. Build/test happy and failure paths when tooling or test doubles are available; report gaps.

## Guardrails
- Follow repository-level and applicable path-specific instructions.
- Prefer verified workspace symbols and current project configuration over assumptions.
- Keep changes scoped; explain any necessary broad or destructive change before applying it.
- Do not publish or deploy unless explicitly requested.
