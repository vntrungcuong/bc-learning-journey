---
description: External integration rules
applyTo: "**/Integration/**/*.al,**/Integrations/**/*.al"
---

# External integration rules

- Define contract, authentication, timeout, retry, idempotency, and recovery behavior explicitly.
- Treat external responses as untrusted; validate status, payload, and required fields.
- Do not log secrets, tokens, credentials, or sensitive payloads.
- Separate transport concerns from core business logic where practical.
- Design failures to be diagnosable and safely retryable when the business process permits.
