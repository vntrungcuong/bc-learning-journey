---
name: design-al-object
description: "Design a Business Central AL object or object extension before implementation."
---

Design the following AL object: <object type and business purpose>.

Before making recommendations:

1. Read `app.json` and confirm the runtime, application version, target, dependencies, and ID range.
2. Identify the object type: Table, TableExtension, Page, PageExtension, Codeunit, Report, ReportExtension, Query/API, XMLport, Enum, Interface, Permission Set/PermissionSetExtension, Profile, Control Add-in, Job Queue, Test Codeunit, or upgrade object.
3. Find the relevant standard object and check whether an extension or event subscriber can be used.
4. Check the publisher prefix. If the prefix has not been confirmed, write `[PREFIX REQUIRES CONFIRMATION]` and do not invent one.

Provide a concise output containing:

- Business purpose and assumptions.
- Proposed object name, ID, and file name.
- Main object structure.
- Relations, keys, events, permissions, or layout as applicable to the object type.
- DataClassification and security exposure.
- Performance and upgrade impact.
- Official-source or AL-symbol verification evidence for Microsoft-specific APIs and behavior.
- AI, privacy, fallback, human-control, and UX considerations when applicable.
- Focused test scenarios.
- Items requiring user confirmation.

Do not create or modify AL files until the design has been confirmed. Do not modify Microsoft standard objects directly.
