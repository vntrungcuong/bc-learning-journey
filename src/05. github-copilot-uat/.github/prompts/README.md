# Business Central GitHub Copilot Prompt Files

## Purpose

This folder contains the user-invoked entry points for the Business Central GitHub Copilot v2.0 workflow. Prompt files simplify common tasks without duplicating the detailed responsibilities already held in Custom Agents, Instructions, and Agent Skills.

```text
Prompt File   = START the task
Custom Agent  = WHO owns the current stage
Agent Skill   = HOW the specialized workflow is performed
Instructions  = RULES applied by repository/file context
Human         = approves material decisions and production actions
```

Prompt files are stored directly under `.github/prompts/` and use the `.prompt.md` extension.

## Architecture

```text
User invokes /prompt-name
          ↓
Prompt selects the matching Custom Agent
          ↓
Agent loads relevant Skills when applicable
          ↓
Repository and path-specific Instructions apply
          ↓
Agent returns evidence, handoff, or human gate
```

## Prompt catalog

### Primary workflow prompts

#### `/feature-from-document`

Use when a functional specification, ticket document, workshop output, or requirement file is attached. Starts with `Functional Consultant - Solution Analysis (Custom)` and produces requirement analysis, FIT/GAP, acceptance criteria, readiness, and a Solution Architect handoff.

#### `/feature-from-text`

Use when the requirement is typed directly in chat. Normalizes incomplete text, performs requirement/FIT-GAP analysis, and produces the same governed handoff.

#### `/issue-from-document`

Use when an issue document, incident report, error evidence, or troubleshooting file is attached. Starts evidence-first diagnosis with `Technical Consultant - Issue Diagnosis (Custom)`.

#### `/issue-from-text`

Use when actual/expected behavior, error, environment, and reproduction information are entered as text.

### Focused design prompts

#### `/analyze-requirement`

Use for requirement and FIT/GAP analysis only. It does not start architecture or coding.

#### `/design-solution`

Use after functional readiness to define end-to-end Business Central solution boundaries, alternatives, data flow, security, integration, migration, operations, and architecture risks.

#### `/design-technical-solution`

Use after solution design to create an implementation-ready AL technical design with verified symbols, object/file plan, performance, security, database growth, upgrade, testing, and rollback analysis.

### Focused development prompts

#### `/develop-al-object`

Use for a focused object or tightly coupled object pair. The prompt supports tables, table extensions, pages, page extensions, codeunits, reports, queries, XMLports, enums, interfaces, APIs, permission sets, profiles, control add-ins, install/upgrade objects, and tests.

#### `/develop-integration`

Use for standard/custom APIs, HttpClient, files, Dataverse, Power Platform, Azure services, middleware, webhooks, and background integration workflows.

### Quality and delivery prompts

#### `/review-al-code`

Use for independent solution/code review. Reports evidence-based findings and returns `READY FOR HUMAN REVIEW`, `CHANGES REQUIRED`, or `BLOCKED BY MISSING EVIDENCE`.

#### `/generate-al-tests`

Use to generate a traceable test matrix, implement focused AL tests, and distinguish designed, compiled, executed, passed, failed, blocked, and manual scenarios.

#### `/validate-release`

Use for the final non-deployment readiness gate covering scope, artifact identity, build/analyzers, tests, permissions, security, performance, database growth, upgrade, deployment, monitoring, rollback, and support.

## Golden workflows

### Feature or functional requirement

```text
/feature-from-document or /feature-from-text
        ↓
Functional Consultant - Solution Analysis
        ↓
/design-solution
        ↓
Solution Architect - Solution Design
        ↓
/design-technical-solution
        ↓
Technical Architect - Technical Design
        ↓
Technical Architect - Implementation Planning
        ↓
HUMAN PLAN REVIEW
        ↓
/develop-al-object or /develop-integration
        ↓
Technical Consultant - AL Development
        ↓
/generate-al-tests
        ↓
Quality Assurance - AL Testing
        ↓
/review-al-code
        ↓
Technical Architect - Solution Review
        ↓
/validate-release
        ↓
HUMAN APPROVAL REQUIRED
```

For a multi-object approved feature, the developer may use the selected development agent with the `al-feature-development` skill instead of `/develop-al-object` for each individual object.

### Issue or maintenance

```text
/issue-from-document or /issue-from-text
        ↓
Technical Consultant - Issue Diagnosis
        ↓
Functional / Solution / Technical Architecture handoff when required
        ↓
Technical Architect - Implementation Planning
        ↓
HUMAN PLAN REVIEW
        ↓
/develop-al-object or approved feature/integration development
        ↓
/generate-al-tests
        ↓
/review-al-code
        ↓
/validate-release
        ↓
HUMAN APPROVAL REQUIRED
```

## Recommended usage

1. Start a new chat for a new feature or unrelated issue to reduce irrelevant context.
2. Attach only relevant documents and reference exact source files, selections, errors, or diagnostics.
3. Fill in prompt arguments with the business outcome, scope, constraints, examples, acceptance criteria, and expected output.
4. Use the primary workflow prompts for full governed work. Use utility prompts when the upstream design is already approved or only one stage is required.
5. Keep handoffs in the conversation or attach the approved brief to the next stage.
6. Review what the agent actually verified. A generated plan, clean build, or compiled test does not prove execution or production readiness.
7. Reload VS Code after adding or changing customization files when discovery does not refresh automatically.

## Inputs that improve results

Provide the smallest complete context:

- Business goal and expected value
- Current and expected behavior
- Affected companies, modules, roles, data, pages, reports, or integrations
- Examples and edge cases
- Acceptance criteria
- Constraints and out-of-scope items
- Environment, runtime, dependency, and deployment information when relevant
- Exact error, stack, session/telemetry evidence, and reproduction steps for issues
- Expected volume, concurrency, latency, retention, and growth for performance-sensitive work

Avoid pasting large unrelated files or repeating content already available in the workspace.

## Handoffs and human gates

Prompt files do not make material approvals. Stop or escalate for:

- Financial posting behavior or accounting outcome
- Destructive data/schema changes or object/field renumbering
- Public API breaking changes
- Security boundaries, sensitive data, secrets, or permission expansion
- App identity, dependency, runtime, target, or object-range changes
- Irreversible migration or uncertain rollback
- Production deployment or publication
- Unresolved business rules that materially change the solution

## Maintenance standard

- Keep prompt files short, parameterized, and routing-oriented.
- Put role and authority in `.github/agents/`.
- Put durable coding standards in `.github/instructions/`.
- Put detailed reusable procedures in `.github/skills/`.
- Do not create a prompt for every AL object subtype unless a future workflow has genuinely different inputs or governance.
- Keep filenames in kebab case and retain the `.prompt.md` extension.
- Keep `agent` values aligned with the corresponding `.agent.md` filename identifiers.
- Review prompts after agent, skill, or workflow names change.

## File structure

```text
.github/prompts/
├── feature-from-document.prompt.md
├── feature-from-text.prompt.md
├── issue-from-document.prompt.md
├── issue-from-text.prompt.md
├── analyze-requirement.prompt.md
├── design-solution.prompt.md
├── design-technical-solution.prompt.md
├── develop-al-object.prompt.md
├── develop-integration.prompt.md
├── review-al-code.prompt.md
├── generate-al-tests.prompt.md
├── validate-release.prompt.md
└── README.md
```
