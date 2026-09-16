---
name: al-upgrade-review
description: Review or implement Business Central extension upgrade and data migration changes. Use for schema evolution, obsolete fields, upgrade codeunits, versioned migration, or compatibility assessment.
---

# Al Upgrade Review

## Workflow
1. Compare old and target schema/behavior and identify customer data affected.
2. Treat destructive changes, field removal, renumbering, and data transformations as high risk.
3. Design migration to preserve required data and be deterministic and restart-safe where practical.
4. Scope upgrade logic to the required version/data transition and avoid unrelated transformations.
5. Validate install/upgrade paths when tooling/environment permits.
6. Report migration assumptions, rollback/recovery considerations, validation, and residual data risks.

## Guardrails
- Follow repository-level and applicable path-specific instructions.
- Prefer verified workspace symbols and current project configuration over assumptions.
- Keep changes scoped; explain any necessary broad or destructive change before applying it.
- Do not publish or deploy unless explicitly requested.
