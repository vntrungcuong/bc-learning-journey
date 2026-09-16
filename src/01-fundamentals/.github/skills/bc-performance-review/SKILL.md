---
name: bc-performance-review
description: "Use for multi-step performance reviews of Business Central AL features, including tables, pages, reports, APIs, integrations, database access, keys, locking, and telemetry."
user-invocable: false
---

# Business Central Performance Review

Use this skill only for multi-step performance assessments. Do not use it for a simple syntax review, compile error, or isolated AL question.

Follow this workflow:

1. Read `app.json` and the repository instructions to establish the target runtime, application version, and project constraints.
2. Identify the feature, entry point, and expected workload.
3. Establish a baseline, workload, data volume, concurrency assumptions, environment, metric, percentile, and target.
4. Inspect database access, filters, keys, loops, and FlowFields.
5. Inspect page triggers, report datasets and layouts, APIs, AI features, and external calls.
6. Review transaction scope, locking, retries, and concurrency.
7. Identify security, data volume, upgrade, and observability risks.
8. Rank findings by severity and expected impact.
9. Suggest the smallest safe improvement.
10. Define before/after measurements and validation scenarios.
11. Report assumptions, test gaps, unavailable evidence, and residual risks.

Do not claim a performance improvement without explaining how it should be measured.
Do not impose a universal one-second target; make targets workload- and workflow-specific.
Do not add keys, caching, batching, or locking without explaining their trade-offs.
Explain storage cost, write-maintenance cost, transaction impact, and correctness implications for those recommendations.