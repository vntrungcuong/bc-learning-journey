---
name: bc-fit-gap-analysis
description: Assess a structured requirement against standard Business Central capabilities and classify FIT, configuration, GAP, workaround, extension, integration, or process change. Use before architecture and estimation.
---

# Business Central FIT/GAP Analysis

## Purpose
Determine how much of a requirement can be satisfied by standard Business Central and identify the smallest justified gap solution.

## Primary agent
`Functional Consultant - Solution Analysis (Custom)`

## Prerequisite
A structured requirement or approved functional summary. If the requirement is incomplete, first use `bc-requirement-analysis`.

## Workflow
1. **Map the requirement to Business Central**
   - Identify functional area, business process, relevant setup, permissions, workflow, reports, APIs, and available extensions/apps.
2. **Inspect standard capability first**
   - Verify relevant standard behavior from current product documentation, environment, existing configuration, symbols, or approved internal references.
   - Do not classify from memory alone when evidence is available.
3. **Classify each requirement line**
   - `FIT`: standard behavior satisfies the requirement.
   - `FIT-CONFIG`: standard behavior requires setup, personalization, workflow, permission, or report configuration.
   - `FIT-PROCESS`: requirement can be met by an approved business-process change.
   - `WORKAROUND`: feasible temporary or lower-value alternative with known limitations.
   - `GAP-EXTENSION`: AL extension is required.
   - `GAP-INTEGRATION`: external system, API, Power Platform, or middleware is required.
   - `GAP-ISV`: an AppSource/ISV solution may be more appropriate.
   - `UNRESOLVED`: insufficient evidence or business decision.
4. **Evaluate options**
   - Compare standard setup, process change, personalization, workflow, report/layout, extension, integration, and ISV options.
   - Record user impact, ownership, limitations, licensing, security, data, upgrade, support, and operational implications.
5. **Recommend the response**
   - Prefer the least-custom option that meets approved acceptance criteria.
   - Identify dependencies and decisions needed before design.

## Required output
- FIT/GAP matrix with requirement ID
- Standard capability and evidence
- Classification and rationale
- Setup/process/workaround details
- Gap statement
- Options and trade-offs
- Recommended option
- Functional risks and assumptions
- Licensing, permission, localization, reporting, and integration notes
- Updated acceptance criteria where approved
- Handoff to `bc-solution-design`

## Common guardrails
- Follow `.github/copilot-instructions.md`, applicable `.github/instructions/*.instructions.md`, the selected Custom Agent, `app.json`, and established repository conventions.
- Treat current workspace source, downloaded symbols, compiler output, analyzer output, test evidence, and approved project documents as evidence. Separate verified facts from assumptions.
- Prefer standard Business Central features, setup, extension objects, published events, and supported APIs before custom frameworks or copied standard logic.
- Never invent AL objects, fields, events, procedures, signatures, platform behavior, environment facts, business decisions, or test results.
- Keep work scoped. Preserve unrelated changes. Do not commit, merge, publish to production, change dependencies, perform destructive data operations, or broaden permissions without explicit approval.
- Escalate a human gate for financial posting behavior, destructive schema/data changes, public API breaking changes, security boundaries, dependency/app identity changes, production deployment, or unresolved material business rules.
