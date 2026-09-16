# Phase 03 - Item and Record Operations

## Objective
Become comfortable with AL record operations rather than only object declarations.

## Concepts
- `Record`
- `Get`, `FindFirst`, `FindSet`
- `SetRange`, `SetFilter`
- `Validate`
- `Insert`, `Modify`, `Delete`
- Error, Message and Label concepts
- Procedures and parameters
- Table/Page extension reinforcement

## Exercise 03 - Item Quality Level
### Requirement
Add an Item Quality Level such as Standard, Premium and Restricted and implement a small rule that requires the developer to query and validate Item data.

### Suggested source placement
```text
Inventory/Item/
├── Enums/
├── Tables/
├── Pages/
└── Codeunits/
```

### Practice tasks
- Extend Item with the quality enum.
- Expose the field on appropriate Item UI.
- Write procedures that retrieve/filter Items by quality.
- Exercise `Get`, `SetRange`, `SetFilter` and `FindSet` in controlled examples.
- Debug a loop over a filtered record set.

### Acceptance criteria
- Developer can explain the difference between exact record retrieval and filtered record iteration.
- Validation is performed at the appropriate layer.
- Reusable operations are not unnecessarily embedded in page actions.
