---
name: al-test-development
description: Design, implement, execute, and report Business Central AL automated tests and test matrices for features, fixes, pages, reports, permissions, integrations, background jobs, performance-sensitive logic, and upgrades.
---

# AL Test Development

## Purpose
Provide traceable verification of observable Business Central behavior and transparent execution evidence.

## Primary agent
`Quality Assurance - AL Testing (Custom)`

## Workflow
1. **Build the test matrix**
   - Map requirement/risk IDs to scenario, preconditions, Arrange, Act, expected result, test level, status, and evidence.
2. **Select test levels**
   - AL unit/component, TestPage, TestRequestPage, report dataset/layout, permission, API/integration with test doubles, background/job queue, upgrade/install, performance measurement, and manual UAT.
3. **Design deterministic data**
   - Use standard Business Central test libraries where available.
   - Create isolated records/setup and avoid mutable environment dependencies.
4. **Implement tests**
   - Use Arrange-Act-Assert, one behavioral purpose per test, unique names, handlers only when interaction requires them, and assertions on observable outcomes.
5. **Cover risk-based cases**
   - Happy, negative, boundary, validation, state transition, permissions, duplicate/idempotency, concurrency, retry/recovery, localization, upgrade, and regression as relevant.
6. **Compile and execute**
   - Build the test app or project and execute tests using available tooling.
   - Investigate failures without changing expected outcomes merely to obtain green results.
7. **Report evidence honestly**
   - Distinguish Designed, Implemented, Compiled, Executed, Passed, Failed, Blocked, and Manual.

## Required output
- Test matrix with IDs and traceability
- Test files/objects created or changed
- Test data strategy and dependencies
- Build result
- Execution environment, runner/filter, outcome, and evidence
- Failed/blocked/unexecuted cases
- Regression and manual-test gaps
- Residual quality risks and `HUMAN REVIEW REQUIRED`

## Common guardrails
- Follow `.github/copilot-instructions.md`, applicable `.github/instructions/*.instructions.md`, the selected Custom Agent, `app.json`, and established repository conventions.
- Treat current workspace source, downloaded symbols, compiler output, analyzer output, test evidence, and approved project documents as evidence. Separate verified facts from assumptions.
- Prefer standard Business Central features, setup, extension objects, published events, and supported APIs before custom frameworks or copied standard logic.
- Never invent AL objects, fields, events, procedures, signatures, platform behavior, environment facts, business decisions, or test results.
- Keep work scoped. Preserve unrelated changes. Do not commit, merge, publish to production, change dependencies, perform destructive data operations, or broaden permissions without explicit approval.
- Escalate a human gate for financial posting behavior, destructive schema/data changes, public API breaking changes, security boundaries, dependency/app identity changes, production deployment, or unresolved material business rules.
