---
name: al-feature-development
description: Implement an approved end-to-end Business Central feature spanning multiple AL objects. Use after functional, solution, and technical design are sufficiently clear.
---

# AL Feature Development

## Purpose
Implement a multi-object Business Central feature in controlled increments while preserving verified architecture, standard behavior, and unrelated source.

## Primary agent
`Technical Consultant - AL Development (Custom)`

## Prerequisite
Use an approved technical design. If one is missing for a material change, create or request `al-technical-design` before editing.

## Workflow
1. **Restate the approved slice**
   - Goal, acceptance criteria, files, assumptions, exclusions, and validation to perform.
2. **Prepare the workspace**
   - Read relevant instructions and source. Verify object IDs, namespaces, dependencies, symbols, events, and existing tests.
3. **Implement incrementally**
   - Work in the technical-plan order.
   - Prefer extension objects and reusable focused codeunits.
   - Update permissions, labels, data classification, setup, documentation, telemetry, and upgrade logic when required by the slice.
4. **Validate each increment**
   - Compile/build after meaningful changes.
   - Review diagnostics and fix only task-related issues.
   - Re-check the diff for unrelated edits and architecture drift.
5. **Add quality evidence**
   - Create or update focused tests through `al-test-development`.
   - Apply `al-security-review`, `al-performance-review`, and `al-upgrade-review` when triggers are present.
6. **Stop for review**
   - Do not treat a clean build as completion.

## Required output
- Implemented acceptance criteria
- Changed/created files and rationale
- Verified symbols/events used
- Build and analyzer evidence
- Test status: designed, implemented, compiled, executed, passed, failed, or blocked
- Security, performance, storage, permission, and upgrade impacts
- Assumptions, manual tests, residual risks, and rollback notes
- Explicit `HUMAN REVIEW REQUIRED`

## Common guardrails
- Follow `.github/copilot-instructions.md`, applicable `.github/instructions/*.instructions.md`, the selected Custom Agent, `app.json`, and established repository conventions.
- Treat current workspace source, downloaded symbols, compiler output, analyzer output, test evidence, and approved project documents as evidence. Separate verified facts from assumptions.
- Prefer standard Business Central features, setup, extension objects, published events, and supported APIs before custom frameworks or copied standard logic.
- Never invent AL objects, fields, events, procedures, signatures, platform behavior, environment facts, business decisions, or test results.
- Keep work scoped. Preserve unrelated changes. Do not commit, merge, publish to production, change dependencies, perform destructive data operations, or broaden permissions without explicit approval.
- Escalate a human gate for financial posting behavior, destructive schema/data changes, public API breaking changes, security boundaries, dependency/app identity changes, production deployment, or unresolved material business rules.
