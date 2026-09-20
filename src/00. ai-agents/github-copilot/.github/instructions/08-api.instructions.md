---
description: Rules for Business Central API pages, API queries, versioned contracts, web service exposure, and external consumers.
applyTo: "**/API/**/*.al,**/Apis/**/*.al,**/WebServices/**/*.al,**/*.APIPage.al,**/*.APIQuery.al"
---

# Business Central API Rules

## Contract design
- Create an API page or API query only for an intentional, documented external contract.
- Define stable publisher, group, version, entity name, and entity-set name according to project conventions.
- Use stable identifiers, typically `SystemId`, and configure keys and `ODataKeyFields` deliberately.
- Expose only required fields and relationships. Use consistent lower camel case API field names where required by project standards.

## Behavior
- Keep read operations free of business side effects.
- For write operations, validate business rules, concurrency, ETags, required fields, state transitions, idempotency, and error responses.
- Avoid exposing actions or bound operations unless a resource-oriented contract cannot meet the requirement.
- Do not break an existing contract. Introduce a new API version for approved breaking changes.

## Security and privacy
- Apply least-privilege permission sets and verify application/user authorization.
- Do not expose secrets, sensitive fields, internal control fields, or unrestricted cross-company data.
- Validate external input and protect against excessive payloads, unsupported filters, and unauthorized enumeration.

## Performance and operations
- Support filtering and pagination; avoid unbounded data retrieval.
- Assess payload size, expansion, query selectivity, throttling, concurrency, retry behavior, and telemetry.
- Document consumer ownership, compatibility period, deprecation strategy, support model, and test evidence.
