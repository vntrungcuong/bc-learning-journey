# Fundamentals Practice Project Overview

## Purpose
Use one evolving Business Central extension to connect technical AL concepts to realistic business functions.

## Target structure
```text
01-fundamentals/
├── Sales/
│   ├── Customer/
│   │   ├── Tables/
│   │   ├── Pages/
│   │   ├── Codeunits/
│   │   └── Enums/
│   └── SalesOrder/
│       ├── Tables/
│       ├── Pages/
│       ├── Codeunits/
│       ├── Enums/
│       ├── Interfaces/
│       └── Reports/
├── Inventory/
│   └── Item/
├── Integration/
├── Permissions/
└── Setup/
```

## Functional story
```text
Customer
├── Customer Category
└── Customer Feedback

Item
└── Item Quality Level

Sales Order
├── Custom data
├── Validation
├── Event subscriber
├── Validation strategies
└── Summary report

Integration
└── External boundary using existing business logic

Testing
└── Automated validation scenarios
```

## Important design rule
Learning exercises should reinforce the repository convention:

```text
Business Area -> Function -> Object Type -> AL File
```

Do not create new architectural patterns only because an exercise needs a file.
