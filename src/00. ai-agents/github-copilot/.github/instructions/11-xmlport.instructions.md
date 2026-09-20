---
description: Rules for Business Central XMLports, structured import/export, large files, validation, transactions, and recovery.
applyTo: "**/XmlPorts/**/*.al,**/XMLPorts/**/*.al,**/*.Xmlport.al,**/*.XmlPort.al"
---

# XMLport Import and Export Rules

## Contract
- Define direction, format, encoding, delimiters, namespaces, schema, field order, optionality, culture, date/time, decimal, and character handling explicitly.
- Treat the format as a versioned contract when consumed outside the extension.

## Import safety
- Treat imported data as untrusted.
- Validate structure, required values, lengths, references, permissions, and business rules before committing changes.
- Use `Validate` when standard field behavior is required. Document intentional direct assignments.
- Do not silently ignore malformed or required values. Provide actionable row/field diagnostics without exposing sensitive data.

## Transactions and large files
- Define all-or-nothing versus partial processing behavior.
- Avoid loading large files entirely into memory when streaming or bounded processing is available.
- Plan batching, checkpoints, retry, duplicate-file handling, idempotency, rollback, quarantine, and reconciliation.
- Keep external calls outside critical database transactions.

## Separation and testing
- Separate parsing/serialization from mapping and reusable business logic.
- Test empty files, headers, encoding, malformed rows, boundary lengths, duplicates, large volumes, permissions, locale differences, restart, and round-trip behavior where relevant.
