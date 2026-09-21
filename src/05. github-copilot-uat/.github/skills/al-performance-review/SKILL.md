---
name: al-performance-review
description: Review or improve Business Central performance and scalability using workload evidence. Use for slow UI/actions, posting extensions, record loops, queries, reports, APIs, integrations, Job Queue, locking, telemetry, or database-growth concerns.
---

# AL Performance and Scalability Review

## Purpose
Identify measurable bottlenecks and scale risks while preserving correctness, data integrity, security, and upgrade safety.

## Primary agents
- `Technical Architect - Technical Design (Custom)` before implementation
- `Technical Architect - Solution Review (Custom)` after implementation

## Workflow
1. **Define the workload**
   - Operation, user path, environment, data volume, concurrency, frequency, baseline duration/resource symptoms, and target or acceptance threshold.
2. **Collect evidence**
   - Source path, telemetry, profiler/debug timing, database/AL call behavior, job queue logs, API metrics, report volume, and reproducible scenario.
3. **Inspect hotspots**
   - Filters/selectivity, keys/sorts, loaded fields, FlowFields, loops, repeated reads/writes, temporary structures, queries/joins, API pagination/payload, report datasets, events, external calls, transactions, commits, locks, concurrency, and background batching.
4. **Assess scale and storage**
   - Record growth, history/log/staging volume, index write cost, retention/cleanup, media/blob size, telemetry volume, and future tenant/company growth.
5. **Prioritize findings**
   - Severity, evidence, affected workload, expected impact, correctness constraints, and implementation cost.
6. **Recommend the smallest safe change**
   - Do not add keys, caching, `LockTable`, commits, batching, or denormalization without trade-off analysis.
7. **Measure**
   - Compare before/after using the same scenario and state what remains inferred.

## Required output
- Workload and baseline
- Findings ordered by severity with file/object/location
- Evidence versus assumption
- Recommendation and preserved behavior
- Locking, write, storage, security, and upgrade trade-offs
- Measurement plan and results when executed
- Residual scale risks and operational monitoring

## Common guardrails
- Follow `.github/copilot-instructions.md`, applicable `.github/instructions/*.instructions.md`, the selected Custom Agent, `app.json`, and established repository conventions.
- Treat current workspace source, downloaded symbols, compiler output, analyzer output, test evidence, and approved project documents as evidence. Separate verified facts from assumptions.
- Prefer standard Business Central features, setup, extension objects, published events, and supported APIs before custom frameworks or copied standard logic.
- Never invent AL objects, fields, events, procedures, signatures, platform behavior, environment facts, business decisions, or test results.
- Keep work scoped. Preserve unrelated changes. Do not commit, merge, publish to production, change dependencies, perform destructive data operations, or broaden permissions without explicit approval.
- Escalate a human gate for financial posting behavior, destructive schema/data changes, public API breaking changes, security boundaries, dependency/app identity changes, production deployment, or unresolved material business rules.
