---
name: bc-security-review
description: "Use for Business Central security reviews covering roles, permission sets, data classification, Profiles, APIs, OData, resource exposure, and least-privilege access."
user-invocable: true
---

# Business Central Security Review

Review only the requested feature, objects, permissions, and exposure surface. Read `app.json` first.

## Review areas

- Object permissions and table data permissions.
- `Permission Set`, `Permission Set Extension`, indirect permissions, and least privilege.
- Roles, Profiles, Role Centers, `AccessByPermission`, and visible UI actions versus actual authorization.
- `DataClassification`, sensitive fields, API Page, API Query, OData, reports, and XMLports.
- `Permissions` properties and permission flow across codeunits/events.
- Authentication boundaries for external integrations.
- Secrets, tokens, connection configuration, and outbound HTTP configuration.
- `resourceExposurePolicy` and source/debugging exposure before publishing.
- Permission, negative, data-exposure, and regression tests.

## Required output

Report findings first, ordered by Critical, High, Medium, Low. For each finding include evidence, file/object, impact, recommendation, and validation. Separate verified facts from assumptions and identify the official source or AL symbol evidence when relevant.

Do not recommend disabling security controls for convenience. Do not claim that UI visibility is authorization.
