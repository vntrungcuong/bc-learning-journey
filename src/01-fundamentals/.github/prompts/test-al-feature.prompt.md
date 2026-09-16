---
name: test-al-feature
description: "Design or implement focused Business Central AL tests for a feature."
---

Design or create tests for the following AL feature: <feature or behavior>.

Before writing tests:

1. Read `app.json`, the repository instructions, and the feature's code path.
2. Identify the behavior to protect, input data, permissions, and transaction boundary.
3. Determine the test codeunit/file name according to the existing convention.
4. Choose the smallest suitable BC test mechanism: Test Codeunit, `TestPage`, `TestRequestPage`, report/API/XMLport harness, permission test, integration test, or upgrade test.

Cover the following where applicable:

- Positive path.
- Invalid input and error messages.
- Boundary values and empty data.
- Duplicate processing, retry, and idempotency.
- Permissions and data exposure.
- Page actions, report output, query/API, or XMLport behavior.
- Enum/interface compatibility.
- Upgrades or data migration.
- AI timeout, fallback, permission, privacy, and human-confirmation behavior when applicable.

Use Arrange/Act/Assert, deterministic test data, and tests that are independent of execution order. Report how tests should be executed, scenarios that cannot be tested, unavailable environment prerequisites, and why. Do not modify production code merely to make testing easier without stating the trade-offs.
