---
name: develop-al-feature
description: "Plan and implement a multi-object Business Central AL feature with focused validation."
---

Analyze and implement the following Business Central feature: <feature requirement>.

## Phase 1: analysis, do not modify files

1. Read `app.json` and the AL/docs files directly related to the feature.
2. Summarize the current behavior, expected behavior, and assumptions.
3. Create an object matrix covering tables/extensions, pages/extensions, codeunits, reports/report layouts/extensions, queries/APIs, XMLports, enums/interfaces, Profiles, Control Add-ins, permission sets/extensions, Job Queue/upgrade objects, and tests as needed.
4. Create an object ID allocation table within the range defined by `app.json`.
5. Identify the publisher prefix; ask for confirmation if it is not already confirmed.
6. Analyze dependencies, events, permissions, DataClassification, performance, and upgrade impact.
7. Verify Microsoft-specific APIs, events, properties, and signatures against official sources or AL symbols.
8. Define AI/privacy/fallback/human-control requirements when the feature uses AI.
9. Create a test matrix and small implementation slices.

## Phase 2: implementation after the plan is clear

- Implement one small slice at a time and keep changes focused on the feature.
- Prefer table/page extensions and event subscribers when extending standard objects.
- Keep business logic in codeunits instead of page triggers when appropriate.
- Create or update the corresponding permissions and tests.
- After each slice, run focused diagnostics/compile checks when tools are available.
- Report unavailable compiler, symbols, test environment, or official-source verification explicitly.
- Do not refactor unrelated files.

## Final report

Report changed files, object IDs, validation performed, tests, assumptions, test gaps, and residual risks.
