---
name: al-upgrade-review
description: Design or review Business Central schema evolution, obsolete lifecycle, dependencies, install/upgrade codeunits, data migration, version compatibility, and rollback risk.
---

# AL Upgrade and Compatibility Review

## Purpose
Protect customer data and supported upgrade paths across extension versions and Business Central platform/application updates.

## Primary agents
- `Technical Architect - Technical Design (Custom)` before implementation
- `Technical Architect - Solution Review (Custom)` after implementation

## Workflow
1. **Establish versions**
   - Current deployed app/schema, target app/schema, runtime/application/platform/dependencies, supported source versions, companies, volume, and maintenance constraints.
2. **Diff the change**
   - Objects, fields, keys, enums, APIs, events, interfaces, permissions, reports/layouts, setup, and dependencies.
3. **Classify compatibility**
   - Additive, behavioral, obsolete, breaking, destructive, data-transforming, dependency-related, or public-contract change.
4. **Design migration**
   - Install versus upgrade responsibility, upgrade tags, company iteration, ordering, preconditions, field mapping, default/data repair, batching, commits, restart safety, telemetry, and cleanup.
5. **Protect data and contracts**
   - Do not reuse IDs or enum values unsafely. Preserve obsolete data until migration is verified.
   - Version approved breaking API changes and review subscribers/consumers.
6. **Assess scale and recovery**
   - Data volume, lock duration, index/write cost, service limits, interruption, replay, backups/exports, rollback limitations, and residual data.
7. **Validate paths**
   - Fresh install, each supported upgrade path, interrupted/restarted upgrade, multiple companies, missing/legacy data, permissions, and post-upgrade behavior.

## Required output
- Version and schema comparison
- Compatibility classification
- Data/customer impact
- Migration algorithm and object/file plan
- Upgrade tags and execution ordering
- Scale, lock, maintenance-window, and storage analysis
- Test matrix and execution evidence
- Rollback/recovery limitations
- Residual risk and explicit human gate for irreversible changes

## Common guardrails
- Follow `.github/copilot-instructions.md`, applicable `.github/instructions/*.instructions.md`, the selected Custom Agent, `app.json`, and established repository conventions.
- Treat current workspace source, downloaded symbols, compiler output, analyzer output, test evidence, and approved project documents as evidence. Separate verified facts from assumptions.
- Prefer standard Business Central features, setup, extension objects, published events, and supported APIs before custom frameworks or copied standard logic.
- Never invent AL objects, fields, events, procedures, signatures, platform behavior, environment facts, business decisions, or test results.
- Keep work scoped. Preserve unrelated changes. Do not commit, merge, publish to production, change dependencies, perform destructive data operations, or broaden permissions without explicit approval.
- Escalate a human gate for financial posting behavior, destructive schema/data changes, public API breaking changes, security boundaries, dependency/app identity changes, production deployment, or unresolved material business rules.
