# Phase 05 - Codeunits and Business Logic

## Objective
Learn to move business behavior out of UI objects and into reusable codeunits.

## Concepts
- Codeunit
- Public and local procedures
- Parameters and `var` parameters
- Record validation
- `Error`, `TestField`, `Validate`
- Separation of UI and business logic
- Reuse

## Exercise 05 - Sales Order Validation
### Requirement
Implement a Sales Order validation rule based on an agreed practice condition, such as an order amount threshold or mandatory business data.

### Suggested source placement
```text
Sales/SalesOrder/Codeunits/
└── SalesOrderValidation.Codeunit.al
```

### Practice tasks
- Define one focused validation codeunit.
- Call the validation from an appropriate entry point.
- Keep the page thin.
- Reuse the same validation procedure from a second caller where sensible.
- Debug both valid and invalid flows.

### Acceptance criteria
- Core rule is not duplicated in page triggers.
- Error behavior is understandable to the caller.
- Developer can explain codeunit responsibility and procedure scope.
