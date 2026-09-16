# Phase 06 - Events and Subscribers

## Objective
Learn event-driven extensibility and avoid modifying standard application code.

## Concepts
- Publisher and subscriber
- Integration events
- Business events
- Trigger events
- `EventSubscriber` attribute
- Event parameters
- Decoupling

## Exercise 06 - Validate on Sales Order Release
### Requirement
Invoke custom Sales Order validation at a suitable event in the release flow.

### Suggested source placement
```text
Sales/SalesOrder/Codeunits/
└── SalesOrderSubscriber.Codeunit.al
```

### Practice tasks
- Inspect available standard events.
- Select an event based on its semantics and parameters.
- Create a subscriber codeunit.
- Delegate actual business validation to the validation codeunit from Phase 05.
- Debug the publisher/subscriber execution path.

### Acceptance criteria
- Standard application code is not modified.
- Subscriber is thin and delegates business logic where appropriate.
- Developer can explain why the chosen event is appropriate.
