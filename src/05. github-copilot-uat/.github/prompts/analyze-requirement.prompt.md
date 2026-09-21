---
name: analyze-requirement
description: Perform focused Business Central requirement and FIT/GAP analysis without starting implementation.
agent: functional-solution-analyst
argument-hint: 'Provide requirement text or attach a document; optionally specify focus areas and desired depth.'
---

# Analyze a Business Central Requirement

Analyze the supplied document, selected text, or user input using `bc-requirement-analysis` and `bc-fit-gap-analysis`.

Requirement:
${input:requirement:Describe the requirement or reference the attached document/selection}

Focus, if any:
${input:focus:Examples: Finance posting, Inventory, API, workflow, report, permissions, localization, or all}

## Scope
- Produce analysis only. Do not design AL objects or modify files.
- Check standard Business Central behavior before classifying a gap.
- Maintain traceability from requirement statement to classification and acceptance criteria.

## Output
1. Requirement summary and source confidence
2. AS-IS / TO-BE
3. Actors, setup, rules, exceptions, data, reports, integrations, permissions, and compliance
4. FIT/GAP matrix with evidence and rationale
5. Acceptance criteria with IDs
6. Preliminary test scenarios
7. Assumptions, contradictions, unresolved decisions, and risks
8. Readiness: Ready, Ready with Assumptions, or Blocked
9. Recommended next agent and concise handoff
