---
name: al-security-review
description: Review Business Central AL changes for security and authorization risks. Use for permission sets, APIs, sensitive data, integrations, privileged operations, or explicit security reviews.
---

# Al Security Review

## Workflow
1. Identify trust boundaries, exposed data, required privileges, and privileged operations in scope.
2. Check least privilege, direct/indirect permissions, server-side authorization, and data exposure.
3. Check source/config/logging for secrets, credentials, tokens, or sensitive payloads.
4. Treat external input as untrusted and verify relevant validation.
5. Do not weaken controls merely to remove an authorization error.
6. Report findings by severity only when supported by evidence, with file/object and remediation.

## Guardrails
- Follow repository-level and applicable path-specific instructions.
- Prefer verified workspace symbols and current project configuration over assumptions.
- Keep changes scoped; explain any necessary broad or destructive change before applying it.
- Do not publish or deploy unless explicitly requested.
