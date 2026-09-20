---
name: review-al-code
description: Perform an independent evidence-based review of Business Central AL changes before human approval.
agent: solution-reviewer
argument-hint: 'Reference changed files, commit/diff, requirement/design, test evidence, and review scope.'
---

# Review Business Central AL Changes

Review the supplied changes independently. Use relevant design and review skills, including `al-performance-review`, `al-security-review`, and `al-upgrade-review` when triggered.

Review scope:
${input:scope:Reference changed files, selection, commit/diff, feature, or issue}

Requirement/design/test evidence:
${input:evidence:Reference acceptance criteria, approved designs, diagnostics, and test results}

## Review order
1. Functional correctness and requirement traceability
2. Standard Business Central reuse and extension architecture
3. AL correctness, object responsibilities, events/interfaces, transactions, and error handling
4. Naming, affix, namespace, file structure, labels, localization, `DataClassification`, permissions, and analyzer alignment
5. Security, trust boundaries, sensitive data, least privilege, and API/integration exposure
6. Performance, selectivity, keys, fields, loops, FlowFields, reports, payloads, locking, concurrency, scale, and database growth
7. Upgrade, obsolete lifecycle, schema/dependencies, public contracts, migration, rollback, and maintainability
8. Test traceability and evidence states

## Finding format
For every finding include:
- Severity: Blocking, Important, or Optional
- File/object/location and evidence
- Problem and impact
- Smallest recommendation
- Required validation/test

Do not request unrelated refactoring or claim a defect without evidence. Do not modify files.

## Required conclusion
Return exactly one:
- `READY FOR HUMAN REVIEW`
- `CHANGES REQUIRED`
- `BLOCKED BY MISSING EVIDENCE`

Never approve production deployment.
