---
name: feature-from-document
description: Start the governed Business Central feature workflow from an attached requirement document.
agent: functional-solution-analyst
argument-hint: 'Attach the requirement document and optionally add scope, constraints, or target release.'
---

# Start Feature Workflow from a Document

Use the attached document as the primary requirement source for a Business Central feature or change request.

## Mission
Complete the Functional Consultant stage only. Apply `bc-requirement-analysis` and `bc-fit-gap-analysis`, then prepare a traceable handoff to `Solution Architect - Solution Design (Custom)`.

## Context handling
- Inspect the attached document completely, including tables, appendices, examples, acceptance criteria, and stated constraints.
- Use repository evidence and verified Business Central behavior where available.
- Separate explicit requirements from assumptions, interpretations, contradictions, and missing decisions.
- If multiple documents conflict, identify the conflict and source. Do not silently choose one.
- Do not modify source files.

## Required work
1. Classify the request and identify business objective, stakeholders, affected process, companies, modules, roles, data, setup, reports, integrations, localization, and compliance needs.
2. Describe AS-IS and TO-BE behavior, including happy path, exceptions, boundaries, state transitions, and operational ownership.
3. Perform a standard Business Central capability check and classify each requirement as FIT, FIT-CONFIG, FIT-PROCESS, WORKAROUND, GAP-EXTENSION, GAP-INTEGRATION, GAP-ISV, or UNRESOLVED.
4. Define observable acceptance criteria with stable IDs and preliminary test scenarios.
5. Identify functional risks, dependencies, out-of-scope items, and decisions requiring human approval.
6. Decide whether the requirement is Ready, Ready with Assumptions, or Blocked.

## Output
Return:
- Functional Requirement Brief
- FIT/GAP matrix
- Acceptance-criteria matrix
- Assumptions, contradictions, open decisions, and risks
- Readiness decision
- Concise handoff package for `Solution Architect - Solution Design (Custom)`

Do not design AL objects or implement code in this stage.
