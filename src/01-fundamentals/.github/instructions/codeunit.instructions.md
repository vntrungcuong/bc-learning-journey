---
description: Codeunit and business logic rules
applyTo: "**/Codeunits/**/*.al,**/*.Codeunit.al"
---

# Codeunit and business logic rules

- Prefer published events and extension patterns over duplicating standard logic.
- Keep procedures cohesive; minimize globals and hidden state.
- Use appropriate procedure visibility and interfaces when they provide concrete decoupling value.
- Handle errors explicitly at the correct boundary; do not silently swallow failures.
- Respect transaction boundaries and avoid unnecessary commits.
