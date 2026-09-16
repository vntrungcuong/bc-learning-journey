# Phase 10 - Integration Fundamentals

## Objective
Apply existing integration experience to Business Central only after core AL concepts are understood.

## Concepts
- `HttpClient`
- HTTP request/response concepts
- JSON objects, arrays and tokens
- Mapping
- Interfaces
- Failure handling
- Configuration and secret-handling concepts
- Telemetry considerations

## Exercise 10 - Practice External Integration
### Requirement
Build a small integration boundary that receives or retrieves external data, parses JSON, maps it to an internal representation, and invokes existing Sales Order business logic rather than duplicating it.

### Suggested source placement
```text
Integration/<System>/
├── Codeunits/
├── Enums/
├── Interfaces/
└── Tables/
```

### Practice tasks
- Separate transport, parsing/mapping and business behavior.
- Parse a successful response.
- Handle unsuccessful HTTP responses explicitly.
- Avoid hard-coding credentials in AL source.
- Route Sales Order rules through existing Sales Order codeunits.

### Acceptance criteria
- Integration concern is separated from Sales Order core logic.
- JSON/HTTP failures are handled explicitly.
- Sensitive configuration is not committed as source literals.
- Existing business validation remains reusable.

## Note
Use a safe development endpoint or mock suitable for the practice environment. Do not point learning exercises at production systems.
