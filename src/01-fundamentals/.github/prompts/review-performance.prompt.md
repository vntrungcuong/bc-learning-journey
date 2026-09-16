---
name: review-performance
description: "Review Business Central AL code for database, page, report, API, and integration performance."
---

Analyze the selected AL code or feature for performance risks as a Senior Business Central Technical Consultant.

Read `app.json` and the repository instructions first. Review:

- Database call count and record loading.
- Filters, filter selectivity, keys, and sorting.
- `FindSet`, `SetLoadFields`, `CalcFields`, and FlowFields.
- Database calls inside loops.
- Page trigger frequency and page load behavior.
- Report dataset size and data item design.
- API pagination, filtering, and payload size.
- Transaction scope, locking, and concurrency.
- External calls inside database transactions.
- Job Queue scheduling, retries, and duplicate processing.
- Data volume, upgrade, security, and observability risks.
- AI feature latency, prompt/data payload size, caching boundaries, fallback behavior, and privacy cost when applicable.

Before recommending a change, define the workload:

- Data volume and growth.
- User/concurrency profile.
- Environment and warm/cold execution assumptions.
- Baseline metric, target metric, percentile, and measurement method.

For every finding, explain:

- Suspected bottleneck.
- Expected impact.
- Recommended change.
- Behavior that must be preserved.
- Storage, write-maintenance, transaction, or correctness trade-offs.
- How to measure the improvement.

Do not claim a performance improvement without a measurable validation approach.
Do not impose a universal one-second target. Recommend a target appropriate to the workflow and explain the trade-off.
