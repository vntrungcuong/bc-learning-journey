# Phase 08 - Reports

## Objective
Learn Business Central report datasets, filtering and layouts while keeping reusable calculations outside reports where appropriate.

## Concepts
- Report object
- DataItem and columns
- DataItemLink
- Filters
- Request page
- Dataset
- Word/RDLC layout concepts
- Reusable calculation codeunits

## Exercise 08 - Sales Order Summary
### Requirement
Create a Sales Order Summary report that presents a useful subset of Sales Order information and supports appropriate filtering.

### Suggested source placement
```text
Sales/SalesOrder/Reports/
└── SalesOrderSummary.Report.al
```

### Practice tasks
- Design the dataset first.
- Add filters/request options only when useful.
- Create a simple layout.
- Move reusable calculations into an appropriate codeunit instead of duplicating them across reports.
- Verify dataset values against Business Central data.

### Acceptance criteria
- Dataset fields are correct.
- User filtering behaves as intended.
- Layout displays the expected data.
- Shared calculations are not duplicated unnecessarily.
