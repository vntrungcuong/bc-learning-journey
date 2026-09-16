---
name: al-issue-diagnosis
description: Diagnose Business Central AL build, runtime, data, permission, report, integration, or extension issues. Use when investigating errors, unexpected behavior, or regressions.
---

# Al Issue Diagnosis

## Workflow
1. Reproduce or precisely identify the symptom before proposing a fix.
2. Collect relevant diagnostics, source, symbols, configuration, and recent scoped changes.
3. Classify the likely failure area and test the smallest evidence-based hypothesis first.
4. Do not invent APIs, events, root causes, or environment facts; state what remains unverified.
5. Apply the smallest safe fix only when implementation is requested, then rebuild/retest.
6. Report root cause if verified, fix, validation, and remaining uncertainty.

## Guardrails
- Follow repository-level and applicable path-specific instructions.
- Prefer verified workspace symbols and current project configuration over assumptions.
- Keep changes scoped; explain any necessary broad or destructive change before applying it.
- Do not publish or deploy unless explicitly requested.
