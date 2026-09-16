---
name: al-tests
description: "Instructions for creating and reviewing Business Central AL tests."
applyTo: "**/*Test*.al"
---

# AL Test Standards

- Structure tests clearly as Arrange, Act, and Assert.
- Use deterministic and isolated test data.
- Test business behavior rather than implementation details.
- Include positive, negative, boundary, and permission scenarios where relevant.
- Test duplicate processing and retry behavior for integrations.
- Do not depend on test execution order.
- Use meaningful test procedure names.
- Avoid unnecessary database access and expensive setup.
- Include upgrade tests when schema or data migration is changed.
- Report test gaps explicitly.
- Read `app.json` and the feature's permission requirements before creating tests.
- Cover object-specific behavior for tables, pages, codeunits, reports, queries, XMLports, APIs, enums, and interfaces when relevant.
- Keep test data setup deterministic, isolated, and independent of execution order.
- Use BC test framework patterns such as `[Test]`, `[TestPermissions]`, `TestPage`, and `TestRequestPage` when applicable to the target behavior.
- Add focused tests for reports/layouts, APIs, XMLports, permissions, integrations, Job Queue behavior, upgrade codeunits, and AI fallbacks when relevant.
- State how tests should be executed and distinguish tests that require a configured environment from tests that can run locally.
- Use test libraries or reusable setup only when they reduce duplication without hiding the behavior under test.