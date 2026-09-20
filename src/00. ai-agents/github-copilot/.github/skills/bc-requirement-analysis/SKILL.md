---
name: bc-requirement-analysis
description: Transform an attached document or text description into a structured, traceable Business Central requirement. Use before solution design for new features, changes, unclear requests, or business issues.
---

# Business Central Requirement Analysis

## Purpose
Create an evidence-based functional requirement that can be handed to Solution Architecture without losing business intent or hiding uncertainty.

## Primary agent
`Functional Consultant - Solution Analysis (Custom)`

## Inputs
- Attached requirement, ticket, email export, workshop note, screenshot description, or text request.
- Existing process documentation, setup, relevant Business Central records/pages, and known constraints.
- Current behavior, expected behavior, examples, errors, and affected roles when available.

## Workflow
1. **Classify the request**
   - Feature, change, defect, compliance, report, integration, migration, workflow, security, performance, or operational request.
   - Identify lifecycle stage, stakeholders, urgency, and whether the source is approved or provisional.
2. **Extract evidence**
   - Record explicit facts, quoted business rules, examples, constraints, and acceptance statements.
   - Separate facts from assumptions, inferred needs, contradictions, and missing decisions.
3. **Model the business process**
   - Describe AS-IS and TO-BE at an appropriate level.
   - Identify actors, trigger, prerequisites, sequence, decisions, exceptions, outputs, and ownership.
4. **Define functional scope**
   - In scope, out of scope, impacted companies, modules, roles, master/transaction data, setup, workflow, reports, integrations, historical data, and localization.
5. **Define behavior**
   - Happy path, negative paths, boundary cases, state transitions, validations, messages, permissions, audit needs, and recovery expectations.
6. **Define acceptance criteria**
   - Use observable, testable statements. Avoid implementation-specific criteria unless explicitly required.
7. **Assess readiness**
   - Mark requirement as Ready, Ready with Assumptions, or Blocked.
   - Escalate critical gaps rather than inventing business decisions.

## Required output
- Requirement summary
- Source and confidence
- Business objective and expected value
- AS-IS / TO-BE
- Actors and responsibilities
- Preconditions and setup
- Business rules and state transitions
- Data, reporting, integration, security, and compliance impact
- In scope / out of scope
- Assumptions, contradictions, and open decisions
- Acceptance criteria with IDs
- Preliminary test scenarios
- Readiness decision
- Handoff to `bc-fit-gap-analysis`

## Common guardrails
- Follow `.github/copilot-instructions.md`, applicable `.github/instructions/*.instructions.md`, the selected Custom Agent, `app.json`, and established repository conventions.
- Treat current workspace source, downloaded symbols, compiler output, analyzer output, test evidence, and approved project documents as evidence. Separate verified facts from assumptions.
- Prefer standard Business Central features, setup, extension objects, published events, and supported APIs before custom frameworks or copied standard logic.
- Never invent AL objects, fields, events, procedures, signatures, platform behavior, environment facts, business decisions, or test results.
- Keep work scoped. Preserve unrelated changes. Do not commit, merge, publish to production, change dependencies, perform destructive data operations, or broaden permissions without explicit approval.
- Escalate a human gate for financial posting behavior, destructive schema/data changes, public API breaking changes, security boundaries, dependency/app identity changes, production deployment, or unresolved material business rules.
