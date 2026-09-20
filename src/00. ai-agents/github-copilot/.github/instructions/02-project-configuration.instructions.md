---
description: Rules for Business Central project manifests, VS Code configuration, analyzers, dependencies, packaging, and repository support files.
applyTo: "**/app.json,**/.vscode/*.json,**/settings.json,**/ruleset.json,**/*.ruleset.json,**/AppSourceCop.json,**/cspell.json,**/AL-Go-Settings.json,**/BcContainerHelper.config.json"
---

# Project Configuration Rules

## Manifest and identity
- Treat `app.json` as the source of truth for app identity, publisher, version, runtime, platform/application versions, target, dependencies, features, resource exposure, and object ranges.
- Do not change app ID, publisher, name, versioning strategy, runtime, target, dependencies, or `idRanges` unless the task explicitly requires it and impact is reviewed.
- Never derive the project affix or namespace from the publisher unless project policy explicitly defines that relationship.
- Use semantic and repository-approved versioning. Never reuse a version already deployed to a shared environment.

## Dependencies and symbols
- Add a dependency only when the required capability cannot be obtained from existing dependencies or standard Business Central.
- Verify dependency publisher, app ID, name, and minimum version. Assess transitive, licensing, deployment, and upgrade impacts.
- Keep symbol packages out of source control unless repository policy explicitly requires them.
- Download or refresh symbols after relevant manifest, environment, or dependency changes.

## VS Code and environment configuration
- Keep shared workspace settings portable and free of personal credentials, machine-specific paths, or tenant secrets.
- Separate development, test, UAT, and production configuration. Never configure automated production publication as a developer default.
- Keep authentication outside committed configuration and use approved secret-management mechanisms.
- Ensure launch configurations clearly identify environment type and purpose. Do not point normal development actions at production.

## Analyzer configuration
- Enable the project-approved analyzers, such as CodeCop, UICop, AppSourceCop, or PerTenantExtensionCop, according to the app distribution model.
- Keep rulesets explicit and reviewed. Every suppression must include a narrow scope and documented justification.
- Do not reduce analyzer coverage merely to obtain a successful build.

## Build and packaging
- Keep build output and generated artifacts out of source control unless required by the delivery pipeline.
- Ensure the same validated package is promoted through controlled shared environments according to repository deployment policy.
- Record configuration changes, compatibility impact, required symbol refresh, validation performed, and rollback steps.
