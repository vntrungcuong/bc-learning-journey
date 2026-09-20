# Business Central Repository Instructions

> Configure the **Project Configuration** section before using this repository with GitHub Copilot. Keep configuration values aligned with `app.json`, workspace settings, source structure, and the approved project architecture.

## 1. Project Configuration

```yaml
# Application identity
projectDisplayName: "GHC Business Central UAT"
projectNamespaceSegment: "GHCBusinessCentralUAT"
publisherDisplayName: "GHC UAT"
publisherNamespaceRoot: "GHCUAT"
objectAffix: "GHC"
objectIdRanges:
  - from: 51500
    to: 51549

# Business Central target
businessCentralDeployment: "Online"
target: "Cloud"
runtime: "18.0"
applicationVersion: "29.0.0.0"
platformVersion: "1.0.0.0"
countryOrRegion: "US"

# Repository structure
sourceRoot: "app/src"
testRoot: "test"
documentationRoot: "docs"
artifactsRoot: "artifacts"

# Quality configuration
requiredAnalyzers:
  - CodeCop
  - UICop
  - AppSourceCop
treatWarningsAsErrors: true
testAppSeparated: true
minimumRequiredReviewers: 1

# Delivery controls
allowedDevelopmentEnvironment: "Sandbox"
productionPublishAllowedFromCopilot: false
autoCommitAllowed: false
autoMergeAllowed: false
```

### Configuration rules

- Treat `app.json` as the source of truth for application identity, runtime, target, dependencies, features, object ranges, resource exposure policies, and application compatibility.
- If a configured value conflicts with `app.json`, report the conflict and use `app.json` for technical validation. Do not silently rewrite project identity or dependencies.
- Never invent publisher, affix, object ranges, dependency versions, tenant details, environment names, localization, or business rules.
- Never store tenant secrets, client secrets, tokens, certificates, passwords, production URLs, or customer-sensitive values in this file.
- Keep environment-specific values in approved secure configuration, VS Code settings, launch configuration, CI/CD variables, or a managed secret store, according to project policy.

## 2. Namespace Standard

Use this namespace template:

```al
namespace <PublisherNamespaceRoot>.<ProjectNamespaceSegment>.<BusinessArea>.<Feature>;
```

Recommended example:

```al
namespace CuongMai.Fundamentals.Sales.SalesOrder;
```

Segment meaning:

```text
CuongMai    = stable publisher or organization namespace root
Fundamentals = product, application, or project namespace segment
Sales       = business area or module
SalesOrder  = feature or bounded function
```

Namespace rules:

- Use stable PascalCase segments without spaces, punctuation, environment names, customer tenant IDs, version numbers, developer names, or temporary branch names.
- Prefer a durable organization or product namespace root over a legal publisher string containing spaces.
- Keep namespaces aligned with business boundaries, not only AL object types.
- Do not append `Tables`, `Pages`, or `Codeunits` when the repository already organizes files by object type.
- Reuse the same namespace for closely related objects within one feature unless a clear architectural boundary requires another namespace.
- Do not rename a published namespace casually. Assess compatibility, references, tests, and upgrade impact first.

## 3. Repository Customization Architecture

This repository uses the following GitHub Copilot layers:

```text
.github/copilot-instructions.md   = repository-wide context and governance
.github/agents/*.agent.md         = role, authority, tools, boundaries, handoff
.github/instructions/*.instructions.md = file and context-specific rules
.github/skills/*/SKILL.md         = reusable specialist workflows
.github/prompts/*.prompt.md       = user-invoked workflow entry points
Human reviewer                    = final accountability and approval
```

Use each layer only for its intended purpose. Do not duplicate long rules or workflow checklists across layers.

## 4. Role Routing

Use these Custom Agents:

```text
Functional Consultant - Solution Analysis (Custom)
Solution Architect - Solution Design (Custom)
Technical Architect - Technical Design (Custom)
Technical Consultant - AL Development (Custom)
Technical Consultant - Issue Diagnosis (Custom)
Quality Assurance - AL Testing (Custom)
Technical Architect - Solution Review (Custom)
```

### Feature or functional requirement

```text
Requirement document or text
    -> Functional Consultant - Solution Analysis
    -> Solution Architect - Solution Design
    -> Technical Architect - Technical Design
    -> Technical Consultant - AL Development
    -> Quality Assurance - AL Testing
    -> Technical Architect - Solution Review
    -> HUMAN REVIEW REQUIRED
```

### Issue or maintenance

```text
Issue document or text
    -> Technical Consultant - Issue Diagnosis
    -> Functional or Architecture handoff when required
    -> Technical Consultant - AL Development
    -> Quality Assurance - AL Testing
    -> Technical Architect - Solution Review
    -> HUMAN REVIEW REQUIRED
```

Do not skip the Functional, Solution Architecture, or Technical Architecture stages for material changes merely because source code can be generated quickly.

## 5. Mandatory Delivery Workflow

For attached documents and text-only requests, follow the same governed lifecycle.

### Stage 1: Check

Analyze in this order:

```text
Architecture -> Functional -> Technical
```

- Architecture: confirm standard Business Central capability, solution boundary, system of record, extension strategy, integrations, deployment, operations, and non-functional requirements.
- Functional: confirm business objective, AS-IS, TO-BE, roles, setup, rules, exceptions, FIT/GAP, acceptance criteria, permissions, reporting, localization, and compliance.
- Technical: inspect repository source, `app.json`, current symbols, published events, APIs, object IDs, namespaces, dependencies, analyzers, data model, performance, scale, security, database growth, upgrade, telemetry, and testability.
- Separate verified facts, source evidence, assumptions, contradictions, unresolved decisions, and unavailable runtime evidence.
- Prefer standard Business Central functionality and safe extension points before customization.

### Stage 2: Plan

Before material implementation, provide:

- Goal, scope, assumptions, exclusions, and dependencies.
- FIT/GAP and recommended option with rejected alternatives.
- Affected and new files, objects, IDs, namespaces, permissions, setup, integrations, reports, tests, telemetry, and documentation.
- Ordered implementation increments and validation after each increment.
- Acceptance-criteria and risk-to-test matrix.
- Security, performance, scalability, concurrency, database growth, retention, upgrade, deployment, rollback, monitoring, and support considerations.
- Human decisions and stop gates.

### Stage 3: Process

- Implement only an approved or sufficiently clear plan.
- Make the smallest safe change that satisfies observable requirements.
- Preserve unrelated work and repository conventions.
- Verify symbols, events, signatures, properties, APIs, dependencies, and standard behavior before use.
- Prefer extension objects, published events, interfaces, enums, setup records, permission sets, and AL-native patterns.
- Do not modify Microsoft Base Application or System Application source.
- Keep UI, domain logic, transport, mapping, persistence, scheduling, and test responsibilities appropriately separated.
- Build or compile after each meaningful increment where tools permit.
- Fix only diagnostics introduced by the task unless explicitly asked to address existing debt.
- Do not publish to production, commit, merge, or perform destructive operations automatically.

### Stage 4: Test

- Build a traceable test matrix from acceptance criteria and identified risks.
- Cover applicable positive, negative, boundary, validation, workflow/state, permission, regression, integration, retry/recovery, concurrency, scale, localization, install, upgrade, and manual UAT scenarios.
- Use deterministic and isolated test data.
- Validate observable business outcomes, not private implementation details.
- Distinguish test states explicitly: Designed, Implemented, Compiled, Executed, Passed, Failed, Blocked, and Manual.
- Never claim that a test passed when it was only authored or compiled.
- Continue correction only within approved scope, then rebuild and rerun affected tests when tooling permits.

### Stage 5: Human notification

Every implementation, fix, review, or release-readiness response must end with a human handoff containing:

- Business outcome and implementation summary.
- Files and objects changed.
- Build, analyzer, diagnostic, and test evidence.
- Functional, security, performance, scalability, database growth, upgrade, deployment, and operational findings.
- Assumptions, unresolved decisions, blocked tests, manual checks, known limitations, rollback, and residual risks.
- One explicit conclusion, such as `HUMAN REVIEW REQUIRED`, `CHANGES REQUIRED`, or `BLOCKED BY MISSING EVIDENCE`.

AI output is not final approval. Accountability remains with the assigned human reviewer.

### Stage 6: Continuous improvement

- Suggest improvements only when supported by evidence or a clearly marked recommendation.
- Separate required corrections from optional optimization and future technical debt.
- Do not expand scope silently.
- Record recurring failure patterns as candidates for updated instructions, skills, prompts, tests, analyzers, CI/CD checks, or documentation.

## 6. Business Central Engineering Principles

### Standard-first and extension-first

- Check standard configuration, feature management, workflow, API, report, event, interface, and supported extension points before custom code.
- Prefer standard tables and processes when they preserve required behavior and supportability.
- Never copy a standard object merely to make a small change.
- Verify event availability and parameter semantics in the current symbols. Never invent an event or API signature.

### Object and file design

- Use the configured object affix consistently in custom object names and follow approved naming conventions for fields, actions, procedures, labels, permissions, and files.
- Keep one primary AL object per source file unless the repository explicitly permits another pattern.
- Organize source by business area, feature, and object type according to the repository standard.
- Use clear responsibilities and cohesive codeunits. Avoid god objects and UI-bound business logic.
- Use interfaces and extensible enums when multiple implementations or controlled variation are real requirements, not as unnecessary abstraction.

### Data model and database growth

For each new or changed table, field, key, log, history, queue, staging record, media/blob, or telemetry design, assess:

- Ownership, company scope, classification, lifecycle, expected volume, write frequency, concurrency, and transaction boundaries.
- Primary and secondary keys, selectivity, sorting, write amplification, locking, and maintenance cost.
- Retention, cleanup, archive, replay, reconciliation, and deletion ownership.
- Upgrade compatibility and migration needs.
- Whether standard telemetry or existing ledger/history is preferable to custom persistent logging.

Do not claim storage impact is negligible without a documented volume assumption.

### Performance and scalability

- Filter as early as possible and load only required fields where appropriate.
- Select keys based on measured access patterns and explain write/read trade-offs.
- Avoid unnecessary database calls, `CalcFields`, external calls, or modifications inside loops.
- Keep transactions short and avoid external I/O within posting or long write transactions.
- Assess locking, retries, idempotency, duplicate processing, background workload, API pagination, payload size, report dataset volume, FlowFields, temporary data, and concurrency.
- Use Job Queue or another supported asynchronous pattern when workload and user experience justify it.
- Do not claim a performance improvement without a baseline, suspected bottleneck, measurement method, preserved behavior, and after-change evidence.

### Security and permissions

- Apply least privilege and explicit permission sets.
- Do not depend on `SUPER` to prove feature correctness.
- Set accurate `DataClassification` and protect sensitive business, personal, credential, and external data.
- Never hard-code secrets or expose them in source, prompts, logs, telemetry, errors, tests, screenshots, or documentation.
- Validate untrusted input and enforce authorization at the correct boundary.
- Review API exposure, tenant/company isolation, integration identity, delegated/app-only access, indirect permissions, debug exposure, and audit needs.

### Errors, labels, and localization

- Use translatable labels for user-facing text and stable error behavior.
- Provide actionable errors without exposing secrets or internal details.
- Avoid language-dependent program logic and hard-coded captions.
- Preserve localization and regional regulatory behavior.

### Compatibility and upgrade

- Treat public APIs, event contracts, table schema, object IDs, namespaces, dependencies, runtime, target, enum values, permission behavior, and serialized payloads as compatibility surfaces.
- Use obsolete lifecycle intentionally and document replacement paths.
- Plan install/upgrade code and data migration for non-trivial schema evolution.
- Do not renumber published objects or fields without an approved migration and compatibility plan.
- Assess rollback limitations before irreversible operations.

### Observability and support

- Add telemetry only for defined operational questions and avoid sensitive data.
- Define correlation, failure categories, actionable dimensions, retention, and ownership for integrations and background processing.
- Provide operational runbooks for scheduled work, retries, reconciliation, cleanup, monitoring, and escalation when required.

## 7. Tool and Evidence Policy

- Use official Microsoft AL development tools registered by the AL Language extension when available for build, symbol search, diagnostics, publish, and debugging.
- Use only approved and trusted tools. Do not add or invoke unofficial MCP servers, extensions, scripts, plugins, or external services without explicit review.
- Tool output is evidence, not infallible truth. Sanity-check results against source, symbols, diagnostics, and observed behavior.
- Never claim an action, execution, test result, deployment, or runtime validation that did not occur.
- If tools are unavailable, state the limitation and provide exact manual validation steps.

## 8. Human Gates

Stop and require explicit human approval before:

- Financial posting or accounting behavior changes.
- Destructive data operations, schema removal, object/field renumbering, or irreversible migration.
- App identity, publisher, runtime, target, dependency, object-range, or public API breaking changes.
- Permission expansion, sensitive-data handling, authentication, secrets, or trust-boundary changes.
- Production publish, deployment, merge, commit, release, rollback, or environment administration.
- Broad refactoring, new external services, new ISV dependencies, or architectural deviations.
- Decisions based on incomplete or contradictory business requirements that could affect data integrity, compliance, security, financial outcomes, or customer operations.

## 9. Response and Documentation Standard

- Respond in the user's language unless the requested artifact has another repository standard.
- Use English for AL identifiers, source comments, technical file content, commit messages, and reusable Copilot configuration unless project policy states otherwise.
- Keep responses structured, evidence-based, and proportional to task risk.
- Cite exact file/object/symbol locations when reviewing code.
- Mark suggestions as suggestions and facts as verified facts.
- Update user, technical, operational, security, test, migration, and release documentation when behavior changes.

## 10. Definition of Done

A task is not complete until all applicable items are satisfied:

```text
[ ] Requirement and expected behavior are understood and traceable.
[ ] Standard Business Central capability and extension points were checked.
[ ] Functional, solution, and technical designs are complete for the task risk.
[ ] Source changes follow repository instructions and verified symbols.
[ ] Build and configured analyzer results are recorded.
[ ] Permissions, security, localization, performance, scale, database growth, and upgrade impact are assessed.
[ ] Tests are traceable and their true execution status is stated.
[ ] Documentation, setup, deployment, monitoring, cleanup, rollback, and support impacts are addressed.
[ ] Unresolved assumptions and residual risks are explicit.
[ ] HUMAN REVIEW REQUIRED is issued before final acceptance.
```
