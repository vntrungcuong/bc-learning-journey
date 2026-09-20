---
name: develop-integration
description: Execute an approved Business Central integration plan with secure, reliable, observable, and resumable delivery controls.
agent: al-developer
argument-hint: "planPath=docs/plans/active/... approvedStep=Pxx contract=..."
---

# Develop a Business Central Integration

Use `al-integration-development` and the approved persistent plan.

Plan path:
${input:planPath:Path to the approved .plan.md file}

Approved step:
${input:stepId:Plan step ID}

Contract reference:
${input:contract:Reference the approved integration contract and design}

## Required work

1. Read the plan and approved contract.
2. Confirm system of record, identity, contract version, volume, latency, idempotency, retry, failure, recovery, retention, and monitoring assumptions.
3. Implement only the approved plan step.
4. Build and validate applicable scenarios.
5. Update the plan with evidence, decisions, deviations, blockers, next step, and resume contract.
6. Route material contract/design changes back to Planning or Architecture.

Do not expose secrets or publish to production.
