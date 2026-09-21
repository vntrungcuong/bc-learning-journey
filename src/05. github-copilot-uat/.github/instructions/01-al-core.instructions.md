---
description: Core AL engineering rules applied to all Business Central AL source files.
applyTo: "**/*.al"
---

# Core AL Engineering Rules

## Source of truth
- Read `app.json` before generating or reviewing AL code. Respect its application, platform, runtime, target, dependencies, features, resource exposure policy, and `idRanges`.
- Follow repository-level instructions, the closest applicable path-specific instructions, and established project patterns.
- Verify Microsoft objects, events, procedures, properties, interfaces, enums, APIs, and signatures against current symbols before use.
- Never invent AL syntax, platform behavior, dependencies, object IDs, event signatures, or environment facts.

## Design principles
- Prefer standard Business Central capability and configuration before customization.
- Prefer extension objects, published events, interfaces, and supported APIs over copied or modified standard objects.
- Keep changes minimal, cohesive, and limited to the approved requirement. Preserve unrelated user changes.
- Apply SOLID, KISS, and DRY pragmatically. Prefer simple AL-native designs over speculative abstractions.
- Put reusable business logic in focused codeunits. Keep UI, transport, persistence, and domain responsibilities separated where practical.

## Naming and source structure
- Use the configured project affix, namespace pattern, object ranges, and file naming conventions.
- Use clear English technical names. Use PascalCase for procedures and variables, and meaningful names that describe business intent.
- Prefix temporary record variables with `Temp`. Avoid unexplained abbreviations.
- Reference objects by name instead of numeric ID where supported.
- Use labels for user-facing text and preserve placeholder ordering and comments needed for translation.

## Correctness and data integrity
- Use `Validate` when field validation and related business behavior must execute; use direct assignment only when bypassing validation is intentional and safe.
- Use `Get`, `FindFirst`, `FindSet`, `SetRange`, and `SetFilter` according to the expected access pattern.
- Handle errors at the correct boundary. Do not silently swallow failures or use empty error handling.
- Respect transaction boundaries. Avoid unnecessary `Commit`, long transactions, and side effects hidden in read operations.
- Preserve existing customer data and behavior unless an approved requirement explicitly changes them.

## Performance and scale
- Filter as early as possible and load only the data required by the operation.
- Use supported keys and selective filters for expected workloads. Avoid repeated database calls and avoidable nested loops.
- Consider `SetLoadFields`, temporary records, queries, dictionaries, lists, batching, background processing, and caching only when suitable for the verified scenario.
- Consider write amplification, locking, concurrency, FlowField calculations, telemetry volume, and external-call latency.
- Never claim a performance improvement without a stated workload, baseline, measurement method, and evidence.

## Security and privacy
- Apply least privilege and server-side authorization. UI visibility or editability is not an authorization control.
- Never hard-code, expose, or log credentials, secrets, tokens, connection strings, or sensitive payloads.
- Treat external input and external responses as untrusted.
- Apply `DataClassification` according to data semantics and project policy.
- Review data exposure, company scope, tenant isolation, auditability, permissions, and retention when relevant.

## Quality and completion
- Build or compile after meaningful changes when tools are available.
- Review compiler and configured analyzer diagnostics. Do not add suppressions without explicit justification.
- Fix only task-related issues unless broader remediation is approved.
- Add focused tests for changed behavior and report whether tests were designed, implemented, compiled, executed, passed, failed, or blocked.
- Report assumptions, validation not performed, residual risks, manual test gaps, and rollback considerations.
- A clean build alone does not prove the solution is complete or production-ready.
