---
name: al-code
description: "Instructions for writing and reviewing AL source code."
applyTo: "**/*.al"
---

# AL Code Standards

- Use extension-based development.
- Prefer event subscribers and integration events over duplicated standard logic.
- Keep business logic in codeunits rather than page triggers.
- Use meaningful object and procedure names.
- Use `Lbl` suffix for translatable labels.
- Use `DataClassification` for persisted fields.
- Use `TableRelation` where appropriate.
- Define keys based on real filtering and sorting requirements.
- Do not add keys speculatively.
- Use `SetRange`, `FindSet`, `SetLoadFields`, and `CalcFields` deliberately.
- Avoid database access inside loops where set-based processing is safe.
- Use `ModifyAll` only when validation and triggers are not required.
- Use `LockTable` only when required for correctness.
- Use `ErrorInfo`, `TryFunction`, `TestField`, and `FieldError` appropriately.
- Do not hardcode secrets, tokens, or connection strings.

When creating or changing tables, pages, codeunits, reports, queries, APIs, XMLports, enums, interfaces, profiles, control add-ins, permission sets, or object extensions:

- Preserve the project's publisher prefix, object ID range, runtime, and application compatibility from `app.json`.
- If a publisher prefix is not defined or confirmed, ask instead of inventing one.
- Consider permissions, upgrade impact, data classification, transaction scope, and testability.
- Prefer standard BC page and object patterns over custom behavior that duplicates the Base Application.
- Explain performance trade-offs before adding keys, caching, batching, or locking.
- Verify Microsoft-specific APIs and signatures against official documentation or AL symbols; state when verification is unavailable.
- Keep comments in English, concise, and focused on rationale. Add XML documentation for public or non-obvious procedures when supported by the target AL version.
- Apply SOLID, KISS, and DRY pragmatically. Prefer AL-native events, interfaces, codeunits, and extensions over unnecessary abstraction layers.

Object-specific minimum checks:

- Table: fields, `DataClassification`, primary key, required relations, deletion behavior, and upgrade impact.
- Page: page type, `ApplicationArea`, source table, actions, permissions, and load behavior.
- Codeunit: responsibility, procedure visibility, event boundaries, transaction scope, and idempotency.
- Report: data items, filters, dataset size, request page, layout, and permissions.
- Report layout: distinguish RDLC, Word, and Excel layout behavior; preserve dataset/layout contracts and add output regression tests where relevant.
- Query/API: links, filters, exposed fields, payload size, and security exposure.
- XMLport: direction, schema stability, encoding, validation, and large-file behavior.
- Enum/Interface: extensibility, versioning, naming, and implementation compatibility.
- Permission set: least privilege and synchronization with the feature's objects.
- Profile/Role Center: navigation, `AccessByPermission`, visible actions, and actual authorization boundaries.
- Control add-in: client/server boundary, allowed assets, error handling, and fallback behavior.
- Job Queue/upgrade: scheduling, retry, idempotency, upgrade codeunit, schema/data migration, and recovery.
- AI feature: user value, data minimization, permissions, privacy, fallback, auditability, and human confirmation.