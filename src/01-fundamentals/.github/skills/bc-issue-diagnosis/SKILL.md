---
name: bc-issue-diagnosis
description: "Use for diagnosing hidden defects and Business Central issues involving compile, runtime, data, permissions, locking, integrations, Job Queue, upgrades, or performance regressions."
user-invocable: true
---

# Business Central Issue Diagnosis

Use this workflow for a reproducible defect or unexpected behavior. Do not jump directly to a broad refactor.

## Workflow

1. Read `app.json`, applicable instructions, and only the relevant AL/docs files.
2. Capture actual behavior, expected behavior, environment, error text, data state, and reproduction steps.
3. Classify the issue: compile, runtime, data, permission, locking/concurrency, integration, Job Queue, upgrade, UI/page, report/API/XMLport, or performance.
4. Identify the controlling code path and distinguish custom code from Microsoft standard behavior.
5. State one falsifiable root-cause hypothesis with evidence.
6. Run or propose the cheapest discriminating check.
7. Apply the smallest root-cause fix after the hypothesis is supported.
8. Add a focused regression test or explain why one cannot be added.
9. Validate with diagnostics, compile, tests, or a documented limitation.

## Required output

- Actual versus expected behavior.
- Issue classification.
- Evidence and root-cause hypothesis.
- Discriminating check and result.
- Focused fix.
- Validation performed and unavailable.
- Regression test, assumptions, and residual risks.

Do not invent AL methods, events, permissions, or Microsoft behavior. Verify relevant APIs and signatures against official documentation or AL symbols.
