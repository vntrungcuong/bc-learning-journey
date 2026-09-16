---
name: al-performance-review
description: Review Business Central AL code for performance risks. Use for slow operations, queries, records, loops, posting extensions, reports, APIs, background processing, or explicit performance reviews.
---

# Al Performance Review

## Workflow
1. Define the workload or observed performance concern before optimizing.
2. Inspect filters, keys, loaded fields, loops, database calls, joins, FlowFields, locking, and transaction scope as relevant.
3. Prioritize high-impact evidence-based issues; preserve functional correctness.
4. Recommend AL-native improvements only when they fit the verified access pattern.
5. Do not claim improvement without measurement or a clearly stated performance assumption.
6. Rebuild/test after changes and report what was measured versus inferred.

## Guardrails
- Follow repository-level and applicable path-specific instructions.
- Prefer verified workspace symbols and current project configuration over assumptions.
- Keep changes scoped; explain any necessary broad or destructive change before applying it.
- Do not publish or deploy unless explicitly requested.
