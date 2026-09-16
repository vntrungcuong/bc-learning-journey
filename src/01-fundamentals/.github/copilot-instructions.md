# Business Central Project Instructions

## Project Context

- Platform: Microsoft Dynamics 365 Business Central
- Language: AL
- Read the current runtime, application version, target, publisher, dependencies, and object ID ranges from `app.json`.

## Source of Truth

- Treat `app.json` as the source of truth for runtime, application version, publisher, extension version, dependencies, target, and object ID ranges.
- Do not infer project metadata from this file when it conflicts with `app.json`.
- Read and respect the current `app.json` before generating or reviewing AL code.
- Do not invent a publisher prefix. If the prefix is not defined in `app.json` or confirmed by the user, ask before creating names.

## Project Rules

- Use the project's publisher prefix for custom objects and fields.
- Do not use object IDs outside the configured `idRanges`.
- Preserve compatibility with the application and runtime versions in `app.json`.
- Keep one feature's objects grouped together.
- Prefer event subscribers when extending standard behavior.
- Do not modify Microsoft standard objects directly.
- Run AL compilation and focused validation after code changes.
- Consider permissions, data classification, upgrade impact, and performance for every feature.
- Keep changes focused on the requested feature and do not modify unrelated files.
- Do not change the app identity, publisher, object ID ranges, runtime, or dependencies without explaining the impact.
- Preserve user changes already present in the worktree.
- Keep repository instructions concise; load detailed guidance from the relevant prompt or document only when the task needs it.
- Prefer concise, goal-focused answers: summary, recommendation, changed files, validation, and remaining risks.
- Verify Microsoft APIs, AL properties, events, object names, and signatures against official Microsoft Learn documentation and/or current AL symbols before presenting them as facts.
- If official verification or compilation is unavailable, state that limitation explicitly and mark assumptions.
- Do not claim performance improvements without workload, baseline, measurement method, and before/after evidence.
- Treat performance as workload-dependent; do not impose a universal latency target on every page, report, integration, job queue, or upgrade operation.
- Use English for code comments and documentation comments. Add concise XML documentation for public or non-obvious procedures when supported by the target AL version; explain why, not obvious syntax.
- Apply SOLID, KISS, and DRY pragmatically in AL. Prefer AL-native patterns and avoid abstractions that add complexity without a concrete benefit.
- Treat AI/Copilot features as optional capabilities: define user value, data access, privacy, permissions, fallback behavior, and human control before implementation.

## Validation

Before considering a change complete:

- Check compiler errors and warnings.
- Check object IDs and naming.
- Check table relations, keys, and permissions.
- Check integration error handling and retry behavior where relevant.
- Suggest focused tests for changed behavior.
- Report remaining risks or unvalidated assumptions.

## Copilot Routing

- Use `design-al-object.prompt.md` for one object or object extension.
- Use `develop-al-feature.prompt.md` for a feature involving multiple objects.
- Use `test-al-feature.prompt.md` for test design or test code.
- Use `review-al-security-upgrade.prompt.md` for permissions, data exposure, or schema and upgrade review.
- Use `review-al-quality-gates.prompt.md` for a concise cross-cutting quality review.
- Use `bc-al-feature-development` for a multi-step implementation workflow.
- Use `bc-issue-diagnosis` for hidden defects, runtime errors, data issues, permissions, integrations, Job Queue, upgrade, and performance regressions.
- Use `bc-security-review` for roles, permissions, data exposure, API/OData, Profiles, and resource exposure.
- Use `bc-integration-development` for external APIs, web services, authentication, retry, idempotency, and operational recovery.
- Use `bc-test-development` for AL automated tests, TestPage, TestRequestPage, reports, APIs, XMLports, permissions, and upgrade tests.
- Use the performance review prompt or skill only when the task includes a measurable performance concern.

## Response and Validation Contract

For code or design tasks, respond in this order:

1. Goal and assumptions.
2. Focused recommendation or implementation.
3. Security, performance, upgrade, and maintainability considerations.
4. Validation performed and validation not available.
5. Test gaps and residual risks.

Do not invent Microsoft APIs, AL syntax, object names, events, properties, or dependencies. Prefer a short answer with complete decision-critical information over a long generic explanation.