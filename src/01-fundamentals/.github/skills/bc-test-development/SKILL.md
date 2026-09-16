---
name: bc-test-development
description: "Use for Business Central AL automated test development covering Test Codeunits, permissions, pages, reports, APIs, XMLports, integrations, Job Queue, and upgrades."
user-invocable: true
---

# Business Central Test Development

## Workflow

1. Read `app.json`, `al-tests.instructions.md`, the feature code path, and relevant test documentation.
2. Identify behavior, state transitions, permissions, transaction boundaries, integrations, and upgrade impact.
3. Choose the smallest suitable BC test mechanism: Test Codeunit, `TestPage`, `TestRequestPage`, report/API/XMLport harness, permission test, or upgrade test.
4. Create deterministic isolated data with Arrange/Act/Assert structure.
5. Cover positive, invalid, boundary, empty, duplicate, retry, permission, security exposure, and upgrade scenarios as applicable.
6. Keep tests independent of execution order and avoid testing implementation details unnecessarily.
7. Run focused tests and diagnostics when available; record unavailable tooling and environment prerequisites.
8. Report failures as either product defects, test defects, environment/configuration issues, or unverified behavior.

## Required output

- Test matrix mapped to behavior.
- Files and test procedures.
- Execution command or environment steps.
- Results and evidence.
- Test gaps, assumptions, and residual risks.

Use English comments and concise documentation for non-obvious test setup. Do not weaken production behavior solely to make a test pass.
