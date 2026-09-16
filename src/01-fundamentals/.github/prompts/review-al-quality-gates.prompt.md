---
name: review-al-quality-gates
description: "Run a concise cross-cutting quality review for a Business Central AL change."
---

Review this Business Central AL change: <feature, files, or change>.

Read `app.json` and only the relevant repository instructions/docs. Report findings first, ordered by severity.

Check:

- Functional behavior and hidden defects.
- Object type and extension pattern.
- Official-source/API verification and runtime compatibility.
- Naming, ID range, dependencies, and maintainability.
- Security, roles, Profiles, permissions, DataClassification, and exposure.
- Database access, keys, filters, page/report/API/XMLport performance.
- Integration failure handling, retry, idempotency, and telemetry.
- Upgrade/schema/data migration impact.
- Automated tests and validation evidence.
- AI feature privacy, permissions, fallback, human control, and user experience when applicable.

For each finding include severity, evidence/file, impact, recommendation, and validation. End with changed-scope assumptions, unavailable checks, test gaps, and residual risks. Keep the answer concise but complete. Do not invent Microsoft APIs or AL behavior.
