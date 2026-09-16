---
name: al-test-development
description: Design and implement Business Central AL automated tests. Use when adding tests for new behavior, regressions, permissions, integrations, pages, reports, or upgrade logic.
---

# Al Test Development

## Workflow
1. Derive test scenarios from observable requirements and changed behavior.
2. Cover the primary success path plus relevant negative, boundary, and permission cases.
3. Use deterministic setup and standard BC test libraries, TestPage, or TestRequestPage when available.
4. Keep each test isolated and focused; avoid dependence on mutable pre-existing data.
5. Run/build tests when tooling permits and report unexecuted scenarios or environment constraints.

## Guardrails
- Follow repository-level and applicable path-specific instructions.
- Prefer verified workspace symbols and current project configuration over assumptions.
- Keep changes scoped; explain any necessary broad or destructive change before applying it.
- Do not publish or deploy unless explicitly requested.
