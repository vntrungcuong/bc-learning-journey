---
description: Rules for creating, reviewing, updating, resuming, and closing persistent Business Central implementation plan files.
applyTo: "**/docs/plans/**/*.plan.md"
---

# Persistent Work Plan Rules

## Scope

Apply these rules to every Business Central plan under `docs/plans/`.

## Storage and naming

- Active: `docs/plans/active/<work-item>-<short-title>.plan.md`.
- Completed: `docs/plans/completed/` only after human acceptance.
- Archived or cancelled: `docs/plans/archived/` with the reason retained.
- Use lowercase kebab-case filenames. Omit `<work-item>-` only when no identifier exists.
- Do not create duplicate plans for the same scope. Update the existing plan and preserve history.

## Required metadata

Every plan must declare title, plan ID, work item, status, current phase, owner if supplied, created/updated dates if known, requirement source, design references, branch if known, and target release if supplied.

Do not invent dates, owners, estimates, releases, or approvals.

## Status vocabulary

Use exactly one:

`Draft`, `Under Review`, `Approved`, `In Progress`, `Blocked`, `Testing`, `Changes Required`, `Ready for Human Review`, `Completed`, or `Cancelled`.

Only a human may approve a plan, accept completion, waive a mandatory gate, or authorize a production action.

## Checklist requirements

- Use stable IDs: `P01`, `P02`, and so on.
- Each step must contain objective, prerequisites, affected artifacts, implementation action, expected result, validation, required evidence, rollback/containment, dependencies, human gate, and status.
- Use `[ ]` for incomplete and `[x]` only when validation and evidence are recorded.
- Never infer completion from code presence, a clean build, or authored tests alone.
- Do not reorder or renumber completed step IDs. Add new steps and document why.

## Traceability

- Link requirement and acceptance IDs to implementation and validation step IDs.
- Link identified risks to mitigations, tests, evidence, and residual risk.
- Record design deviations with approver/decision status when supplied.

## Evidence discipline

- Record commands/tools used, result summaries, relevant files/objects, diagnostics, and test status.
- Distinguish `Designed`, `Implemented`, `Compiled`, `Executed`, `Passed`, `Failed`, `Blocked`, and `Manual`.
- Never create evidence for an action that did not occur.
- Preserve failed evidence and document the correction/retest result.
- Do not store secrets, tokens, credentials, customer-sensitive payloads, or production data.

## Resume contract

Maintain:

- Last completed step.
- Next eligible step.
- Current blockers.
- Open decisions and assumptions.
- Files changed.
- Latest build/test/review evidence.
- Exact instruction for the next session.

A new session must read the plan before editing source and continue only from the first eligible incomplete approved step.

## Change control

- Minor implementation detail within approved design: update the plan and continue.
- Material scope, architecture, schema, public contract, permission, security, posting, dependency, migration, or rollback change: set `Blocked` or `Changes Required` and return to Planning or the appropriate upstream role.
- Do not silently expand scope or rewrite history.

## Completion

Set `Ready for Human Review` only after required implementation, verification, evidence, documentation, and independent review are sufficiently complete.

Set `Completed` and move to `docs/plans/completed/` only after explicit human acceptance is recorded.
