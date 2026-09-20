---
description: Rules for Business Central pages, page extensions, page customizations, profiles, role centers, control add-ins, actions, and accessible UI behavior.
applyTo: "**/Pages/**/*.al,**/PageExtensions/**/*.al,**/PageCustomizations/**/*.al,**/Profiles/**/*.al,**/RoleCenters/**/*.al,**/ControlAddIns/**/*.al,**/*.Page.al,**/*.PageExt.al,**/*.PageCust.al,**/*.Profile.al,**/*.ControlAddin.al"
---

# Page and UI Rules

## Extension-first UI design
- Prefer `pageextension` or `pagecustomization` over copying a standard page.
- Preserve the standard navigation and behavior unless the approved requirement explicitly changes them.
- Place fields, groups, parts, cues, and actions in locations consistent with the target page and user task.

## Controls and text
- Provide accurate captions, tooltips, `ApplicationArea`, importance, visibility, editability, and enabled-state behavior where applicable.
- Use labels for user-facing messages and action text. Follow project capitalization and terminology consistently.
- Avoid exposing internal IDs, sensitive information, or technical diagnostics to unauthorized users.
- Design for keyboard navigation, readable grouping, and accessible client behavior.

## Actions and business logic
- Keep page triggers and action triggers thin. Delegate reusable or complex business logic to codeunits.
- Revalidate authorization and business rules server-side. Do not rely on hidden or disabled controls for security.
- Avoid long-running synchronous actions. Use suitable background or scheduled processing when required.
- Confirm action availability across record state, permissions, document status, approval state, and selection context.

## Parts, FactBoxes, Role Centers, and profiles
- Load only useful information and avoid expensive calculations on page open or record navigation.
- Keep Role Center cues and activities selective and measurable for expected user volume.
- Use profiles and page customization for role-based experience without embedding authorization assumptions.

## Control add-ins
- Use a control add-in only when native Business Central controls cannot satisfy the requirement.
- Minimize JavaScript dependencies and exposed data. Validate messages in both AL and client code.
- Define fallback behavior, compatibility, CSP/resource requirements, localization, accessibility, and support ownership.
