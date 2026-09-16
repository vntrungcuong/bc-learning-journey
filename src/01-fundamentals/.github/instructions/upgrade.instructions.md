---
description: Schema and upgrade rules
applyTo: "**/Upgrade/**/*.al,**/*Upgrade*.al"
---

# Schema and upgrade rules

- Treat destructive schema/data changes as high risk and explain impact before implementation.
- Preserve existing customer data unless migration/removal is explicitly approved.
- Make upgrade logic deterministic, restart-safe where practical, and scoped to required versions/data.
- Do not reuse removed field IDs/names in ways that can corrupt upgrade semantics.
- Validate install/upgrade path and residual data risks before completion.
