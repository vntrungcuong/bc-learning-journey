# Phase 07 - Interfaces and Enums

## Objective
Learn polymorphism only after understanding codeunits and concrete business behavior.

## Concepts
- Interface declarations
- Interface implementation
- Enums
- Strategy pattern
- Dependency boundaries

## Exercise 07 - Sales Order Validation Strategy
### Requirement
Provide multiple Sales Order validation strategies, for example Standard, Credit and VIP, behind a common contract.

### Suggested source placement
```text
Sales/SalesOrder/
├── Interfaces/
│   └── SalesOrderValidator.Interface.al
├── Enums/
│   └── SalesOrderValidationType.Enum.al
└── Codeunits/
    ├── StandardSalesOrderValidator.Codeunit.al
    ├── CreditSalesOrderValidator.Codeunit.al
    └── VipSalesOrderValidator.Codeunit.al
```

### Practice tasks
- Define a small interface.
- Implement at least two strategies.
- Select implementation with an explicit business configuration or practice mechanism.
- Keep calling code unaware of implementation details where practical.

### Acceptance criteria
- Strategies implement the same contract.
- No large conditional block duplicates strategy behavior.
- Developer can explain why an interface improves this specific design.
