---
description: Rules for Business Central table, tableextension, fields, keys, relations, FlowFields, validation, retention, and data growth.
applyTo: "**/Tables/**/*.al,**/*.Table.al,**/*.TableExt.al"
---

# Table and Table Extension Rules

## Data ownership and design
- Confirm whether the requirement belongs in a new table, an extension field, standard setup, or a non-persistent structure.
- Add only fields and keys required by approved behavior. Use stable field IDs within approved ranges.
- Define accurate captions, tooltips where surfaced, `DataClassification`, field groups, relations, and validation behavior.
- Use enums for extensible business states when appropriate. Avoid new `Option` fields for extensible concepts.
- Use `TableRelation` and validation to protect referential and business integrity where appropriate.

## Keys and access paths
- Design secondary keys for verified filters, sorting, and workloads. Avoid redundant or low-value keys.
- Consider selectivity, maintenance cost, write amplification, SumIndexFields, and tenant database impact before adding keys.
- Ensure code filters align with a suitable access path for expected data volume.

## FlowFields and calculations
- Keep FlowFields and FlowFilters purposeful. Verify the `CalcFormula`, lookup scope, filters, and expected calculation volume.
- Avoid repeatedly calculating FlowFields in large loops. Use `SetAutoCalcFields` or explicit calculation only when justified.
- Do not persist derived data merely for convenience unless consistency, recomputation, and migration are designed.

## Triggers and validation
- Keep field and table triggers deterministic and focused on data integrity.
- Avoid expensive orchestration, external calls, UI interaction, or hidden commits in table triggers.
- Publish supported events or move reusable orchestration to focused codeunits when extensibility is required.
- Distinguish validation through `Validate` from direct assignment and document intentional bypasses.

## Database growth and lifecycle
- For transaction, history, log, staging, integration, media, or audit tables, define expected growth drivers, retention, cleanup, archive, and ownership.
- Consider company scope, number-series behavior, deletion dependencies, media/blob size, index cost, and upgrade implications.
- Prefer platform telemetry over permanent custom log tables when durable business records are not required.

## Upgrade safety
- Never renumber, repurpose, or remove persisted fields without approved schema and data-upgrade analysis.
- Preserve obsolete fields long enough for safe migration where required, using appropriate obsolete states and reasons.
