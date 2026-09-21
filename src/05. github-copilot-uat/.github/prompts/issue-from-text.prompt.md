---
name: issue-from-text
description: Start evidence-first Business Central issue diagnosis from a text description.
agent: al-debugger
argument-hint: 'Describe actual versus expected behavior, error, environment, reproduction steps, evidence, and recent changes.'
---

# Diagnose Issue from Text

Diagnose this Business Central issue using `al-issue-diagnosis`:

${input:issue:Provide actual behavior, expected behavior, error or stack trace, environment, reproduction steps, evidence, and recent changes}

## Mission
Establish the strongest evidence-based diagnosis possible without inventing environment facts or causes.

## Required work
1. Normalize the issue into actual/expected behavior, impact, environment, frequency, scope, reproduction, evidence, data/setup, permissions, and recent-change fields.
2. Classify the issue and trace Architecture, Functional behavior, then Technical execution.
3. Inspect relevant source, symbols, events, configuration, permissions, data state, diagnostics, logs, telemetry, package/version evidence, and recent scoped changes when available.
4. Rank falsifiable hypotheses and use the cheapest safe diagnostic checks.
5. Mark Verified Root Cause, Probable Cause, or Unresolved.
6. Propose the smallest root-cause fix only after sufficient evidence. Keep mitigation and workaround separate.
7. Define regression tests, impact, rollback, monitoring, and required human gates.

## Routing and output
Return the normalized incident, evidence, classification, hypotheses, diagnostic results, root-cause status, and one of:
- Functional/architecture handoff
- Approved technical correction handoff to `Technical Architect - Implementation Planning (Custom)`, which routes through human plan review before `Technical Consultant - AL Development (Custom)`
- Blocked by missing evidence

Do not perform broad refactoring or production changes.
