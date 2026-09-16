# Phase 01 - Customer Fundamentals

## Objective
Use the Customer function to learn the smallest useful AL customization: extend standard data and expose it in the standard UI.

## Concepts
- AL syntax, variables, data types, procedures and scope
- Enum
- Table Extension
- Page Extension
- Fields and properties
- `TableRelation`
- Basic triggers and `Validate`
- Build, publish and debug cycle

## Exercise 01 - Customer Category
### Requirement
Add a Customer Category classification with values such as Standard, Silver, Gold and VIP. Store the value on Customer and expose it on Customer Card and Customer List.

### Suggested source placement
```text
Sales/Customer/
├── Enums/
│   └── CustomerCategory.Enum.al
├── Tables/
│   └── Customer.TableExt.al
└── Pages/
    ├── CustomerCard.PageExt.al
    └── CustomerList.PageExt.al
```

### Practice tasks
- Create a new enum.
- Extend Customer with the new field.
- Add the field to Customer Card.
- Add the field to Customer List.
- Publish and update different customers.
- Place breakpoints on relevant triggers and inspect values.

### Acceptance criteria
- Category is persisted on Customer.
- Category is editable/displayed in the intended UI.
- Solution builds without unresolved compiler diagnostics.
- Developer can explain why each object lives in its folder.

### Review questions
- When should an enum be preferred to free text?
- What is the difference between table and page validation?
- Why should business-critical validation not exist only in the UI?
