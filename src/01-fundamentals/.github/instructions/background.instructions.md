---
description: Job Queue and background processing rules
applyTo: "**/JobQueue/**/*.al,**/Background/**/*.al"
---

# Job Queue and background processing rules

- Design processing to be restart-safe and idempotent where the business operation permits.
- Handle errors so failed work is diagnosable without silently losing items.
- Avoid UI dependencies and interactive dialogs in background execution.
- Consider transaction size, locking, batching, retry behavior, and permissions.
- Do not create uncontrolled recursive scheduling or unbounded work.
