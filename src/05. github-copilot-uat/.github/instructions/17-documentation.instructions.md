---
description: Rules for Business Central requirements, solution designs, technical specifications, ADRs, test documents, runbooks, README files, release notes, and user guidance.
applyTo: "**/*.md,**/docs/**/*.txt,**/documentation/**/*.txt"
---

# Documentation Rules

## Purpose and audience
- Identify the document type, owner, audience, lifecycle stage, source of truth, and approval status.
- Keep business, functional, architecture, technical, test, deployment, and operational concerns clearly separated while maintaining traceability.
- Use clear English technical terminology unless the requested audience requires another language.

## Requirement and functional documents
- Capture business objective, AS-IS/TO-BE, actors, prerequisites, setup, rules, exceptions, roles, data, reports, integrations, acceptance criteria, assumptions, and out-of-scope items.
- Distinguish FIT, GAP, workaround, configuration, integration, and unresolved decisions.
- Do not invent customer decisions or mark assumptions as approved requirements.

## Architecture and technical documents
- Record context, options, decision, rejected alternatives, trade-offs, components, data flow, dependencies, interfaces, security, performance, scale, database growth, retention, observability, deployment, upgrade, rollback, and residual risks.
- Reference verified Business Central objects, events, APIs, and source locations.
- Keep diagrams and examples consistent with the implemented solution.

## Test and operations documents
- Maintain requirement-to-test traceability and distinguish designed, implemented, compiled, executed, passed, failed, blocked, and manual scenarios.
- Runbooks must include trigger/symptom, scope, prerequisites, safe diagnostic steps, expected evidence, remediation, rollback/escalation, and ownership.
- Release notes must describe user-visible changes, setup, permissions, migration, compatibility, known limitations, and validation evidence.

## Maintenance
- Prefer relative repository links for project files.
- Do not include credentials, tokens, confidential customer data, or unsafe operational commands.
- Update documentation in the same change when behavior, setup, contracts, deployment, tests, or support procedures change.
- Mark obsolete guidance and preserve decision history where useful.
