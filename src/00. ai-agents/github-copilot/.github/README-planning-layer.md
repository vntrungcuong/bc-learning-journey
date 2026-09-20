# Business Central Persistent Planning Layer

## Purpose

The Planning Layer creates a version-controlled plan that connects Functional Analysis, Solution Architecture, Technical Design, Development, Testing, Solution Review, and Human Acceptance. It allows work to continue safely in another session without depending on chat history.

## Files

```text
.github/agents/implementation-planner.agent.md
.github/skills/bc-implementation-planning/SKILL.md
.github/skills/bc-implementation-planning/PLAN-TEMPLATE.md
.github/instructions/18-work-plan.instructions.md
docs/plans/active/
docs/plans/completed/
docs/plans/archived/
```

## Integrated workflow

### Feature/change

```text
Functional Consultant
  -> Solution Architect
  -> Technical Architect - Technical Design
  -> Technical Architect - Implementation Planning
  -> HUMAN PLAN REVIEW
  -> AL Developer
  -> QA/Test Engineer
  -> Solution Reviewer
  -> HUMAN ACCEPTANCE
```

### Issue/fix

```text
Issue Diagnosis
  -> Functional/Solution/Technical Architecture when required
  -> Implementation Planning after verified root cause
  -> HUMAN PLAN REVIEW
  -> AL Developer
  -> QA/Test Engineer
  -> Solution Reviewer
  -> HUMAN ACCEPTANCE
```

## Plan lifecycle

```text
Draft -> Under Review -> Approved -> In Progress -> Testing
      -> Ready for Human Review -> Completed
```

Exception states:

```text
Blocked
Changes Required
Cancelled
```

Only a human approves a plan and accepts completion.

## How to start

1. Complete the required upstream role outputs.
2. Select `Technical Architect - Implementation Planning (Custom)` or invoke `/bc-implementation-planning`.
3. Provide design/issue references and desired plan path.
4. Review the generated plan and change status to `Approved` only after human approval.
5. Use the agent handoff `Start Approved Implementation`.

## Resume in a new session

```text
Use the approved plan at docs/plans/active/<plan>.plan.md.
Read the entire plan and referenced inputs. Confirm plan status,
completed evidence, blockers, decisions, and resume contract.
Continue only from the first eligible incomplete approved step.
Update the plan after every meaningful increment.
```

## Maintenance rule

The plan is the execution state, not the source of business truth. Requirements and approved designs remain authoritative for behavior and architecture. The plan references those artifacts and records execution, validation, evidence, deviations, blockers, and next action.
