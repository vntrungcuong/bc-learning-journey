---
name: bc-implementation-planning
description: Create, review, update, resume, and close persistent Business Central implementation plans from approved functional, solution, technical, or verified issue-analysis inputs. Use before coding, when resuming work in a new session, when material re-planning is required, or when plan evidence/status must be updated.
argument-hint: "[requirement/design/issue reference] [plan path or new plan title]"
user-invocable: true
disable-model-invocation: false
---

# Business Central Implementation Planning

## Purpose

Create a persistent execution artifact that connects the current role-based workflow to implementation, testing, review, and human approval without relying on chat history.

## Resource

Use [PLAN-TEMPLATE.md](./PLAN-TEMPLATE.md) for new plans. Do not remove required sections. Use the repository's `18-work-plan.instructions.md` rules for plan files.

## Trigger conditions

Use this skill when:

- Approved Functional, Solution, and Technical Design outputs must become an executable checklist.
- A verified issue root cause requires a correction plan.
- Work must continue in a new session or be transferred to another developer.
- Testing or review exposes a material change requiring re-planning.
- An existing plan requires status, evidence, blockers, decisions, or resume updates.

Do not use this skill to approve business, architecture, security, financial, or production decisions.

## Workflow

### 1. Determine mode

Choose exactly one:

- `Create`: no existing plan.
- `Review`: validate completeness and readiness without execution.
- `Update`: incorporate approved change or new evidence.
- `Resume`: identify the first eligible incomplete step.
- `Re-plan`: preserve history and update material scope/sequencing/validation.
- `Close`: prepare for human acceptance; do not self-approve.

### 2. Validate inputs

Confirm requirement/issue source, approved role outputs, acceptance criteria, technical context, dependencies, risks, and human gates. Mark missing information and stop if it materially changes the solution.

### 3. Build traceability

Map:

```text
Requirement/Acceptance ID
    -> Design decision
    -> Plan step ID
    -> Validation scenario
    -> Evidence
    -> Residual risk
```

### 4. Decompose work

Create small, ordered, reviewable steps that normally cover:

1. Prerequisites and source verification.
2. Data model/schema.
3. Domain logic and events.
4. UI, report, API, integration, or background behavior.
5. Permissions, localization, telemetry, retention, and cleanup.
6. Build/analyzer validation.
7. Automated and manual tests.
8. Documentation and operational readiness.
9. Independent solution review.
10. Human acceptance.

Include only applicable steps. Never force irrelevant work into a plan.

### 5. Define each step

For every step record objective, prerequisites, artifacts, action, expected result, validation, evidence, rollback/containment, dependencies, human gate, and status.

### 6. Persist state

Update status, current phase, checklist, evidence, decisions, deviations, blockers, last completed step, next eligible step, and resume instruction after meaningful progress.

### 7. Gate execution

- `Draft` or `Under Review`: no coding handoff.
- `Approved`: may hand off to Development.
- `In Progress`: resume from the first eligible incomplete step.
- `Blocked` or `Changes Required`: return to Planning or the responsible upstream role.
- `Testing`: hand off to QA.
- `Ready for Human Review`: hand off to Solution Review/human gate as appropriate.
- `Completed`: human acceptance must be recorded.

## Quality checks

Before returning a plan, verify:

- A new session can understand objective, scope, decisions, current state, and next action without reading chat history.
- No placeholder remains except explicitly unresolved information.
- No step is marked complete without evidence.
- Risks and acceptance criteria are traceable.
- Material changes route upstream.
- The plan contains no secret or sensitive payload.

## Output

Return plan path, mode, status, readiness, blockers, first/next eligible step, human gates, and resume instruction.
