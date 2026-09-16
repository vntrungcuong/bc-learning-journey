# Business Central AL Fundamentals Learning Roadmap

## Goal
Build Business Central development fundamentals through one evolving practice project rather than isolated syntax exercises.

## Recommended progression
1. Phase 01 - Customer Fundamentals
2. Phase 02 - Customer Feedback: New Table and Pages
3. Phase 03 - Item and Record Operations
4. Phase 04 - Sales Order Extensions
5. Phase 05 - Codeunits and Business Logic
6. Phase 06 - Events and Subscribers
7. Phase 07 - Interfaces and Enums
8. Phase 08 - Reports
9. Phase 09 - Permissions
10. Phase 10 - Integration
11. Phase 11 - Automated Testing

## Learning rule
For every exercise:
1. Understand the business requirement.
2. Inspect standard Business Central objects and symbols first.
3. Decide which functional module owns the change.
4. Decide which AL object type is required.
5. Implement the smallest working solution.
6. Build and resolve diagnostics.
7. Publish to a development sandbox.
8. Debug the important execution path.
9. Test expected and invalid scenarios.
10. Refactor only after the behavior works.

## Architecture used by the practice project
```text
Business Area
  -> Function
    -> Object Type
      -> AL File
```

Example:
```text
Sales/
└── SalesOrder/
    ├── Tables/
    ├── Pages/
    ├── Codeunits/
    ├── Enums/
    ├── Interfaces/
    └── Reports/
```

## Definition of completion
The fundamentals track is complete when the developer can create and extend AL objects, manipulate records, separate reusable logic into codeunits, use events, implement basic reports and permissions, debug the application, call an API, and write automated AL tests without relying on generated code that the developer cannot explain.
