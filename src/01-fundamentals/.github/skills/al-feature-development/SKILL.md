---
name: al-feature-development
description: Implement an end-to-end Business Central AL feature spanning multiple objects. Use when a requirement needs coordinated table, page, codeunit, permission, report, API, or test changes.
---

# Al Feature Development

## Workflow
1. Understand the business outcome and inspect existing workspace objects, dependencies, and symbols first.
2. Choose the smallest extension-based design and identify affected objects before editing.
3. Implement only the required objects; reuse published events and standard behavior where possible.
4. Add or update permissions and automated tests when the feature requires them.
5. Build and review diagnostics when tooling is available; fix only issues caused by the change.
6. Finish with changed files, validation performed, assumptions, and residual risks.

## Guardrails
- Follow repository-level and applicable path-specific instructions.
- Prefer verified workspace symbols and current project configuration over assumptions.
- Keep changes scoped; explain any necessary broad or destructive change before applying it.
- Do not publish or deploy unless explicitly requested.
