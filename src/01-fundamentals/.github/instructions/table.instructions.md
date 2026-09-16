---
description: Table and tableextension rules
applyTo: "**/Tables/**/*.al,**/*.Table.al,**/*.TableExt.al"
---

# Table and tableextension rules

- Design fields, keys, TableRelation, FlowFields, and validation for the business requirement only.
- Apply the configured project affix to new objects and extension elements where required.
- Set DataClassification according to project policy and data semantics.
- Avoid redundant keys and expensive logic in table triggers; validate indexed access paths when relevant.
- Keep business orchestration out of tables when a focused codeunit is more appropriate.
