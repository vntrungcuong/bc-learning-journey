---
description: Security-sensitive development rules
applyTo: "**/Security/**/*.al"
---

# Security-sensitive development rules

- Apply least privilege and minimize data exposure.
- Never hard-code or log secrets, credentials, access tokens, or sensitive configuration.
- Validate authorization server-side; do not rely only on UI visibility/editability.
- Treat external input as untrusted and validate before use.
- Flag security-sensitive assumptions or unverifiable controls before implementation.
