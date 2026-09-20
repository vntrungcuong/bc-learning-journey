---
name: develop-al-object
description: Execute a focused Business Central AL object step from an approved persistent plan.
agent: al-developer
argument-hint: "planPath=docs/plans/active/... objectType=... target=... approvedStep=Pxx"
---

# Develop a Focused AL Object

Use `al-object-development` and the approved persistent plan.

Plan path:
${input:planPath:Path to the approved .plan.md file}

Approved step:
${input:stepId:Plan step ID, for example P03}

Object type and target:
${input:target:Table/Page/Codeunit/Report/Query/XMLport/API/Enum/Interface/Permission/Profile/ControlAddIn/Install/Upgrade/Test and target name}

## Required work

1. Read the plan and confirm status, prerequisites, scope, and current step.
2. Verify repository context and current symbols.
3. Implement only the approved step.
4. Build/compile and record diagnostics.
5. Update the plan checklist, evidence, decisions, deviations, blockers, next step, and resume contract.
6. Hand off to QA when implementation steps are complete.

Do not proceed without an approved plan unless an authorized human explicitly waives the persistent-plan requirement.
