---
description: Rules for permission sets, permission-set extensions, entitlements-related design, authorization, sensitive data, secrets, privacy, and security-sensitive AL changes.
applyTo: "**/Permissions/**/*.al,**/Security/**/*.al,**/PermissionSets/**/*.al,**/*.PermissionSet.al,**/*.PermissionSetExt.al"
---

# Permissions and Security Rules

## Least privilege
- Grant only the object and table-data permissions required by the approved scenario.
- Avoid wildcard, broad, or `SUPER`-dependent designs.
- Distinguish direct user access from indirect permissions required through controlled codeunits.
- Review permissions whenever new tables, reports, APIs, background processes, install/upgrade code, or integrations are added.
- Never weaken authorization merely to bypass a permission error.

## Authorization
- Enforce sensitive operations server-side at the correct business boundary.
- Treat page visibility, editability, action enablement, profiles, and personalization as user experience, not security controls.
- Review segregation of duties, approval authority, company access, cross-company behavior, service identities, and delegated administration where relevant.

## Data and secrets
- Apply accurate `DataClassification` and minimize collection, exposure, logging, export, and retention of sensitive data.
- Never hard-code or log secrets, credentials, access tokens, certificates, connection strings, or sensitive payloads.
- Use approved secret storage and environment-specific configuration.
- Review API fields, reports, telemetry, errors, attachments, media, and integration logs for accidental disclosure.

## Input and trust boundaries
- Validate external input, file content, API payloads, identifiers, URLs, and configuration.
- Define secure defaults, failure behavior, audit evidence, and incident diagnostics without exposing confidential information.

## Validation
- Test under intended license and permission sets, not only with elevated development access.
- Include allowed, denied, indirect-access, cross-company, background-session, and integration-identity scenarios where relevant.
