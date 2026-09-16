# Phase 02 - Customer Feedback: New Table and Pages

## Objective
Learn to create new AL data and UI objects and connect those objects to a standard Business Central record.

## Concepts
- Table object and fields
- Primary key and secondary keys
- `AutoIncrement`
- `DataClassification`
- `TableRelation`
- Table triggers
- List and Card pages
- `SourceTable`, `ApplicationArea`, `UsageCategory`
- Page actions
- Filtering related records

## Exercise 02 - Customer Feedback
### Requirement
Create Customer Feedback records related to Customer. Suggested fields:
- Entry No.
- Customer No.
- Feedback Date
- Rating
- Comments
- Reviewed

Default Feedback Date when a new record is inserted. Add a way to open feedback for the current customer.

### Suggested source placement
```text
Sales/Customer/
├── Tables/
│   └── CustomerFeedback.Table.al
└── Pages/
    ├── CustomerFeedbackList.Page.al
    ├── CustomerFeedbackCard.Page.al
    └── CustomerCard.PageExt.al
```

### Practice tasks
- Define the table and primary key.
- Relate Customer No. to Customer.
- Add data validation for Rating.
- Build List and Card pages.
- Extend Customer Card with a Feedback action.
- Open only feedback relevant to the current Customer.
- Debug insert and navigation flows.

### Acceptance criteria
- Feedback can be created, edited and viewed.
- Customer relation works.
- Invalid rating data is rejected by the chosen validation design.
- Customer navigation opens relevant feedback records.

### Stretch exercise
Add a FactBox or related information presentation for customer feedback without duplicating business logic.
