---
description: Rules for Business Central reports, report extensions, processing-only reports, request pages, datasets, and layouts.
applyTo: "**/Reports/**/*.al,**/ReportExtensions/**/*.al,**/*.Report.al,**/*.ReportExt.al"
---

# Report and Report Extension Rules

## Design choice
- Prefer `reportextension` when the standard report is a suitable extension target; create a new report only when the requirement cannot be safely met by extension.
- Use a processing-only report only for a user-invoked batch process that benefits from a request page and report execution model.
- Keep business calculations reusable outside the report when they are shared or business-critical.

## Dataset and data access
- Include only required dataitems and columns.
- Apply request filters and dataitem links early. Verify keys, joins, FlowFields, totals, currencies, dimensions, and company scope.
- Avoid database calls inside row-level triggers when values can be joined, preloaded, cached safely, or calculated once.
- Assess expected row count, memory, rendering time, Excel/RDLC/Word limitations, and background scheduling.

## Request page and behavior
- Provide clear options, captions, tooltips, defaults, validation, and saved-settings behavior.
- Separate filters from options and ensure options produce deterministic output.
- Respect permissions and never expose sensitive fields merely because they are available in the source table.

## Layouts
- Preserve existing layouts and behavior unless the requirement explicitly changes them.
- Confirm whether a new or modified RDLC, Word, Excel, or custom layout is required.
- Keep dataset names stable when layouts depend on them. Review translation, pagination, grouping, totals, blank pages, and output accessibility.

## Testing
- Validate dataset output separately from visual layout.
- Test filters, empty data, boundary volumes, currencies, languages, permissions, scheduled execution, and each supported output layout where relevant.
