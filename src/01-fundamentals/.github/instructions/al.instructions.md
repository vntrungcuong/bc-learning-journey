---
description: Core AL coding rules
applyTo: "**/*.al"
---

# Core AL coding rules

- Follow Microsoft AL conventions and repository analyzers.
- Use clear English names; PascalCase procedures/variables; prefix temporary records with `Temp`.
- Prefer labels for user-facing text; avoid unused variables, unnecessary globals, and unrelated refactoring.
- Use object names instead of IDs where supported; verify symbols before assuming APIs or signatures.
- Preserve existing behavior and DataClassification unless the requirement changes them.
