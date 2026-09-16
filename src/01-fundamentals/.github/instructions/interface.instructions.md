---
description: AL interface rules
applyTo: "**/Interfaces/**/*.al,**/*.Interface.al"
---

# AL interface rules

- Introduce interfaces only when multiple implementations or meaningful substitution is required.
- Keep contracts small, stable, and business-focused.
- Do not add abstraction when a direct AL-native design is simpler.
- Validate enum/interface implementation mapping and fallback behavior where used.
