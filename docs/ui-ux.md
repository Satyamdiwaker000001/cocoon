# Doc Vault — UI/UX Design System & Adaptive Experience

**Product:** Doc Vault — Agentic AI-Based Personal Document Management System  
**Document:** `ui-ux.md`  
**Status:** UI/UX implementation contract  
**Primary framework:** Flutter + Dart  
**UI foundation:** Material 3  
**Design direction:** Calm / Cool / Soft / Premium / Secure / Intelligent  
**Primary interaction:** Natural-language document intelligence  
**Secondary interaction:** Manual document browsing and management

> This document defines how Doc Vault should look, behave, and adapt across phones, tablets, foldables, web browsers, laptops, desktops, and different input methods.

---

# 1. Design Objective

Doc Vault should feel like a **quiet, premium digital vault**.

It should not feel:

- flashy
- neon
- cyberpunk
- overly colorful
- like a generic AI chatbot
- like a government portal
- like a generic cloud drive
- like an enterprise administration dashboard

The visual experience should communicate:

```text
Calm
+
Trust
+
Privacy
+
Clarity
+
Intelligence
+
Control
```

The design must remain comfortable during long document-management sessions.

---

# 2. Core UX Principle

> **AI makes documents easier to understand and find; the interface keeps the document, source, ownership, validity, permissions, and user control visible and trustworthy.**

AI must never become the visual center at the expense of the document itself.

The product is a **document vault with intelligence**, not a chatbot with documents.

---

# 3. Design Philosophy

## 3.1 Calm visual hierarchy

Use:

- low-saturation colors
- soft neutral surfaces
- restrained contrast
- generous whitespace
- subtle borders
- very limited elevation
- predictable typography
- quiet animations

Avoid:

- saturated blue
- bright red
- pink
- neon green
- neon purple
- bright gradients
- glowing effects
- excessive shadows
- excessive color-coded cards

## 3.2 Color should support hierarchy, not create noise

The interface should remain understandable even if the user mentally ignores all accent colors.

Primary hierarchy comes from:

1. Typography
2. Spacing
3. Position
4. Surface separation
5. Icons
6. Very restrained color

---

# 4. Color System — Cool and Comfortable

## 4.1 Explicit color restrictions

The Doc Vault visual system must **not use blue, red, pink, or highly saturated/highlighted colors as design colors**.

In particular, do not use:

```text
Bright blue
Electric blue
Royal blue
Cyan
Bright red
Crimson
Hot pink
Magenta
Neon green
Neon purple
Orange-heavy interfaces
High-saturation gradients
```

Semantic situations such as errors or warnings should be communicated primarily with **text, icons, labels, and layout**, with only a restrained low-saturation tonal difference when necessary.

---

# 5. Recommended Color Palette

The palette is intentionally based on cool, muted, low-saturation neutrals.

## 5.1 Light theme

| Token | Hex | Purpose |
|---|---|---|
| App Background | `#F3F5F4` | Main background |
| Surface | `#FAFBFA` | Cards/panels |
| Surface Elevated | `#FFFFFF` | Dialogs/sheets/important surfaces |
| Surface Soft | `#E9EEEC` | Secondary containers |
| Surface Cool | `#E5EBEA` | Subtle visual separation |
| Primary Text | `#26302F` | Main text |
| Secondary Text | `#66716F` | Supporting text |
| Tertiary Text | `#899391` | Low-emphasis metadata |
| Disabled | `#AAB3B1` | Disabled content |
| Border | `#D7DEDC` | Dividers and outlines |
| Border Soft | `#E2E7E5` | Very subtle separation |

### Main accent family

Use **muted sage / eucalyptus**, not blue.

| Token | Hex | Purpose |
|---|---|---|
| Sage | `#607A70` | Primary brand accent |
| Sage Soft | `#DCE6E1` | Selected/soft container |
| Sage Deep | `#4D655D` | High-emphasis interactive element |
| Sage Tint | `#EEF3F0` | Very subtle background |

The accent must remain restrained.

---

# 6. Semantic Colors — Restrained Only

Semantic colors are necessary for accessibility and status communication, but they must not become decorative colors.

## Valid / success

Use a muted sage/green-gray:

```text
#607A70
```

Example:

```text
✓ Valid
Expires in 120 days
```

## Attention / expiry

Use a muted warm stone/amber-neutral:

```text
#8A7B62
```

Example:

```text
⌛ Expiring soon
18 days remaining
```

## Error / expired

Use a muted brown-gray:

```text
#806C68
```

Example:

```text
! Expired
12 days ago
```

## Informational

Use neutral text and borders rather than blue:

```text
#66716F
```

### Important rule

Do not create:

```text
red card
blue card
pink badge
green neon badge
```

Instead use:

```text
Icon + text + subtle tonal surface
```

---

# 7. Dark Theme

Dark mode should be a true low-luminance interface, not simply "black background + bright colors".

Apple's current accessibility guidance notes that dark interfaces can help users with light sensitivity and recommends testing contrast carefully rather than simply reducing contrast. citeturn0search4

## Recommended palette

| Token | Hex |
|---|---|
| Background | `#151918` |
| Surface | `#1C2220` |
| Surface Elevated | `#232A27` |
| Surface Soft | `#29312E` |
| Primary Text | `#E5EAE8` |
| Secondary Text | `#AAB4B0` |
| Tertiary Text | `#7F8A86` |
| Border | `#39433F` |
| Sage | `#9BAFA6` |
| Sage Soft | `#2D3934` |

No neon accents.

No pure-white text everywhere.

No saturated blue/red/pink.

---

# 8. Material 3 Foundation

Use **Material 3** as the Flutter component foundation.

Flutter currently uses Material 3 by default and its Material widgets provide adaptive, accessible components. citeturn0search0turn0search2

However:

> **Do not ship the default Material 3 visual appearance unchanged.**

Customize:

- `ColorScheme`
- `TextTheme`
- component themes
- NavigationBar
- NavigationRail
- buttons
- text fields
- cards
- dialogs
- chips
- bottom sheets
- menus

Material 3 provides the structural foundation; Doc Vault provides the visual identity.

---

# 9. Typography

## Primary font

**Inter**

Use:

```text
400 Regular
500 Medium
600 SemiBold
700 Bold
```

## Type scale

| Token | Size | Weight | Use |
|---|---:|---:|---|
| Display | 32 | 700 | Rare hero headings |
| Headline | 24 | 700 | Screen titles |
| Title Large | 20 | 600 | Section/card title |
| Title Medium | 16 | 600 | Subsection |
| Body Large | 16 | 400 | Important body content |
| Body | 14 | 400 | Standard content |
| Label | 13 | 500 | Buttons/metadata |
| Caption | 12 | 400 | Secondary metadata |

Typography should carry more hierarchy than color.

Apple's current branding guidance also recommends using custom fonts only when they remain legible and accessible, with system typography remaining useful for small text. citeturn0search12

For Doc Vault:

```text
Brand/application UI → Inter
Platform/system UI → native platform behavior where appropriate
```

---

# 10. Icon System

Use:

**Material Symbols / Material Icons**

Style:

```text
Outlined-first
Simple
Quiet
Consistent
```

Do not use:

- emoji as UI icons
- random icon libraries
- colorful icons
- glowing AI icons

Suggested vocabulary:

| Function | Icon |
|---|---|
| Home | `home` |
| Documents | `description` |
| Family | `people` |
| Shared | `share` |
| Alerts | `notifications` |
| Profile | `person` |
| Search | `search` |
| AI | `auto_awesome` |
| Upload | `upload_file` |
| Scan | `document_scanner` |
| PDF | `picture_as_pdf` |
| Image | `image` |
| Expiry | `event` |
| Security | `lock` |
| Revoke | `link_off` |
| Edit | `edit` |
| Delete | `delete` |
| Filter | `filter_list` |
| Sort | `sort` |
| More | `more_vert` |

### AI icon rule

Use the AI icon only where AI is actually involved.

Do not put an AI sparkle on every card.

---

# 11. Spacing System

Use an 8-point system with a 4px utility step.

```text
4
8
12
16
24
32
48
64
```

Typical usage:

```text
4   micro gap
8   icon/text
12  compact
16  component padding
24  section
32  major section
48  page separation
64  hero spacing
```

---

# 12. Corner Radius

| Element | Radius |
|---|---:|
| Small control | 8 |
| Button | 10 |
| Input | 12 |
| Card | 14 |
| Large card | 16 |
| AI prompt | 18–20 |
| Dialog | 20 |
| Bottom sheet | 20 |

Avoid excessive rounded/pill UI.

---

# 13. Borders and Elevation

Doc Vault should feel **softly layered**, not floating.

Preferred:

```text
Subtle border
+
Slight surface contrast
+
Minimal elevation
```

Avoid heavy shadows.

Use elevation mainly to establish hierarchy:

```text
Page
  ↓
Surface
  ↓
Dialog / sheet
```

---

# 14. Adaptive Design — Core Architecture

Flutter distinguishes responsive design (fitting UI into available space) from adaptive design (choosing a usable layout for that space). Doc Vault must implement both. citeturn0search1

Do not create:

```text
Android UI
iOS UI
Desktop UI
```

as three independent products.

Create:

```text
One Doc Vault design system
        ↓
Adaptive layout system
        ↓
Different compositions based on available window size
```

The decision should be based primarily on **available window size**, not device name or operating system. Flutter's guidance explicitly recommends this approach. citeturn0search8turn0search9

---

# 15. Adaptive Breakpoints

Use these as initial design breakpoints.

| Window width | Layout mode |
|---:|---|
| `< 600` | Compact |
| `600–839` | Medium |
| `840–1199` | Expanded |
| `1200+` | Large |

These are **layout thresholds, not device classifications**.

The exact breakpoint can be adjusted during implementation after usability testing.

---

# 16. Compact Layout — Phones

Primary pattern:

```text
Single pane
+
NavigationBar
+
Full-screen detail
```

Example:

```text
┌──────────────────────────┐
│ Doc Vault            ◯   │
│                          │
│ ✨ Ask Doc Vault...      │
│                          │
│ Needs attention          │
│                          │
│ Recent documents         │
│                          │
│                          │
│                          │
├──────────────────────────┤
│ Home Docs Family Shared  │
│ Alerts                   │
└──────────────────────────┘
```

Use:

- bottom NavigationBar
- one-column content
- full-screen document detail
- bottom sheets
- touch-first controls

---

# 17. Medium Layout — Tablets / Small Windows

Use:

```text
NavigationRail
+
List / content
```

For documents:

```text
┌──────┬──────────────────────┐
│ NAV  │ Documents            │
│      │                      │
│ Home │ Driving Licence      │
│ Docs │ Passport             │
│      │ Insurance            │
│      │ Degree               │
└──────┴──────────────────────┘
```

Where space permits, introduce list-detail.

---

# 18. Expanded Layout — Tablet / Laptop

Use the **list-detail pattern**.

```text
┌──────┬──────────────┬────────────────────────┐
│ NAV  │ DOCUMENTS    │ DOCUMENT DETAIL        │
│      │              │                        │
│ Home │ Licence      │ Preview                │
│ Docs │ Passport     │ Metadata               │
│ Fam. │ Insurance    │ AI Summary             │
│      │ Degree       │ Actions                │
└──────┴──────────────┴────────────────────────┘
```

This becomes the core productivity layout.

---

# 19. Large Layout — Desktop / Wide Web

Use three functional areas:

```text
┌──────┬──────────────┬────────────────────────────┐
│ NAV  │ DOCUMENTS    │ DOCUMENT / INTELLIGENCE    │
│      │              │                            │
│ Home │ Licence      │ Preview                    │
│ Docs │ Passport     │ Metadata                   │
│ Fam. │ Insurance    │ AI Summary                 │
│      │ Degree       │ Expiry                     │
│      │              │ Access                     │
│      │              │ Ask about this document    │
└──────┴──────────────┴────────────────────────────┘
```

Do not stretch content endlessly.

Use reasonable maximum widths.

Flutter explicitly recommends avoiding layouts that consume all available horizontal space on large screens. citeturn0search9

---

# 20. Foldables

Foldables should naturally use their available panes.

Closed:

```text
Document list
```

Open:

```text
┌────────────────────┬────────────────────┐
│ Document List      │ Document Detail    │
│                    │                    │
│ Passport           │ Preview            │
│ Insurance          │ Metadata           │
│ Licence            │ AI Summary         │
└────────────────────┴────────────────────┘
```

Do not allow important controls or content to be awkwardly split across a hinge.

---

# 21. Navigation System

## Compact

Use:

```text
NavigationBar
```

Destinations:

```text
Home
Documents
Family
Shared
Alerts
```

## Medium

Use:

```text
NavigationRail
```

## Expanded/Large

Use:

```text
NavigationRail
or
Persistent Sidebar
```

The choice should depend on available window width, not simply platform.

Flutter's adaptive guidance explicitly uses available width to determine when to move from bottom navigation to side navigation. citeturn0search8

---

# 22. Platform Adaptation

Maintain one Doc Vault visual identity while respecting platform conventions.

Examples:

- touch behavior
- text editing
- scrolling
- keyboard behavior
- dialogs where platform convention materially improves usability
- system controls

Flutter provides platform adaptation mechanisms and documents when Material/Cupertino behavior should differ. citeturn0search15

Do not make iOS look like a completely different product.

---

# 23. Home Dashboard

Home is AI-first but not chatbot-first.

## Information hierarchy

```text
Greeting
    ↓
Vault overview
    ↓
Ask Doc Vault
    ↓
Suggested questions
    ↓
Needs attention
    ↓
Recent documents
    ↓
Quick actions
```

---

# 24. AI Prompt

The AI prompt is the primary discovery mechanism.

## Compact

```text
┌─────────────────────────────┐
│ ✨ Ask Doc Vault...       ➤ │
└─────────────────────────────┘
```

## Expanded

```text
┌──────────────────────────────────────────┐
│ ✨ Ask Doc Vault about your documents... │
│                                      ➤  │
└──────────────────────────────────────────┘
```

Keep the prompt visually quiet.

No glowing border.

No animated gradient.

No giant AI illustration.

---

# 25. Suggested AI Queries

Use muted suggestion chips.

Examples:

```text
What expires soon?
Show my identity documents
Find my insurance
Show Dad's documents
Find my degree certificate
```

Do not display dozens of suggestions.

3–5 contextual suggestions are enough.

---

# 26. AI Result Design

Never make AI results look like a standard chatbot conversation.

Preferred:

```text
CAR INSURANCE

Your policy expires in 18 days.

┌──────────────────────────────┐
│ Car Insurance                │
│ Satyam Diwakar               │
│                              │
│ Valid                        │
│ Expires in 18 days           │
│                              │
│ [ Open Document ]            │
└──────────────────────────────┘

Ask a follow-up

[ What's covered? ]
[ Policy number? ]
```

AI should return **document-centered answers**.

---

# 27. Source Transparency

Every factual document answer should have a route to the source.

Example:

```text
Your insurance expires in 18 days.

Source
Car Insurance
Expiry Date

[ Open Document ]
```

If page/section information is available:

```text
Source
Car Insurance
Page 2 · Expiry Date
```

---

# 28. AI Confidence

Never present uncertain extraction as fact.

Use:

```text
Confirmed
AI detected
Needs review
Unknown
```

Example:

```text
Expiry date

Needs review

We couldn't confidently identify
the expiry date.

[ Review Document ]
```

---

# 29. Documents Screen

Manual browsing remains essential.

```text
Documents

[ Search documents... ]

All
Identity
Education
Finance
Vehicle
Property
Insurance
Medical
Other

Filters:
Owner
Expiry
Shared
Type
```

---

# 30. Document Card

Use real document thumbnails where possible.

```text
┌─────────────────────────────────────┐
│ ┌──────┐  Driving Licence           │
│ │      │  Satyam Diwakar             │
│ │      │                             │
│ └──────┘  ✓ Valid                   │
│           Expires in 18 days    ⋮   │
└─────────────────────────────────────┘
```

Do not make every card strongly colored.

A document card should mostly use:

```text
neutral surface
+
typography
+
thumbnail
+
subtle status
```

---

# 31. Document Validity

Supported states:

```text
Permanent / No expiry
Valid
Expiring Soon
Urgent
Expired
Unknown
```

Prefer:

```text
✓ Valid
Expires in 120 days
```

instead of a large green block.

Prefer:

```text
⌛ Expiring soon
18 days remaining
```

instead of an orange/red card.

---

# 32. Document Detail

## Phone

```text
← Driving Licence

Preview

Driving Licence
Satyam Diwakar
✓ Valid
Expires in 18 days

Document Information
...

AI Summary
...

Ask about this document

Access
...

[ Share ] [ More ]
```

## Desktop

```text
┌──────────────────┬──────────────────────────────┐
│                  │ Driving Licence              │
│                  │                              │
│ Document Preview │ Satyam Diwakar               │
│                  │ Valid                        │
│                  │ Expires in 18 days           │
│                  │                              │
│                  │ Information                  │
│                  │                              │
│                  │ AI Summary                   │
│                  │                              │
│                  │ Ask about this document      │
│                  │                              │
│                  │ Access / Actions             │
└──────────────────┴──────────────────────────────┘
```

---

# 33. Upload UX

Flow:

```text
Select / Capture
       ↓
Uploading
       ↓
Securing
       ↓
Reading
       ↓
Understanding
       ↓
Review
       ↓
Confirm
       ↓
Ready
```

Use human-facing terminology.

Never expose:

```text
Agent 1
Agent 2
Embedding
Vectorization
RAG pipeline
LLM inference
```

Those are engineering concepts.

---

# 34. Upload Review

Show extracted fields before final confirmation.

```text
We found:

Document type
Driving Licence

Owner
Satyam Diwakar

Issue date
...

Expiry date
...

Is this correct?

[ Edit ]    [ Confirm ]
```

User correction must be easy.

---

# 35. Family Vault

Family does not mean automatic access.

```text
Family Vault

┌────────────────────────────┐
│ Dad                        │
│ 12 documents               │
│ 2 need attention           │
│                            │
│ [ View Documents ]         │
└────────────────────────────┘
```

Member detail must show:

- accessible documents
- permission scope
- document status
- expiry
- sharing state

---

# 36. Sharing

Sharing must be explicit.

```text
Share Document

Insurance Policy

Share with:
[ Mom ]

Permission:
[ View ]

Duration:
[ 7 days ]

Access ends automatically.

[ Cancel ]    [ Share ]
```

After sharing:

```text
Shared with Mom

Permission: View
Status: Active
Expires: 7 days

[ Revoke Access ]
```

---

# 37. Alerts

Alerts should focus on useful events:

```text
⌛ Car Insurance
Expires in 18 days

⌛ Passport
Expires in 42 days

✓ Driving Licence
Processing complete
```

Use semantic text and icons.

Do not rely on bright colors.

---

# 38. Search

Support three discovery modes:

### Natural language

```text
Show my identity documents
```

### Keyword

```text
Driving licence
```

### Filters

```text
Owner: Dad
Type: Insurance
Status: Expiring soon
```

---

# 39. Empty States

Use calm, informative copy.

```text
Your vault is empty

Add your first document and Doc Vault
will organize and understand it for you.

[ Upload Document ]
```

Avoid large colorful illustrations.

---

# 40. Error States

Bad:

```text
500 Internal Server Error
```

Good:

```text
We couldn't process this document.

Your document was uploaded safely, but
we couldn't read its contents.

[ Try Again ]    [ Open Document ]
```

Use neutral surfaces and muted semantic styling.

---

# 41. Loading States

Use meaningful progress:

```text
Uploading securely...
```

```text
Reading document...
```

```text
Finding matching documents...
```

Use skeletons when content structure is predictable.

Avoid indefinite decorative spinners.

---

# 42. Desktop and Web Interaction

Desktop must support:

- Mouse
- Trackpad
- Keyboard
- Hover
- Scroll wheel
- Right-click where useful
- Tab traversal
- Keyboard shortcuts
- Drag and drop where useful

Flutter explicitly recommends supporting mouse, trackpad and keyboard interaction for adaptive applications. citeturn0search16

Suggested future shortcuts:

```text
Ctrl/Cmd + K  → Ask/Search
Ctrl/Cmd + U  → Upload
Ctrl/Cmd + F  → Search documents
Esc           → Close
Enter         → Open selected item
```

---

# 43. Touch Targets

Touch interaction remains the baseline.

Interactive controls must be comfortably tappable.

Do not shrink controls simply because more screen space is available.

---

# 44. Accessibility

Support:

- scalable text
- screen readers
- semantic labels
- keyboard traversal
- focus states
- strong text/background contrast
- color-independent status
- reduced-motion preferences
- localization
- RTL readiness

Apple's accessibility guidance emphasizes accessible interaction, readable content, assistive technologies, and avoiding reliance on color alone. citeturn0search3

---

# 45. Motion

Motion should be:

```text
Quiet
Fast
Purposeful
Optional where possible
```

Good:

- upload progress
- subtle navigation transition
- expand/collapse
- success confirmation
- processing transition

Avoid:

- glowing AI animation
- bouncing cards
- animated gradients
- constant motion
- long transitions

---

# 46. Security UX

Security should feel reassuring rather than technical.

Good:

```text
Securely stored
```

```text
Private document
```

```text
Access expires in 7 days
```

```text
Shared with Mom
```

Avoid exposing implementation details in normal flows:

```text
AES-256
JWT
MongoDB
KMS
RAG
OAuth
```

Those belong in technical/security documentation or advanced settings.

---

# 47. Confirmation UX

Sensitive actions require explicit confirmation.

## Delete

```text
Delete Driving Licence?

This document will be removed from your vault.

[ Cancel ]    [ Delete ]
```

## Revoke

```text
Revoke Mom's access?

Mom will no longer be able to access
this document.

[ Cancel ]    [ Revoke Access ]
```

## Share

Show:

```text
Document
Recipient
Permission
Duration
Confirmation
```

---

# 48. Component System

Create reusable components:

```text
DocVaultTheme
DocVaultAppBar
DocVaultNavigation
DocVaultPrompt
DocVaultSuggestionChip
DocVaultDocumentCard
DocVaultDocumentPreview
DocVaultStatusBadge
DocVaultMetadataSection
DocVaultAISummary
DocVaultSourceReference
DocVaultFamilyCard
DocVaultShareCard
DocVaultExpiryCard
DocVaultEmptyState
DocVaultErrorState
DocVaultConfirmDialog
DocVaultBottomSheet
DocVaultLoadingState
```

All components consume centralized design tokens.

---

# 49. Flutter Theme Architecture

Recommended:

```text
lib/
├── core/
│   └── theme/
│       ├── app_theme.dart
│       ├── app_colors.dart
│       ├── app_typography.dart
│       ├── app_spacing.dart
│       ├── app_radius.dart
│       └── app_icons.dart
│
├── shared/
│   └── widgets/
│
└── features/
    ├── home/
    ├── documents/
    ├── upload/
    ├── family/
    ├── sharing/
    ├── alerts/
    └── profile/
```

Never hard-code visual values repeatedly inside feature screens.

---

# 50. Adaptive Flutter Implementation Rules

Use:

```text
MediaQuery.sizeOf
LayoutBuilder
constraints
window size
```

to select layout.

Do not primarily use:

```text
Platform.isAndroid
Platform.isIOS
isTablet
isDesktop
```

to determine the visual layout.

Flutter's recommended adaptive approach is to measure available space and branch the UI accordingly. citeturn0search8turn0search9

---

# 51. State Preservation

When users rotate, resize, fold/unfold, or change window size:

**preserve their context.**

Preserve where applicable:

- scroll position
- selected document
- search query
- filter state
- navigation state
- draft input
- expanded sections

Flutter specifically recommends retaining/restoring app state through orientation, window-size, and folding changes. citeturn0search9

---

# 52. Screen Inventory

## Authentication

```text
Login
Register
Verification/session state
```

## Home

```text
AI-first dashboard
```

## Documents

```text
All Documents
Categories
Search
Filters
Document Detail
```

## Upload

```text
Select/Capture
Processing
Review
Complete
```

## Family

```text
Family Overview
Member Detail
Permissions
```

## Sharing

```text
Shared With Me
Shared By Me
Ending Soon
Share
Revoke
```

## Alerts

```text
Expiry
Processing
Sharing
Security events
```

## Settings

```text
Account
Security
Notifications
Preferences
```

---

# 53. Adaptive Screen Matrix

| Screen | Compact | Medium | Expanded | Large |
|---|---|---|---|---|
| Home | 1 column | 1–2 columns | 2 columns | 2–3 zones |
| Documents | List | List | List + Detail | List + Preview + Info |
| Document detail | Full screen | Full screen / split | Split | 3-zone |
| Family | Cards/list | Cards | List + Detail | List + Detail |
| Sharing | List | List | List + Detail | List + Detail |
| Alerts | List | List | List + Detail | List + Detail |
| Upload | Full screen | Full screen | Centered workflow | Centered workflow |

---

# 54. Device and Input QA Matrix

Test at minimum:

## Phones

```text
Small Android
Large Android
Small iPhone
Large iPhone
Portrait
Landscape
```

## Foldables

```text
Folded
Open
Different postures
```

## Tablets

```text
Small tablet
Large tablet
Portrait
Landscape
Split-screen
```

## Desktop

```text
Small laptop
1080p
1440p
4K
Half-width window
Full-width window
```

## Input

```text
Touch
Mouse
Trackpad
Keyboard
Stylus where applicable
```

---

# 55. UX Anti-Patterns

Never build:

## 1. Chatbot-first dashboard

The home screen must still communicate the user's vault and important documents.

## 2. Google Drive clone

Folders should not dominate the entire product.

## 3. Enterprise DMS

Do not introduce complex enterprise workflow/role-management UI into the personal/family product.

## 4. AI everywhere

AI should feel integrated, not advertised in every component.

## 5. Color everywhere

Do not use color to make every section "interesting".

## 6. Huge desktop UI

Do not simply stretch mobile components across a monitor.

## 7. Device-specific layouts

Do not make separate designs based only on Android/iOS/Windows/macOS.

---

# 56. Design Review Checklist

Before accepting any screen, ask:

### Visual

- Is the screen calm?
- Is the color saturation low?
- Is blue/red/pink absent from the visual system?
- Is typography doing most of the hierarchy work?
- Are surfaces clearly separated without heavy shadows?

### UX

- Is the primary task obvious?
- Is the next action obvious?
- Is AI optional where appropriate?
- Can the user recover from AI/OCR mistakes?
- Are permissions understandable?

### Adaptive

- What happens below 600px?
- What happens around tablet width?
- What happens at desktop width?
- Does the layout remain useful when resized?
- Does list-detail become available when space permits?

### Accessibility

- Does it work with larger text?
- Does it work with keyboard?
- Does it work with a screen reader?
- Does status remain understandable without color?

### Product

- Does the screen make Doc Vault feel like a secure document vault?
- Does it avoid looking like a chatbot?
- Does it avoid looking like enterprise software?

---

# 57. Locked Design System

```text
PRODUCT
Doc Vault

UI Framework
Flutter + Dart

Foundation
Material 3

Design Language
Calm Secure Productivity

Visual Style
Cool / Soft / Minimal / Premium / Comfortable

Primary Color Family
Muted Sage / Eucalyptus

NO DESIGN COLORS
Blue
Red
Pink
Neon colors
Highly saturated colors
Bright gradients

Light Background
#F3F5F4

Light Surface
#FAFBFA

Light Elevated Surface
#FFFFFF

Light Soft Surface
#E9EEEC

Primary Text
#26302F

Secondary Text
#66716F

Tertiary Text
#899391

Border
#D7DEDC

Primary Accent
#607A70

Accent Soft
#DCE6E1

Accent Deep
#4D655D

Dark Background
#151918

Dark Surface
#1C2220

Dark Elevated
#232A27

Dark Primary Text
#E5EAE8

Dark Secondary Text
#AAB4B0

Dark Accent
#9BAFA6

Font
Inter

Weights
400 / 500 / 600 / 700

Icons
Material Symbols / Material Icons

Icon Style
Outlined-first

Spacing
4 / 8 / 12 / 16 / 24 / 32 / 48 / 64

Card Radius
14–16px

AI Prompt Radius
18–20px

Compact Navigation
NavigationBar

Medium Navigation
NavigationRail

Expanded Navigation
NavigationRail / Sidebar

Core Adaptive Pattern
List → Detail

Large-screen Pattern
Navigation + List + Detail/Intelligence

AI Interaction
Natural language

Manual Interaction
Traditional document browsing

Theme
Light + Dark

Layout Strategy
Window-size based adaptive design

Primary UX Feeling
Calm / Secure / Intelligent / Comfortable
```

---

# 58. Final Product Design Rule

> **Doc Vault should feel like a calm, private digital workspace: cool muted surfaces, soft sage accents, generous whitespace, excellent typography, minimal visual noise, and adaptive layouts that progressively reveal more information as the screen gets larger.**

The interface should never need bright blue, red, pink, neon colors, or visual gimmicks to feel modern.

---

# 59. Final Engineering Rule

> **Design once, adapt everywhere.**

One Flutter/Dart design system should support:

```text
Phone
   ↓
Tablet
   ↓
Foldable
   ↓
Laptop
   ↓
Desktop
   ↓
Web
```

The content and product identity remain consistent.

The **layout, navigation, density, interaction model, and information visibility** adapt to the available space and input method.

Flutter's official adaptive guidance explicitly recommends this model: measure available space, then branch the layout rather than branching primarily on device type. citeturn0search1turn0search8
