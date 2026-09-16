---
description: Query object rules
applyTo: "**/Queries/**/*.al,**/*.Query.al"
---

# Query object rules

- Select only required columns and dataitems.
- Use filters, joins, and ordering intentionally; avoid unnecessary result volume.
- Validate join type and key/filter support for expected workloads.
- Do not embed unrelated business logic in query objects.
- Consider API-query exposure and permissions when applicable.
