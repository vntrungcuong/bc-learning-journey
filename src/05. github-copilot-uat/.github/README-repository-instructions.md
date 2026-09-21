# Repository Instructions Guide

## Purpose

This guide explains how to configure and maintain `.github/copilot-instructions.md` for a Business Central AL repository.

The repository instruction file is the always-on governance layer for GitHub Copilot Chat in this workspace. VS Code applies it automatically to chat requests in the workspace. It must stay focused on project identity, repository-wide engineering principles, workflow governance, evidence requirements, and human approval gates.

## File location

```text
.github/
├── copilot-instructions.md
└── README-repository-instructions.md
```

Do not place another `copilot-instructions.md` inside `.github/instructions/`. That folder is reserved for scoped `*.instructions.md` files.

## Configure first

At the top of `copilot-instructions.md`, replace every placeholder in **Project Configuration**.

Minimum required values:

```text
Project display name
Project namespace segment
Publisher from app.json
Publisher namespace root
Object affix
Object ID range
Runtime
Application version
Target/deployment
Localization
Source and test roots
Required analyzers
Delivery controls
```

Use `app.json` as the technical source of truth. If the repository instruction conflicts with `app.json`, correct the instruction rather than masking the conflict.

## Namespace guidance

Recommended template:

```al
namespace <PublisherNamespaceRoot>.<ProjectNamespaceSegment>.<BusinessArea>.<Feature>;
```

Example:

```al
namespace CuongMai.Fundamentals.Sales.SalesOrder;
```

Use a stable namespace root. The `publisher` property in `app.json` may contain a legal company name with spaces, while an AL namespace segment should be a stable PascalCase technical identifier.

Good examples:

```text
Contoso.Payments.Sales.CustomerCredit
YVS.Retail.Inventory.Replenishment
CuongMai.Fundamentals.Sales.SalesOrder
```

Avoid:

```text
CustomerA.Dev2026.Sales.Tables
JohnFeatureBranch.Test.Module
TenantId.Project.Version1
```

## What belongs here

- Repository identity and technical configuration.
- Global Business Central extension principles.
- Namespace, affix, object-range, and folder conventions.
- Feature and issue workflow governance.
- Architecture, functional, technical, development, testing, review, and human gates.
- Evidence and Definition of Done requirements.
- Global security, performance, scalability, storage-growth, upgrade, observability, and deployment boundaries.
- Approved-tool policy.

## What does not belong here

Move detailed content to the correct layer:

```text
Object/file-specific coding rules -> .github/instructions/
Role/persona/tool authority        -> .github/agents/
Detailed reusable procedure       -> .github/skills/
User-invoked entry workflow       -> .github/prompts/
Secrets/environment credentials   -> approved secure configuration
```

Do not duplicate the full content of Agents, Skills, Prompts, or scoped Instructions. Duplication wastes context and creates conflicting maintenance points.

## Maintenance process

Review repository instructions when:

- `app.json` identity, runtime, target, dependencies, features, object ranges, or analyzer policy changes.
- Source/test folder conventions change.
- A new mandatory architecture, security, quality, deployment, or governance rule is approved.
- A recurring AI failure shows that a repository-wide guardrail is missing.
- The project introduces a new environment, localization, public API, integration, data-retention model, or release process.

For each change:

1. Confirm whether the rule is repository-wide.
2. Avoid duplicating a scoped instruction or skill.
3. Make the smallest clear edit.
4. Review conflicts with Agents, Instructions, Skills, and Prompts.
5. Reload the VS Code window if customization discovery has not refreshed.
6. Run the framework regression scenarios.

## Validation checklist

```text
[ ] All placeholders are replaced.
[ ] Values match app.json and repository structure.
[ ] No secrets, tenant tokens, passwords, or production credentials exist.
[ ] Namespace and affix examples match project policy.
[ ] Feature and issue workflows match the configured Custom Agents.
[ ] Prompt, Skill, Agent, and Instruction names are current.
[ ] Human gates prohibit production publish, merge, and destructive actions.
[ ] Test evidence distinguishes compilation from execution.
[ ] Performance claims require measurement.
[ ] Database growth includes volume, retention, and cleanup.
[ ] Security requires least privilege and accurate DataClassification.
[ ] Upgrade and rollback expectations are explicit.
```

## Suggested ownership

- Technical Architect owns repository-wide technical governance.
- Solution Architect and Functional Consultant review business and architecture policy changes.
- Technical Consultant proposes coding-convention updates based on implementation evidence.
- Quality Assurance reviews testing and evidence requirements.
- Repository maintainers approve changes through normal source control and peer review.

## Related files

- `agents/README.md`
- `instructions/README.md`
- `skills/README.md`
- `prompts/README.md`
- `README-github-copilot-framework.md`
