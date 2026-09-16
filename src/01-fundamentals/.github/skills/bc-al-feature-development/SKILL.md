---
name: bc-al-feature-development
description: "Use for multi-step Business Central AL feature development involving objects, extensions, permissions, tests, schema changes, or integrations."
user-invocable: true
---

# Business Central AL Feature Development

Use this skill for features involving multiple steps or objects. Do not use it for simple AL questions, syntax questions, or an isolated compile error.

## Workflow

1. Read `app.json`, `.github/copilot-instructions.md`, and the instructions applicable to the relevant files.
2. Identify the business behavior, scope, assumptions, and standard objects to extend.
3. Read only the documents in `docs/` that are directly relevant to the feature's object types or risks.
4. Create an object matrix, ID allocation, dependency list, permission matrix, and test matrix.
5. Check the publisher prefix. If there is no verified source, ask the user before creating names.
6. Present a concise implementation plan before changing multiple files.
7. Implement small slices covering data, logic, UI/integration, permissions, and tests.
8. After each slice, run focused diagnostics, compile, or tests when the environment supports them.
9. Review security, performance, and upgrade impact before finishing.
10. Report changed files, validation, assumptions, test gaps, and residual risks.

## Guardrails

- Do not modify Microsoft standard objects directly.
- Do not use object IDs outside the range in `app.json`.
- Do not invent a publisher prefix, dependency, API signature, or unverified behavior.
- Do not load all of `docs/` into context; read only the relevant files.
- Do not add keys, LockTable, caching, or batch processing without explaining correctness and trade-offs.
- Do not treat a successful build as sufficient; check permissions, upgrade impact, and tests as well.
