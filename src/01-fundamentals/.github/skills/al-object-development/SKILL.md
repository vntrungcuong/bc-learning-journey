---
name: al-object-development
description: Create or extend a specific Business Central AL object. Use for focused work on tables, pages, codeunits, reports, queries, XMLports, enums, interfaces, permission sets, or extensions.
---

# Al Object Development

## Workflow
1. Identify the requested object type and inspect existing symbols/dependencies before implementation.
2. Prefer an extension object when a suitable standard or dependency object exists.
3. Apply repository naming, namespace, object ID, affix, and object-specific instructions.
4. Keep the change minimal and avoid unrelated refactoring.
5. Build and inspect diagnostics when available; report validation gaps.

## Guardrails
- Follow repository-level and applicable path-specific instructions.
- Prefer verified workspace symbols and current project configuration over assumptions.
- Keep changes scoped; explain any necessary broad or destructive change before applying it.
- Do not publish or deploy unless explicitly requested.
