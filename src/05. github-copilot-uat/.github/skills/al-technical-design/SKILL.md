---
name: al-technical-design
description: Translate an approved Business Central solution into an evidence-based AL technical design. Use before coding for multi-object, schema, posting, integration, background, permission, performance, security, upgrade, or operability changes.
---

# AL Technical Design

## Purpose
Produce a Principal-level technical plan that a developer can implement without redefining architecture or guessing Business Central behavior.

## Primary agent
`Technical Architect - Technical Design (Custom)`

## Workflow
1. **Inspect the repository**
   - Read `app.json`, dependencies, object ranges, namespaces, folder structure, analyzers, existing implementation, tests, and deployment conventions.
2. **Verify Business Central extension points**
   - Search current symbols for standard tables, pages, codeunits, reports, queries, APIs, enums, interfaces, events, and procedure signatures.
   - Document verified facts and unresolved symbol questions.
3. **Design AL objects and responsibilities**
   - Select new versus extension objects, IDs, names, namespaces, fields, keys, relations, pages, actions, codeunits, events, interfaces, reports/layouts, queries, XMLports, APIs, permission sets, install/upgrade code, tests, and telemetry.
4. **Design data and transactions**
   - Data ownership, validation, state transitions, posting impact, transaction boundaries, locking, commits, concurrency, idempotency, retention, cleanup, archive, and migration.
5. **Design non-functional behavior**
   - Expected volume, access paths, key/selectivity assumptions, batching, payload size, background execution, external latency, database growth, telemetry, and support diagnostics.
6. **Design security**
   - Data classification, least privilege, direct/indirect permissions, service identities, trust boundaries, secrets, and exposure.
7. **Design validation**
   - Build/analyzer plan, unit and integration tests, permission tests, performance measurements, upgrade tests, and manual scenarios.
8. **Create an implementation handoff sequence**
   - Small safe increments with dependencies, validation after each increment, rollback points, and the handoff to `Technical Architect - Implementation Planning (Custom)` for the persistent execution plan.

## Required output
- Technical objective and constraints
- Verified symbols and evidence
- Object/file impact matrix
- Detailed object responsibilities and interfaces
- Data model, keys, relations, schema/upgrade impact
- Process, transaction, event, and state flow
- Permission and security design
- Performance, scale, database-growth, and retention analysis
- Integration/background/telemetry design when relevant
- Ordered design-level implementation handoff
- Test and measurement matrix
- Risks, rollback, assumptions, open decisions, and gate decision
- Handoff to `Technical Architect - Implementation Planning (Custom)`

## Common guardrails
- Follow `.github/copilot-instructions.md`, applicable `.github/instructions/*.instructions.md`, the selected Custom Agent, `app.json`, and established repository conventions.
- Treat current workspace source, downloaded symbols, compiler output, analyzer output, test evidence, and approved project documents as evidence. Separate verified facts from assumptions.
- Prefer standard Business Central features, setup, extension objects, published events, and supported APIs before custom frameworks or copied standard logic.
- Never invent AL objects, fields, events, procedures, signatures, platform behavior, environment facts, business decisions, or test results.
- Keep work scoped. Preserve unrelated changes. Do not commit, merge, publish to production, change dependencies, perform destructive data operations, or broaden permissions without explicit approval.
- Escalate a human gate for financial posting behavior, destructive schema/data changes, public API breaking changes, security boundaries, dependency/app identity changes, production deployment, or unresolved material business rules.
