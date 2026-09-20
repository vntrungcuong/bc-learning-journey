---
name: al-object-development
description: Create or extend a focused Business Central AL object, including tables, pages, codeunits, reports, queries, XMLports, enums, interfaces, permission sets, profiles, control add-ins, APIs, install/upgrade objects, or test objects.
---

# AL Object Development

## Purpose
Implement one focused AL object or a tightly coupled object pair according to an approved design and object-specific repository instructions.

## Primary agent
`Technical Consultant - AL Development (Custom)`

## Workflow
1. **Identify the object role**
   - Confirm business responsibility, source object, lifecycle, caller, data owner, and acceptance criteria.
2. **Choose the correct object type**
   - Prefer an extension object when a supported standard or dependency target exists.
   - Confirm that a new table/page/report/API/framework is justified.
3. **Verify metadata**
   - Object ID, name, affix, namespace, folder, dependencies, symbol signatures, permissions, captions, labels, `ApplicationArea`, and `DataClassification`.
4. **Apply object-specific design**
   - Table: fields, keys, relations, validation, growth, retention, and upgrade.
   - Page/UI: control placement, actions, accessibility, permissions, and thin triggers.
   - Codeunit/event: responsibility, visibility, transactions, errors, events, and testability.
   - Report/query/XMLport/API: contract, filters, volume, layout/format, security, and compatibility.
   - Enum/interface: stable contract, extensibility, implementation/fallback behavior.
   - Permission/security: least privilege and direct/indirect access.
   - Install/upgrade/test/control add-in/profile: apply the corresponding instruction file and approved design.
5. **Build and validate**
   - Compile, review diagnostics and diff, and add focused tests where behavior changes.

## Required output
- Object purpose and design choice
- File/object created or changed
- Key properties and verified dependencies
- Build/analyzer result
- Test and manual-validation status
- Performance, security, database, permission, and upgrade notes
- Assumptions and human-review items

## Common guardrails
- Follow `.github/copilot-instructions.md`, applicable `.github/instructions/*.instructions.md`, the selected Custom Agent, `app.json`, and established repository conventions.
- Treat current workspace source, downloaded symbols, compiler output, analyzer output, test evidence, and approved project documents as evidence. Separate verified facts from assumptions.
- Prefer standard Business Central features, setup, extension objects, published events, and supported APIs before custom frameworks or copied standard logic.
- Never invent AL objects, fields, events, procedures, signatures, platform behavior, environment facts, business decisions, or test results.
- Keep work scoped. Preserve unrelated changes. Do not commit, merge, publish to production, change dependencies, perform destructive data operations, or broaden permissions without explicit approval.
- Escalate a human gate for financial posting behavior, destructive schema/data changes, public API breaking changes, security boundaries, dependency/app identity changes, production deployment, or unresolved material business rules.
