---
name: bc-solution-design
description: Create or independently review an end-to-end Business Central solution architecture from approved requirements and FIT/GAP results. Use for cross-module, integration, workflow, data, reporting, security, or operational design.
---

# Business Central Solution Design

## Purpose
Define the end-to-end solution boundary and ensure functional needs are met through a supportable Business Central architecture.

## Primary agents
- `Solution Architect - Solution Design (Custom)` for design
- `Technical Architect - Solution Review (Custom)` for independent review

## Inputs
- Structured requirements and acceptance criteria
- FIT/GAP analysis
- Existing application landscape, Business Central environments, apps, integrations, data volumes, security model, and operational constraints

## Workflow
1. **Confirm scope and decisions**
   - Validate requirement readiness, assumptions, priorities, non-functional requirements, and exclusions.
2. **Define solution context**
   - Systems, users, companies, environments, modules, external parties, system of record, and trust boundaries.
3. **Design the business solution**
   - Standard configuration, process, workflow, reports, permissions, extension, integration, migration, and operational capabilities.
4. **Define boundaries**
   - Standard Business Central versus custom extension versus ISV versus Power Platform/Azure/external service.
   - Identify ownership and support responsibility for every component.
5. **Design cross-cutting concerns**
   - Security, segregation of duties, privacy, performance, scalability, availability, auditability, localization, retention, monitoring, upgrade, and support.
6. **Evaluate alternatives**
   - Compare viable options and document rejected alternatives and trade-offs.
7. **Check completeness**
   - Trace every accepted requirement to a solution component and testable outcome.
8. **Gate the design**
   - Mark Approved for Technical Design, Approved with Conditions, or Blocked.

## Required output
- Executive solution summary
- Context and component diagram in text or Mermaid when appropriate
- Process and data flow
- Component ownership matrix
- Standard/configuration/custom/ISV/integration decisions
- Data and migration approach
- Identity, permission, and trust-boundary design
- Integration and failure-recovery design
- Reporting and analytics design
- Non-functional requirements and capacity assumptions
- Environment, deployment, monitoring, and support approach
- Alternatives and Architecture Decision Records required
- Risks, mitigations, open decisions, and human gates
- Requirement-to-component traceability
- Handoff to `al-technical-design`

## Common guardrails
- Follow `.github/copilot-instructions.md`, applicable `.github/instructions/*.instructions.md`, the selected Custom Agent, `app.json`, and established repository conventions.
- Treat current workspace source, downloaded symbols, compiler output, analyzer output, test evidence, and approved project documents as evidence. Separate verified facts from assumptions.
- Prefer standard Business Central features, setup, extension objects, published events, and supported APIs before custom frameworks or copied standard logic.
- Never invent AL objects, fields, events, procedures, signatures, platform behavior, environment facts, business decisions, or test results.
- Keep work scoped. Preserve unrelated changes. Do not commit, merge, publish to production, change dependencies, perform destructive data operations, or broaden permissions without explicit approval.
- Escalate a human gate for financial posting behavior, destructive schema/data changes, public API breaking changes, security boundaries, dependency/app identity changes, production deployment, or unresolved material business rules.
