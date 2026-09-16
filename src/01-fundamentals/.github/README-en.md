# GitHub Copilot Guide for Business Central

This document explains how to use the instructions, prompts, and skills configured for Microsoft Dynamics 365 Business Central (BC) AL projects.

## 1. Instructions structure

### Personal instructions

Personal instructions are stored in the VS Code User Profile prompts folder, for example:

```text
C:\Users\<user>\AppData\Roaming\Code\User\prompts\bc-senior-consultant.instructions.md
```

They apply across the user's BC projects and contain shared principles such as:

- Senior Technical Consultant role.
- Responding in the language of the user's input.
- Prioritizing correctness, security, performance, maintainability, and upgrade safety.
- Never modifying the Base Application or System Application directly.
- Using extension patterns, event subscribers, and AL-native patterns.

Do not place project-specific values such as publisher, object ID ranges, tenant details, or business rules in personal instructions.

### Repository instructions

Each BC repository should contain:

```text
.github/
├── copilot-instructions.md
├── instructions/
│   ├── al-code.instructions.md
│   ├── al-tests.instructions.md
│   └── documentation.instructions.md
├── prompts/
└── skills/
```

The `.github/copilot-instructions.md` file contains repository-specific context and rules, including:

- Runtime, application version, and target.
- Publisher and object ID ranges.
- Dependencies and `app.json` as the source of truth.
- Build, validation, and project structure rules.

Files in `.github/instructions/` are file-scoped instructions selected through `applyTo` patterns:

- `**/*.al`: AL coding and review rules.
- `**/*Test*.al`: AL test rules.
- `**/*.md`: documentation rules.

Prompts are used for focused tasks such as code review or performance review. Skills are used for multi-step workflows such as a complete performance assessment.

## 2. Use-case workflows

### Feature development

1. Read `app.json` and clarify the business requirement.
2. Ask Copilot for a plan when the feature involves multiple objects, schema changes, permissions, or integrations.
3. Design tables, relations, keys, pages, codeunits, and events.
4. Implement in small increments using extension patterns.
5. Compile, review the diff, and run focused tests.
6. Check permissions, performance, upgrade impact, and residual risks.

Example prompt:

```text
Create an implementation plan for this feature first. Include the data model, objects, permissions, events, upgrade impact, tests, and validation steps. Do not modify files yet.
```

### Prompt template: root-cause analysis and bug fixing

1. Describe the actual and expected behavior.
2. Provide the error message, stack trace, environment, and reproduction steps.
3. Ask Copilot to classify the issue as compile-time, runtime, data, permission, integration, or performance related.
4. Ask for one falsifiable hypothesis and the cheapest diagnostic check.
5. Fix the root cause with the smallest appropriate change.
6. Compile and rerun the failing scenario.

Example prompt:

```text
Analyze this issue using the following workflow: actual behavior, root-cause hypothesis, diagnostic check, focused fix, and validation. Do not perform broad refactoring before the root cause is established.
```

### Performance review and improvement

Use `review-performance.prompt.md` for a focused review. Use the `bc-performance-review` skill for a multi-layer feature assessment.

The review should cover:

- Database calls, filters, keys, loops, and FlowFields.
- `FindSet`, `SetLoadFields`, `CalcFields`, and record loading.
- Page triggers, report datasets, API pagination, and payload size.
- Transaction scope, locking, concurrency, and external calls.
- Job Queue scheduling, retries, duplicate processing, and telemetry.
- How performance will be measured before and after the change.

Do not claim that a change is faster without identifying the suspected bottleneck, the behavior that must be preserved, and a measurement approach.

### Code review and other use cases

- **Code review:** use `review-al-code.prompt.md` and report findings first with severity, file/line, impact, recommendation, and test scenario.
- **Table/page design:** request data types, relations, keys, DataClassification, UX, permissions, and upgrade impact before generating code.
- **Integration design:** analyze sync/async behavior, authentication, idempotency, retry, timeout, correlation IDs, staging, and error handling before implementation.
- **Testing:** apply `al-tests.instructions.md` and include positive, negative, boundary, permission, concurrency, and upgrade scenarios where relevant.
- **Documentation:** apply `documentation.instructions.md` and document prerequisites, configuration, usage, limitations, and validation.

## 3. File location clarification

`.github/copilot-instructions.md` is **not missing**. It belongs directly under `.github/` and acts as the repository-level instruction for the entire repository.

The `.github/instructions/` folder is reserved for scoped instruction files, normally using `applyTo` frontmatter. You do not need another `copilot-instructions.md` inside `.github/instructions/`; adding one would duplicate responsibilities and make the configuration harder to maintain.

Recommended responsibilities:

| Component | Purpose |
| --- | --- |
| Personal instruction | Shared BC principles for the individual developer |
| `.github/copilot-instructions.md` | Repository context and project-specific rules |
| `.github/instructions/` | Rules scoped by file type |
| `.github/prompts/` | User-invoked workflows for focused tasks |
| `.github/skills/` | Multi-step, specialized workflows |

After changing customization files, run `Developer: Reload Window` so VS Code reloads the configuration.

## 4. Copy/paste prompt templates and examples

The templates below add task-specific requirements and inherit the personal, repository, and file-scoped instructions. Replace values in `<...>` before sending them to Copilot.

### 4.1 Prompt templates

#### Base prompt for any task

```text
Task: <describe the task>

Before implementation:
- Clarify the current behavior, expected behavior, and assumptions.
- For a large task, provide the plan and expected file changes first; do not modify files yet.

After implementation:
- Report files changed, validation performed, and remaining risks.
```

#### Create folders and feature structure

```text
Design the folder structure for the <feature name> feature in this Business Central repository.

Before creating folders or files:
1. Read the current repository structure and app.json.
2. Propose each folder and explain its purpose.
3. Identify the required object types: tables, pages, codeunits, reports, queries, APIs, permission sets, and tests.
4. Keep the structure simple, consistent with existing conventions, and easy to maintain.
5. Do not create placeholder files or folders without a clear purpose.

Wait for my confirmation before creating the structure. After confirmation, create it and report every file created.
```

#### Develop a new feature

```text
Analyze and implement the <feature name> feature for Business Central.

Phase 1 - do not modify files:
- Summarize business behavior and assumptions.
- Propose the data model, objects, events, pages, permissions, and dependencies.
- Analyze performance, security, upgrade impact, and test scenarios.
- Produce an implementation plan in small steps.

Phase 2 - only after the plan is clear:
- Implement one slice at a time using extension patterns and event subscribers.
- Compile and run focused validation after each slice.
- Report files changed, tests, validation, and residual risks at the end.
```

#### Root-cause analysis and bug fixing

```text
Investigate the following Business Central issue:

Actual behavior: <actual behavior>
Expected behavior: <expected behavior>
Error/stack trace: <error or stack trace>
Environment: <sandbox/on-premises/production, runtime if known>
Reproduction steps: <reproduction steps>

Required workflow:
1. Classify the issue as compile-time, runtime, data, permission, integration, or performance related.
2. Identify the code path and distinguish custom objects from standard Microsoft objects.
3. State one falsifiable root-cause hypothesis.
4. Propose the cheapest diagnostic check to confirm or reject it.
5. Only then propose the smallest focused fix; do not perform broad refactoring.
6. Run compilation/tests or state which checks could not be run.
7. Report the root cause, files changed, validation, and remaining risks.
```

#### Performance review and optimization

```text
Perform a performance review for the <feature or file>.

Analyze:
- Database calls, filters, filter selectivity, keys, and sorting.
- FindSet, SetLoadFields, CalcFields, FlowFields, and record loading.
- Database calls inside loops.
- Page triggers, report datasets, API pagination, and payload size.
- Transaction scope, locking, concurrency, and external calls.
- Job Queue scheduling, retry, duplicate processing, and telemetry.

For each finding, provide:
- Severity and file/line location.
- Suspected bottleneck and available evidence.
- Expected impact.
- Smallest practical recommendation.
- Behavior that must be preserved.
- Storage/write cost and locking/transaction trade-offs.
- How to measure before and after the change.

Do not add keys, caching, batching, or LockTable without explaining correctness and trade-offs. Do not claim an improvement without a measurement plan.
```

#### Code review

```text
Report findings before the summary, ordered by severity: Critical, High, Medium, Low.
Check:
- Functional defects and business behavior.
- Event subscribers and extensibility.
- Permissions, DataClassification, and security exposure.
- Tables, relations, keys, and data types.
- Database access, loops, transactions, and locking.
- AL-native error handling and translatable labels.
- Upgrade, dependency, and runtime compatibility.
- Test coverage and observability.

Every finding must include: file/line, problem, impact, recommendation, and validation/test scenario.
If there are no findings, state that clearly and list test gaps or residual risks.
```

#### Design a table

```text
Design an AL table for <business entity>.

Before generating code, propose:
- Fields, IDs, data types, lengths, and DataClassification.
- Primary key and secondary keys; explain the purpose of every key.
- TableRelation, validation, and deletion behavior.
- Expected data volume, filter/sort scenarios, and multi-company behavior.
- Audit fields, upgrade impact, and integration exposure.
- Permissions and focused tests.

Do not add a key merely because a field might be filtered. Choose the smallest suitable data type while preserving domain correctness and future extensibility. After the design is confirmed, generate AL code using project conventions.
```

#### Design a page/form

```text
Design a Business Central page/form for the <user workflow> workflow.

First propose:
- Appropriate page type: List, Card, Document, Worksheet, ListPart, API, or another type.
- User role and primary task.
- Fields to show, fields to omit, and logical grouping.
- Actions, promoted actions, ApplicationArea, Importance, Visible, and Editable.
- Lookup, validation, filtering, and navigation behavior.
- UX/accessibility and page-trigger performance considerations.
- Permissions, test scenarios, and upgrade impact.

Do not place complex business logic in page triggers; move suitable logic to a codeunit. After the plan is confirmed, generate the page using standard BC patterns.
```

#### Design an integration

```text
Design an integration between Business Central and <external system>.

Analyze first:
- Source/target and data ownership.
- Synchronous versus asynchronous processing.
- Authentication, secret handling, and permissions.
- Contract, versioning, pagination, and payload limits.
- Idempotency, duplicate protection, retry, timeout, and rate limits.
- Staging, correlation IDs, logging, monitoring, and error handling.
- Job Queue, partial failure, dead-letter, or retry strategy.
- Transaction scope; do not keep a database transaction open during an HTTP call unless required.

Propose the architecture, objects, data flow, failure scenarios, and test plan before writing code.
```

#### Create tests

```text
Propose and create AL tests for <feature/object>.

Include where relevant:
- Positive and negative scenarios.
- Boundary values and validation errors.
- Permissions and unauthorized access.
- Duplicate processing, retry, and integration failures.
- Concurrency and locking behavior.
- Upgrade or data migration behavior.

Keep tests deterministic, isolated, and independent of execution order. Use Arrange, Act, Assert and test business behavior rather than implementation details. Report scenarios that cannot currently be automated.
```

#### Create documentation

```text
Write documentation for <feature/object/integration> in <Vietnamese/English>.

Include concise sections for:
- Purpose and business scope.
- Prerequisites and dependencies.
- Configuration and permissions.
- Usage or operational flow.
- Error handling and troubleshooting.
- Performance considerations.
- Upgrade or migration impact.
- Limitations, validation, and test evidence.

Document only verified behavior. Mark assumptions or unvalidated areas clearly. Use readable Markdown headings, tables, and code blocks.
```

### 4.2 Prompt examples by use case

#### Example: create folders and feature structure

```text
Design the folder structure for a Customer Credit Review feature.

The feature stores credit-limit review history for a Customer, displays the history on a dedicated page, and starts a manual review from the Customer Card.

Propose the required folders, table, pages, codeunit, permission set, and test object. Do not create files yet; create the structure only after I confirm the plan.
```

#### Example: develop a new feature

```text
Analyze and implement a Customer Credit Review feature.

When a user runs an action from the Customer Card, create a review record containing Customer No., review date, credit limit, current balance, reviewer, and status. Users may view review history but must not edit completed reviews.

Create a plan first covering the data model, objects, action, permissions, validation, upgrade impact, and AL tests. Do not modify files during the first phase.
```

#### Example: root-cause analysis and bug fixing

```text
Investigate an issue where opening Customer List shows an "App published" message repeatedly and the page loads slowly.

Actual behavior: the message appears whenever the page is opened or refreshed.
Expected behavior: the message should not be part of production behavior, and the page should open within normal response time.
Reproduction steps: open Customers, refresh the browser, switch to another customer, and return.

Identify the page-trigger code path, state one root-cause hypothesis, propose the cheapest diagnostic check, and provide a focused fix. Do not perform broad refactoring before the cause is established.
```

#### Example: performance review and optimization

```text
Review the performance of the Customer Credit Review codeunit.

The current procedure scans all Customer Ledger Entries, calls CalcFields for every record, and executes Modify after each calculation. The expected data volume is approximately five million ledger entries.

Review filters, keys, FindSet, FlowFields, SetLoadFields, database calls inside loops, transaction scope, and locking. Recommend improvements with trade-offs, behavior to preserve, and a before/after measurement plan.
```

#### Example: code review

````text
Review the following AL code using a findings-first format:

```al
Customer.SetRange("Blocked", Customer."Blocked"::" ");
if Customer.FindSet() then
    repeat
        Customer.CalcFields("Balance (LCY)");
        if Customer."Balance (LCY)" > 10000 then
            Customer.Modify();
    until Customer.Next() = 0;
```

Focus on correctness, filtering, FlowField usage, unnecessary Modify calls, transaction behavior, performance, and test scenarios. Each finding must include severity, an assumed file/line, impact, and recommendation.
````

#### Example: table design

```text
Design a Customer Credit Review table.

The table stores multiple reviews for one Customer. Business fields include Customer No., Review Date, Credit Limit, Balance at Review, Reviewer User ID, Status, and Comments.

Propose data types, the primary key, necessary secondary keys, a TableRelation to Customer, DataClassification, deletion behavior, expected data volume, permissions, and upgrade risks. Do not add a key without a clear filtering or sorting scenario.
```

#### Example: page/form design

```text
Design a List page and a Card page for Customer Credit Review.

Users must filter by Customer, Status, and Review Date; view completed reviews as read-only; create a new review from Customer Card; and be unable to edit Review Date or Reviewer after the status becomes Completed.

Propose page types, fields, actions, filters, ApplicationArea, Editable/Enabled behavior, validation, permissions, and page-trigger performance risks before generating code.
```

#### Example: integration design

```text
Design an integration that sends completed Customer Credit Reviews to a Credit Risk system through a REST API.

Only reviews with Completed status should be sent. The integration must retry timeouts and HTTP 5xx responses, prevent duplicate delivery for the same Review ID, store a correlation ID, and allow a Job Queue to retry failed records.

Propose the synchronous/asynchronous flow, staging or integration status, authentication, idempotency key, retry policy, timeout, error logging, permissions, transaction boundaries, and test scenarios before writing AL code.
```

#### Example: create tests

```text
Create AL tests for Customer Credit Review.

The tests must cover:
- Creating a review for a valid Customer.
- Rejecting a review when the Customer does not exist.
- Preventing Review Date changes after completion.
- Enqueuing only completed reviews for integration.
- Preventing the same Review ID from being enqueued twice.
- Preventing users without permission from creating or editing reviews.

Organize tests using Arrange, Act, Assert and report scenarios that cannot currently be automated.
```

#### Example: create documentation

```text
Write Vietnamese documentation for the Customer Credit Review feature.

Include the purpose, user workflow, configuration, permissions, status lifecycle, integration execution, retry/error handling, data limitations, performance considerations, upgrade impact, and test evidence.

Document only behavior verified from the current code and configuration. Clearly mark assumptions or unvalidated areas.
```
