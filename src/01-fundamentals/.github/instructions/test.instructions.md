---
description: AL automated test rules
applyTo: "**/Tests/**/*.al,**/*.Test.al"
---

# AL automated test rules

- Write deterministic, isolated tests using Arrange-Act-Assert.
- Test changed behavior, negative paths, boundaries, and permissions where relevant.
- Use BC test libraries, TestPage, and TestRequestPage when appropriate and available.
- Avoid dependencies on pre-existing mutable data when test setup can create required state.
- Keep tests focused on observable behavior rather than implementation details.
