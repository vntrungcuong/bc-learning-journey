---
description: Report and reportextension rules
applyTo: "**/Reports/**/*.al,**/*.Report.al,**/*.ReportExt.al"
---

# Report and reportextension rules

- Prefer reportextension when the standard report is a suitable extension target.
- Keep dataset minimal; calculate only data required by the output.
- Separate reusable business/calculation logic from presentation where practical.
- Validate request page, filters, layout impact, permissions, and performance.
- Preserve existing layouts and behavior unless the requirement explicitly changes them.
