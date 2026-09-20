---
description: Rules for Business Central codeunits, procedures, event publishers/subscribers, interfaces usage, transactions, and business orchestration.
applyTo: "**/Codeunits/**/*.al,**/Events/**/*.al,**/Subscribers/**/*.al,**/*.Codeunit.al"
---

# Codeunit and Event Rules

## Responsibilities
- Give each codeunit a focused business or technical responsibility.
- Keep procedures cohesive, minimize globals and hidden state, and use the narrowest appropriate visibility.
- Separate domain logic, orchestration, transport, persistence, setup access, and presentation concerns where practical.
- Use interfaces only when multiple implementations, substitution, or a stable contract provides concrete value.

## Events and extensibility
- Prefer existing published events and extension points after verifying their signatures and execution context.
- Do not copy standard posting or business logic solely to add a hook.
- Keep event subscribers `local` unless a verified requirement needs broader visibility.
- Make subscribers focused and predictable. Avoid unrelated side effects and expensive work on high-frequency events.
- Publish new integration events only when a genuine extension boundary exists. Define stable parameters and avoid exposing unnecessary internals.

## Transactions and errors
- Understand whether the code runs inside posting, validation, page, API, job queue, install, or upgrade transactions.
- Avoid unnecessary `Commit`, long locks, UI dialogs in non-UI sessions, and calls to unreliable external systems inside critical transactions.
- Use clear labels and actionable errors. Do not swallow exceptions or convert failures into silent partial success.
- Design retry and idempotency at the correct boundary.

## Performance
- Filter before iteration, avoid repeated `Get`/`Find` calls, load only needed fields, and batch large workloads.
- Consider event frequency, recursion, re-entry, locking, temporary data, and background processing.
- Do not cache mutable business data globally without a validated lifecycle and invalidation strategy.

## Permissions and testability
- Define indirect permissions only when justified and keep them minimal.
- Design public procedures around business intent and make critical logic directly testable without UI coupling.
