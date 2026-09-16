# Phase 04 - Sales Order Extensions

## Objective
Learn to inspect standard Sales Order objects and safely extend standard data and UI.

## Concepts
- Standard object/symbol discovery
- Sales Header and Sales Order relationships
- Table Extension
- Page Extension
- Field placement
- Validation
- Debugging standard plus extension behavior

## Exercise 04 - Customer PO Reference
### Requirement
Add a custom Customer PO Reference to Sales Order and expose it to the user.

### Suggested source placement
```text
Sales/SalesOrder/
├── Tables/
└── Pages/
```

### Practice tasks
- Inspect standard symbols before coding.
- Identify the correct standard table and page.
- Add the field through a table extension.
- Add the control through a page extension.
- Verify creation, editing and reopening of Sales Orders.
- Debug validation behavior.

### Acceptance criteria
- No base application modification is required.
- Field persists correctly.
- UI placement follows the intended user flow.
- Developer can identify the underlying standard objects without guessing.
