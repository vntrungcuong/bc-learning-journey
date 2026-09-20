---
name: feature-from-text
description: Start the governed Business Central feature workflow from a text requirement.
agent: functional-solution-analyst
argument-hint: 'Describe the business requirement, current behavior, expected behavior, examples, and constraints.'
---

# Start Feature Workflow from Text

Treat the following user input as the initial Business Central feature or change requirement:

${input:requirement:Describe the requirement, current and expected behavior, examples, constraints, and acceptance criteria}

## Mission
Normalize the text into a structured functional requirement. Apply `bc-requirement-analysis` and `bc-fit-gap-analysis`, then prepare a handoff to `Solution Architect - Solution Design (Custom)`.

## Required work
1. Separate facts, assumptions, inferred needs, contradictions, and missing decisions.
2. Identify objective, actors, AS-IS, TO-BE, trigger, prerequisites, setup, rules, exceptions, outputs, ownership, affected modules/companies, data, reports, integrations, permissions, localization, and compliance.
3. Check standard Business Central capability before recommending customization.
4. Classify every requirement as FIT, FIT-CONFIG, FIT-PROCESS, WORKAROUND, GAP-EXTENSION, GAP-INTEGRATION, GAP-ISV, or UNRESOLVED.
5. Define observable acceptance criteria with IDs and preliminary happy, negative, boundary, permission, and end-to-end scenarios.
6. Mark Ready, Ready with Assumptions, or Blocked.

## Human gate
Stop at analysis when missing information can materially affect financial results, data integrity, compliance, security, public contracts, or core process behavior. Do not invent a business decision.

## Output
- Structured Functional Requirement Brief
- FIT/GAP matrix
- Acceptance criteria and preliminary test matrix
- Assumptions, gaps, decisions, dependencies, and risks
- Readiness decision
- Handoff package for `Solution Architect - Solution Design (Custom)`

Do not modify source files.
