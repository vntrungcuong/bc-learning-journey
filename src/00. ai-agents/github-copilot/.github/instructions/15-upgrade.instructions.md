---
description: Rules for Business Central install and upgrade codeunits, schema evolution, obsolete objects, data migration, compatibility, and rollback.
applyTo: "**/Upgrade/**/*.al,**/Install/**/*.al,**/*Upgrade*.al,**/*Install*.al"
---

# Install, Upgrade, and Schema Rules

## Change classification
- Treat destructive schema changes, field/object renumbering, dependency changes, and data transformation as high risk.
- Preserve customer data and compatibility unless migration/removal is explicitly approved.
- Never reuse removed field IDs, object IDs, enum values, or names in ways that can corrupt upgrade semantics.

## Install and upgrade design
- Keep install logic limited to first-install initialization and keep upgrade logic version-aware and data-focused.
- Make migrations deterministic, restart-safe where practical, bounded, and safe across companies.
- Use upgrade tags or the project-approved mechanism to prevent duplicate execution.
- Define preconditions, ordering, dependencies, company iteration, commit strategy, telemetry, failure recovery, and rollback limitations.

## Obsolete lifecycle
- Use appropriate obsolete states, reasons, and tags.
- Preserve old data long enough to migrate and verify it before removal.
- Review public APIs, events, interfaces, reports, permissions, and integrations affected by obsolete elements.

## Scale and validation
- Assess migration volume, lock duration, index/write cost, service limits, and maintenance window.
- Test fresh install, supported upgrade paths, interrupted/restarted upgrade, multiple companies, missing/legacy data, permissions, and post-upgrade behavior.
- Document irreversible steps, backups/export assumptions, residual data, and human approval gates.
