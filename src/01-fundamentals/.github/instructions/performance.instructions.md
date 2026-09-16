---
description: Performance-sensitive AL rules
applyTo: "**/Performance/**/*.al"
---

# Performance-sensitive AL rules

- Optimize only against an identified workload or measurable concern.
- Prefer set-based/filter-aware access; avoid unnecessary loops, repeated database calls, and excessive data loading.
- Use keys, SetRange/SetFilter, SetLoadFields, temporary data, and caching only when appropriate to the verified scenario.
- Do not claim improvement without evidence; preserve correctness before optimization.
- Report the performance assumption or measurement that justifies a non-obvious optimization.
