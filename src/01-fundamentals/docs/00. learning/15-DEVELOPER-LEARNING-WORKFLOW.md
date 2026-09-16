# Developer Learning Workflow

## Before coding
- Read the exercise objective and requirement.
- Use Business Central application/symbol exploration to identify relevant standard objects.
- Write down the proposed objects and source locations.
- Identify what is new and what extends standard Business Central.

## During coding
- Implement in small steps.
- Build frequently.
- Read compiler/analyzer diagnostics rather than immediately asking AI to rewrite the solution.
- Keep reusable business logic in focused codeunits where appropriate.
- Add breakpoints and inspect actual runtime values.

## When using an AI coding assistant
Use AI as a reviewer and accelerator, not as a substitute for understanding.

Recommended loop:
```text
Requirement
  -> Developer analysis
  -> Ask AI for proposal/review
  -> Developer verifies standard symbols
  -> Implement small change
  -> Build/debug/test
  -> Ask AI to review the result
```

Before accepting generated AL code, the developer should be able to explain:
- Which object is being changed?
- Why that extension point/event is correct?
- Where data is stored?
- Where business validation executes?
- What happens when the operation fails?

## After coding
- Build with project analyzers enabled.
- Publish only to the intended development/sandbox environment.
- Execute acceptance scenarios.
- Record learning notes.
- Commit only understandable, reviewed source changes.
