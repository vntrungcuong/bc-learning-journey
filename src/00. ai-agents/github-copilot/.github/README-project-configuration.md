# Project Configuration Examples

This file contains only configuration examples for **Section 1 - Project Configuration** in `.github/copilot-instructions.md`.

> Replace the example values with values from the actual Business Central repository. Values marked `COPY_FROM_APP_JSON` must be copied from the project's `app.json`. The examples below are intentionally focused on configuration, not on the rest of the Copilot framework.

## 1. Application identity

Template in `copilot-instructions.md`:

```yaml
projectDisplayName: "<PROJECT_DISPLAY_NAME>"
projectNamespaceSegment: "<PROJECT_NAME_WITHOUT_SPACES>"
publisherDisplayName: "<PUBLISHER_FROM_APP_JSON>"
publisherNamespaceRoot: "<PUBLISHER_NAMESPACE_ROOT>"
objectAffix: "<PREFIX_OR_SUFFIX>"
objectIdRanges:
  - from: <START_ID>
    to: <END_ID>
```

Example:

```yaml
projectDisplayName: "Fundamentals"
projectNamespaceSegment: "Fundamentals"
publisherDisplayName: "Cuong Mai"
publisherNamespaceRoot: "CuongMai"
objectAffix: "CMI"
objectIdRanges:
  - from: 50100
    to: 50149
```

### What is `publisherNamespaceRoot`?

`publisherNamespaceRoot` is the stable technical namespace segment that represents the publisher or organization. It does not have to be identical to the display value in `app.json.publisher`.

Example:

```text
Publisher display name : Cuong Mai
Namespace root         : CuongMai
```

This produces namespaces such as:

```al
namespace CuongMai.Fundamentals.Sales.SalesOrder;
```

For this example:

```text
CuongMai      -> publisherNamespaceRoot
Fundamentals  -> projectNamespaceSegment
Sales         -> Business Area / Module
SalesOrder    -> Feature / Function
```

Use a stable PascalCase technical name such as `CuongMai`, `Contoso`, or an organization-approved abbreviation. Do not put spaces, environment names, versions, or branch names in this segment.

---

## 2. Business Central target

Template in `copilot-instructions.md`:

```yaml
businessCentralDeployment: "<Online|OnPrem>"
target: "<Cloud|OnPrem>"
runtime: "<RUNTIME_FROM_APP_JSON>"
applicationVersion: "<APPLICATION_VERSION_FROM_APP_JSON>"
platformVersion: "<PLATFORM_VERSION_IF_APPLICABLE>"
countryOrRegion: "<LOCALIZATION>"
```

Example for a Business Central Online project:

```yaml
businessCentralDeployment: "Online"
target: "Cloud"
runtime: "COPY_FROM_APP_JSON"
applicationVersion: "COPY_FROM_APP_JSON"
platformVersion: "COPY_FROM_APP_JSON_IF_PRESENT"
countryOrRegion: "VN"
```

Example after reading an actual `app.json`:

```json
{
  "publisher": "Cuong Mai",
  "application": "<actual value>",
  "platform": "<actual value>",
  "runtime": "<actual value>",
  "target": "Cloud"
}
```

Copy those actual values into:

```yaml
businessCentralDeployment: "Online"
target: "Cloud"
runtime: "<actual app.json runtime>"
applicationVersion: "<actual app.json application>"
platformVersion: "<actual app.json platform>"
countryOrRegion: "VN"
```

**Why the version numbers are not hard-coded in this example:** they are project-specific. Do not copy a Business Central version from this README into another repository. Read the real `app.json` instead.

Example for an On-Premises project:

```yaml
businessCentralDeployment: "OnPrem"
target: "OnPrem"
runtime: "<actual app.json runtime>"
applicationVersion: "<actual app.json application>"
platformVersion: "<actual app.json platform>"
countryOrRegion: "VN"
```

---

## 3. Repository structure

Template in `copilot-instructions.md`:

```yaml
sourceRoot: "<SOURCE_ROOT, for example src or Modules>"
testRoot: "<TEST_ROOT, for example test or Tests>"
documentationRoot: "<DOCUMENTATION_ROOT, for example docs>"
artifactsRoot: "<BUILD_OUTPUT_ROOT>"
```

Example using a conventional repository layout:

```yaml
sourceRoot: "src"
testRoot: "test"
documentationRoot: "docs"
artifactsRoot: "artifacts"
```

Corresponding repository example:

```text
Fundamentals/
├── app.json
├── src/
├── test/
├── docs/
├── artifacts/
└── .github/
```

If the project already uses another structure, configure the actual folder names instead. Example:

```yaml
sourceRoot: "Modules"
testRoot: "Tests"
documentationRoot: "Documentation"
artifactsRoot: "Output"
```

---

## 4. Quality configuration

Template in `copilot-instructions.md`:

```yaml
requiredAnalyzers:
  - CodeCop
  - UICop
  - <AppSourceCop or PerTenantExtensionCop when applicable>
treatWarningsAsErrors: <true|false>
testAppSeparated: <true|false>
minimumRequiredReviewers: <NUMBER>
```

### Example A: Per-Tenant Extension

```yaml
requiredAnalyzers:
  - CodeCop
  - UICop
  - PerTenantExtensionCop
treatWarningsAsErrors: true
testAppSeparated: true
minimumRequiredReviewers: 1
```

### Example B: AppSource application

```yaml
requiredAnalyzers:
  - CodeCop
  - UICop
  - AppSourceCop
treatWarningsAsErrors: true
testAppSeparated: true
minimumRequiredReviewers: 1
```

### Example C: project without a separate test app

```yaml
requiredAnalyzers:
  - CodeCop
  - UICop
  - PerTenantExtensionCop
treatWarningsAsErrors: true
testAppSeparated: false
minimumRequiredReviewers: 1
```

Use the analyzer that matches the project's real distribution model. This block describes the expected quality policy for Copilot; the team's actual workspace/CI configuration remains responsible for enabling and enforcing analyzers and review policies.

---

## 5. Delivery controls

Template in `copilot-instructions.md`:

```yaml
allowedDevelopmentEnvironment: "<SANDBOX_OR_CONTAINER>"
productionPublishAllowedFromCopilot: false
autoCommitAllowed: false
autoMergeAllowed: false
```

Recommended Business Central Online example:

```yaml
allowedDevelopmentEnvironment: "Sandbox"
productionPublishAllowedFromCopilot: false
autoCommitAllowed: false
autoMergeAllowed: false
```

Container-based development example:

```yaml
allowedDevelopmentEnvironment: "Container"
productionPublishAllowedFromCopilot: false
autoCommitAllowed: false
autoMergeAllowed: false
```

Keep the three automation controls `false` for the baseline framework so production publishing, Git commit, and merge remain explicit human-controlled actions.

---

# 6. Complete copy/paste example

The following combines all examples into the same structure used by `## 1. Project Configuration` in `copilot-instructions.md`.

```yaml
# Application identity
projectDisplayName: "Fundamentals"
projectNamespaceSegment: "Fundamentals"
publisherDisplayName: "Cuong Mai"
publisherNamespaceRoot: "CuongMai"
objectAffix: "CMI"
objectIdRanges:
  - from: 50100
    to: 50149

# Business Central target
businessCentralDeployment: "Online"
target: "Cloud"
runtime: "<COPY_FROM_APP_JSON_RUNTIME>"
applicationVersion: "<COPY_FROM_APP_JSON_APPLICATION>"
platformVersion: "<COPY_FROM_APP_JSON_PLATFORM_IF_PRESENT>"
countryOrRegion: "VN"

# Repository structure
sourceRoot: "src"
testRoot: "test"
documentationRoot: "docs"
artifactsRoot: "artifacts"

# Quality configuration
requiredAnalyzers:
  - CodeCop
  - UICop
  - PerTenantExtensionCop
treatWarningsAsErrors: true
testAppSeparated: true
minimumRequiredReviewers: 1

# Delivery controls
allowedDevelopmentEnvironment: "Sandbox"
productionPublishAllowedFromCopilot: false
autoCommitAllowed: false
autoMergeAllowed: false
```

Before copying this example into `copilot-instructions.md`, replace the three Business Central version placeholders with the actual `app.json` values and confirm all other example values against the repository.

---

# 7. Quick mapping: where each value comes from

```text
projectDisplayName             -> Project/team convention, usually aligned with application/product name
projectNamespaceSegment        -> Project/team namespace convention
publisherDisplayName           -> app.json: publisher
publisherNamespaceRoot         -> Project/team namespace convention
objectAffix                    -> Approved project naming convention
objectIdRanges                 -> app.json: idRanges
businessCentralDeployment      -> Project deployment model
 target                        -> app.json: target, when configured
runtime                        -> app.json: runtime
applicationVersion             -> app.json: application, when configured
platformVersion                -> app.json: platform, when configured
countryOrRegion                -> Project localization scope
sourceRoot                     -> Actual repository folder
 testRoot                       -> Actual repository/test-app structure
documentationRoot              -> Actual repository folder
artifactsRoot                  -> Actual repository/build convention
requiredAnalyzers              -> Project quality/distribution policy
treatWarningsAsErrors          -> Project build/CI quality policy
testAppSeparated               -> Actual project test architecture
minimumRequiredReviewers       -> Repository/source-control policy
allowedDevelopmentEnvironment  -> Project development policy
productionPublishAllowedFromCopilot -> Copilot safety policy
autoCommitAllowed              -> Copilot/Git safety policy
autoMergeAllowed               -> Copilot/Git safety policy
```

## Configuration rule

Whenever an example conflicts with the actual workspace or `app.json`, use the actual project configuration and update `copilot-instructions.md`. Never change the real project merely to make it match this README example.
