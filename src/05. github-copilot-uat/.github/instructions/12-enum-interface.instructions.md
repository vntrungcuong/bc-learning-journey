---
description: Rules for Business Central enums, enum extensions, interfaces, implementations, extensible behavior, and stable contracts.
applyTo: "**/Enums/**/*.al,**/Interfaces/**/*.al,**/*.Enum.al,**/*.EnumExt.al,**/*.Interface.al"
---

# Enum and Interface Rules

## Enums
- Prefer an extensible enum over a new `Option` when downstream extensions may add business values.
- Use stable value IDs, meaningful English names, captions, and project affixes where required.
- Never renumber, repurpose, or remove persisted values without approved data-upgrade analysis.
- Use `enumextension` rather than modifying dependency enums.
- Define unknown, default, and unsupported-value behavior explicitly when external data or extensibility is involved.

## Interfaces
- Introduce an interface only when multiple implementations, substitution, testability, or a stable business contract provides concrete value.
- Keep contracts small, cohesive, and business-focused.
- Avoid speculative abstraction when a direct codeunit or event-driven design is simpler.
- Define failure, fallback, default implementation, and unsupported implementation behavior.

## Enum-interface patterns
- Verify enum implementation mapping, default implementation, extensibility, and behavior when another extension adds a value.
- Avoid central `case` statements that defeat an intended extensible interface pattern.
- Test each implementation, default/fallback behavior, and extension-added values where practical.
