---
description: Business Central API rules
applyTo: "**/API/**/*.al,**/Apis/**/*.al"
---

# Business Central API rules

- Use API pages/queries only for intentional, versioned contracts.
- Keep exposed fields minimal and stable; do not expose sensitive data unintentionally.
- Validate permissions, DataClassification, keys, identifiers, filtering, and concurrency behavior.
- Avoid business side effects in read operations.
- Treat breaking contract changes as versioned changes unless explicitly approved.
