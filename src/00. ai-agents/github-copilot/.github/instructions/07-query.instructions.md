---
description: Rules for Business Central query objects, joins, aggregations, API queries, data volume, and performance.
applyTo: "**/Queries/**/*.al,**/*.Query.al"
---

# Query Object Rules

## Data model
- Use a query when set-based reading, joins, aggregation, analysis, or API exposure provides clear value.
- Select only required dataitems and columns. Use meaningful names and stable API names where exposed.
- Define `DataItemLink`, filters, join types, ordering, grouping, totals, and top-number behavior intentionally.

## Correctness
- Verify cardinality and join semantics. Avoid duplicate or missing rows caused by incorrect parent-child assumptions.
- Confirm null/outer-join behavior, date filters, company scope, dimensions, currencies, and aggregation precision.
- Keep mutation and unrelated business logic out of query objects.

## Performance and scale
- Filter as early as possible and minimize result volume.
- Verify that source-table keys and filters support expected workloads.
- Avoid broad joins, unnecessary columns, high-cardinality grouping, and unbounded API-query output.
- Define pagination, limits, expected volume, and a measurement plan when the query supports integrations or analytics.

## Security
- Review permissions and field-level data exposure.
- Do not expose sensitive, internal, or cross-company data unintentionally.
- Treat a query used as an API as a versioned external contract and apply API rules.
