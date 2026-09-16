---
name: review-al-security-upgrade
description: "Review Business Central AL permissions, data exposure, schema changes, and upgrade compatibility."
---

Review the following AL feature/object: <feature, files, or change>.

Read `app.json` and the repository instructions first. Check:

- Object and table permissions according to the least-privilege principle.
- Whether the Permission Set/Permission Set Extension correctly covers the feature.
- DataClassification and sensitive fields.
- Whether an API Page, API Query, report, or XMLport exposes data unintentionally.
- TableRelation, deletion behavior, and permissions to modify or delete data.
- Whether changes to fields, keys, relations, enum values, or the schema affect upgrades.
- Runtime, application version, dependencies, and backward compatibility.
- Profiles, Role Centers, `AccessByPermission`, indirect permissions, and actual authorization boundaries.
- `Permissions` properties, API/OData exposure, and `resourceExposurePolicy`.
- Data migration, upgrade codeunits, and rollback/repair considerations.
- Test scenarios for permissions, security exposure, Profiles, and upgrades.
- Official-source or AL-symbol evidence for security-related APIs and properties.

Report findings before the summary, ordered by severity: Critical, High, Medium, Low. Each finding must include the file/line when available, impact, recommendation, and validation. If evidence is insufficient, state the assumption instead of presenting it as fact.
