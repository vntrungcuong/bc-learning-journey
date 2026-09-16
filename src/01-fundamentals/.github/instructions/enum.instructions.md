---
description: Enum and enumextension rules
applyTo: "**/Enums/**/*.al,**/*.Enum.al,**/*.EnumExt.al"
---

# Enum and enumextension rules

- Prefer extensible enums over Option for new extensible business states where appropriate.
- Use stable enum value IDs and meaningful English names/captions.
- Do not renumber or repurpose existing values without explicit upgrade analysis.
- Use enumextension rather than modifying dependency enums.
