# Business Central Project Instructions

## Project Configuration
- Platform: Microsoft Dynamics 365 Business Central
- Language: AL
- Project Prefix: CMI
- Prefix Position: Start
- Namespace Root: CuongMai.Fundamentals
- Namespace Pattern: `<NamespaceRoot>[.<Module>][.<Feature>]`
- Default DataClassification: CustomerContent

> Configure `Project Prefix`, `Namespace Root`, and `Default DataClassification` for each project. Do not infer them from the publisher.

## Source of Truth
- Read `app.json` before generating or reviewing AL code.
- Treat `app.json` as the source of truth for application/platform versions, runtime, target, publisher, extension version, dependencies, and `idRanges`.
- Treat the Project Configuration above as the source of truth for project naming conventions.
- Do not derive or invent the Project Prefix or Namespace Root from `app.json.publisher`.
- If required configuration is missing or conflicts with the workspace, report the conflict before creating or renaming objects.

## Core AL Rules
- Stay compatible with the versions, dependencies, target, and `idRanges` in `app.json`.
- Apply the configured Project Prefix to new custom objects and extension elements where required by the project and Microsoft AL naming/affix rules.
- Use namespaces following the configured Namespace Pattern. Example: `CuongMai.Fundamentals.Sales.Customer`.
- Prefer extension objects and event subscribers over copying or modifying Microsoft standard objects.
- Reference AL objects by name rather than object ID where supported.
- Keep changes minimal and scoped to the requested feature; preserve unrelated user changes.
- Use English for technical names, code comments, and documentation comments.
- Apply SOLID, KISS, and DRY pragmatically; prefer simple AL-native patterns over unnecessary abstractions.
- Preserve existing `DataClassification`. For new elements requiring it, use the configured default unless business or compliance semantics require another classification.
- Consider permissions, security, upgrade impact, data exposure, and performance when relevant to the change.
- Never assert a performance improvement without measurements.

## Verification and Change Control
- Prefer current workspace symbols and Microsoft AL tools for AL-specific verification; use official Microsoft documentation when additional verification is required.
- Do not invent APIs, events, properties, dependencies, or AL syntax. State unverified assumptions explicitly.
- For analysis, design, or review requests, do not modify files unless implementation is explicitly requested.
- For implementation requests, modify only files required by the requested scope.
- Explain impact before broad refactoring, schema/dependency changes, or destructive operations.
- Do not change app identity, publisher, runtime, dependencies, or `idRanges` unless explicitly required.

## Validation
Before considering a code change complete:
- Build or compile the AL project and review relevant diagnostics when supported tools are available.
- Check object IDs, Project Prefix/affix usage, namespace, naming, and file naming.
- Respect repository-configured analyzers; do not add suppressions without explicit justification.
- Check permissions, table relations/keys, DataClassification, upgrade impact, and integration error handling where relevant.
- Suggest focused tests for changed behavior.
- Report validation not performed, assumptions, test gaps, and residual risks.

## Routing
- Keep this repository-level file concise and always-on.
- Use relevant path-specific `.instructions.md` files only when their scope matches the current task or files.
- Use relevant Agent Skills for reusable multi-step workflows; do not duplicate skill workflows in this file.
- Use project documentation, current symbols, and Microsoft AL tools only when needed to understand or validate the task.
- For general, exploratory, small, or mixed-scope work, use the built-in Agent.
- For a clear specialist role, use the matching project Custom Agent:
  - Solution design or architecture → AL Architect (Custom)
  - Implementation → AL Developer (Custom)
  - Root-cause investigation → AL Debugger (Custom)
  - Automated testing → AL Test Engineer (Custom)
  - General code review → AL Reviewer (Custom)
  - Security-focused review → AL Security Reviewer (Custom)
  - Performance-focused review → AL Performance Reviewer (Custom)
- Prefer the smallest relevant context, workflow, agent, and tool set needed to complete the task correctly.

## Response Contract
For code/design tasks, prefer concise output in this order:
1. Goal and necessary assumptions.
2. Recommendation or implementation.
3. Changed files, when applicable.
4. Validation performed or unavailable.
5. Remaining risks or test gaps.
