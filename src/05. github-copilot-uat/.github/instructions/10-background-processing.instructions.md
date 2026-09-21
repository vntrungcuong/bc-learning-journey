---
description: Rules for Job Queue, scheduled tasks, background sessions, task scheduler, page background tasks, batching, retries, and asynchronous processing.
applyTo: "**/JobQueue/**/*.al,**/Background/**/*.al,**/ScheduledTasks/**/*.al,**/TaskScheduler/**/*.al,**/Async/**/*.al"
---

# Background Processing Rules

## Execution model
- Choose Job Queue when administrators or users need scheduling, recurrence, status, and logs. Use other asynchronous mechanisms only when their lifecycle fits the requirement.
- Keep background code free of UI interaction, dialogs, confirmations, client-only state, and assumptions about an interactive session.
- Document the executing identity, company, permissions, language, time zone, and environment assumptions.

## Reliability
- Design work to be idempotent and restart-safe where the business operation permits.
- Define retryable versus non-retryable failures, maximum attempts, delay, timeout, cancellation, and recovery.
- Prevent duplicate processing through stable business keys, state transitions, or deduplication controls.
- Never create uncontrolled recursive scheduling or unbounded work.

## Transactions and scale
- Process large workloads in bounded batches. Keep transactions short and avoid long locks.
- Define checkpointing, commit strategy, concurrency, category serialization, record ordering, and partial-success behavior.
- Filter early, load only required fields, and avoid scanning entire high-volume tables without an approved workload analysis.

## Operations and storage
- Emit diagnosable, non-sensitive telemetry and preserve sufficient business evidence for reconciliation.
- Define log/history retention, cleanup, archive, and expected database growth.
- Ensure administrators can identify object, parameters, start/end state, failure reason, and remediation steps.

## Testing
- Test reruns, duplicate execution, interruption, permission failure, timeout, malformed parameters, partial processing, concurrency, and recovery.
