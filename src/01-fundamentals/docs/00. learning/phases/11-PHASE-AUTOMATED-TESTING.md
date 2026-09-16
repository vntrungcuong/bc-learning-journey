# Phase 11 - Automated Testing

## Objective
Create repeatable AL tests for business rules developed in earlier phases.

## Concepts
- Test codeunit
- `[Test]` methods
- Handler methods as needed
- Test data setup
- Positive and negative cases
- Isolation
- Arrange / Act / Assert thinking

## Exercise 11 - Sales Order Validation Tests
### Scenarios
```text
Given invalid Sales Order data
When validation/release behavior is invoked
Then the expected error occurs
```

```text
Given valid Sales Order data
When validation/release behavior is invoked
Then processing succeeds
```

### Suggested placement
Keep test code in the project's chosen test app/test source structure rather than mixing it invisibly with production behavior.

Example:
```text
test/
└── Sales/
    └── SalesOrder/
        └── SalesOrderValidation.Test.Codeunit.al
```

### Practice tasks
- Build isolated test data.
- Write one positive test.
- Write one negative test.
- Add handlers only when user interaction requires automation.
- Run tests after changing the validation implementation.

### Acceptance criteria
- Tests are repeatable.
- Tests verify observable outcomes rather than internal implementation details.
- Failed production behavior causes an understandable test failure.
