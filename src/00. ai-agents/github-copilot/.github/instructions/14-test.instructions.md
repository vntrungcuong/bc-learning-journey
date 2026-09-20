---
description: Rules for Business Central AL test apps, test codeunits, handlers, TestPage, TestRequestPage, test data, traceability, and execution evidence.
applyTo: "**/Tests/**/*.al,**/Test/**/*.al,**/*.Test.al,**/*.Tests.al,**/*.Test.Codeunit.al"
---

# AL Automated Test Rules

## Traceability and scope
- Derive tests from observable requirements, acceptance criteria, changed behavior, identified risks, and regressions.
- Maintain traceability from requirement or risk to scenario and expected result.
- Cover the relevant happy, negative, boundary, exception, permission, integration, concurrency, retry/idempotency, upgrade, and recovery paths.

## Test design
- Use Arrange, Act, Assert with one clear behavioral purpose per test.
- Prefer deterministic, isolated setup and create required state instead of depending on mutable pre-existing data.
- Use standard Business Central test libraries, library codeunits, `TestPage`, `TestRequestPage`, and handler methods when appropriate and available.
- Avoid hard-coded environment-specific values, execution-order dependencies, sleeps, and shared mutable state.
- Validate business outcomes and durable side effects rather than private implementation details.

## Data and cleanup
- Generate unique test data and clean up when the test framework or transaction model does not isolate changes.
- Test dimensions, currencies, dates, number series, companies, permissions, locales, and posting setup when relevant.
- Keep test helper libraries focused and reusable.

## Evidence
- Distinguish these states explicitly: Designed, Implemented, Compiled, Executed, Passed, Failed, and Blocked.
- Never equate compilation with test execution or success.
- Report environment, test runner, filters, failures, diagnostics, manual gaps, and untested risks.
- Do not fabricate coverage percentages or execution evidence.
