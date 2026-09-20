---
name: design-solution
description: Create or review an end-to-end Business Central solution architecture from approved functional inputs.
agent: solution-architect
argument-hint: 'Provide the approved requirement/FIT-GAP reference, scope, constraints, landscape, and non-functional needs.'
---

# Design the Business Central Solution

Use `bc-solution-design` to create or review an end-to-end solution architecture.

Input or reference:
${input:functionalBrief:Provide the approved Functional Requirement Brief and FIT/GAP result, or reference attached files}

Constraints:
${input:constraints:List environment, licensing, systems, data volume, security, availability, timeline, or support constraints}

## Required work
1. Confirm requirement readiness, assumptions, exclusions, priorities, and non-functional requirements.
2. Define solution context, systems, users, companies, environments, modules, system of record, and trust boundaries.
3. Decide standard setup/process versus extension, ISV, Power Platform, Azure, middleware, reporting, migration, or external service.
4. Define process/data flow, component ownership, security, integration recovery, reporting, migration, deployment, monitoring, retention, upgrade, and support approach.
5. Compare viable options and document trade-offs and rejected alternatives.
6. Trace each accepted requirement to a solution component and testable outcome.
7. Identify architecture decisions and human gates.

## Output
- Solution summary
- Text or Mermaid context/component flow when useful
- Component and ownership matrix
- Standard/configuration/custom/integration decisions
- Data, integration, identity/security, reporting, migration, operations, and support design
- Non-functional requirements and capacity assumptions
- Alternatives, risks, mitigations, and open decisions
- Gate: Approved for Technical Design, Approved with Conditions, or Blocked
- Handoff to `Technical Architect - Technical Design (Custom)`

Do not implement source code.
