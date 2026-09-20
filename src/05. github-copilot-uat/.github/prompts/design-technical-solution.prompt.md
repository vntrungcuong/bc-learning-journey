---
name: design-technical-solution
description: Produce an implementation-ready Business Central AL technical design and route it into persistent implementation planning.
agent: technical-architect
argument-hint: "Provide approved solution design, feature scope, constraints, expected volume, and relevant source paths."
---

# Design the AL Technical Solution

Use `al-technical-design` and relevant performance, security, and upgrade review skills.

Approved solution input:
${input:solutionDesign:Reference approved functional and solution design artifacts}

Technical focus:
${input:focus:Describe feature, files, integration, schema, posting, performance, security, or upgrade focus}

## Required work

1. Verify repository and symbol context.
2. Define affected objects, data, transactions, validation, permissions, integrations, telemetry, tests, performance, storage, and upgrade behavior.
3. Define design-level implementation outline, evidence requirements, rollback constraints, and human gates.
4. Do not modify source files.
5. End with a handoff to `Technical Architect - Implementation Planning (Custom)`. The Planning Agent creates the persistent execution checklist under `docs/plans/active/`.

## Output

Return verified context, complete technical design, cross-cutting assessments, risks, validation strategy, and planning handoff context.
