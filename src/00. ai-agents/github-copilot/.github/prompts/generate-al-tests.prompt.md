---
name: generate-al-tests
description: Create a traceable Business Central AL test matrix and focused automated tests for a feature or fix.
agent: al-test-engineer
argument-hint: 'Reference requirement/change; include acceptance criteria, risks, files, test app, and execution environment.'
---

# Generate and Validate AL Tests

Use `al-test-development`.

Requirement or change:
${input:change:Reference the feature, issue fix, acceptance criteria, changed files, or current conversation}

Known risks and environment:
${input:context:Describe permissions, integrations, posting, data volume, upgrade paths, test app, runner, or limitations}

## Required work
1. Build a requirement/risk-to-test traceability matrix.
2. Cover relevant happy, negative, boundary, validation, state-transition, permission, regression, integration, duplicate/idempotency, concurrency, retry/recovery, localization, performance, install/upgrade, and manual UAT cases.
3. Use deterministic isolated data and standard Business Central test libraries when available.
4. Implement focused Arrange-Act-Assert tests using `TestPage`, `TestRequestPage`, handlers, test doubles, or helper libraries only where appropriate.
5. Validate observable business outcomes, not private implementation details.
6. Build/compile the test project and execute tests when tooling/environment supports it.
7. Do not weaken expected outcomes merely to make tests pass.

## Output
- Test matrix with scenario ID, requirement/risk, preconditions, Arrange, Act, expected result, level, status, and evidence
- Test files/objects created or changed
- Test-data strategy and dependencies
- Build and execution evidence
- Defects, retest status, blocked/unexecuted/manual scenarios
- Residual coverage gaps and `HUMAN REVIEW REQUIRED`

Distinguish Designed, Implemented, Compiled, Executed, Passed, Failed, Blocked, and Manual. Never equate compilation with execution.
