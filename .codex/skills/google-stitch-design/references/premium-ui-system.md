# Premium UI System

This file distills the parts of `super-frontend-design` and `ui-ux-pro-max` that matter most for Stitch work.

## Core Standard

The output should feel premium, intentional, and code-ready.

Avoid:
- generic centered layouts
- repetitive same-size cards
- flat light gradients with no hierarchy
- dead hero sections
- emoji icons
- inaccessible motion or low-contrast text

## Design Directions

Choose one direction early and stay consistent.

### 1. Dark Tech

Use for:
- AI tools
- SaaS
- developer products
- dashboards

Characteristics:
- near-black surfaces, not pure black
- electric accent color
- glass or low-opacity layers
- dense but controlled information blocks
- restrained glow and motion

### 2. Clean Minimal

Use for:
- productivity
- B2B landing pages
- finance
- focused consumer tools

Characteristics:
- calm palette
- strong grid discipline
- lots of breathing room
- crisp typography
- minimal texture, minimal motion

### 3. Editorial Premium

Use for:
- portfolio
- creative studio
- brand campaign
- storytelling pages

Characteristics:
- asymmetry
- oversized type
- image-led composition
- broken grid sections
- slow cinematic motion

### 4. Warm Product

Use for:
- wellness
- beauty
- creator tools
- lifestyle brands

Characteristics:
- soft surfaces
- warmer neutrals
- subtle gradients
- rounded components
- tactile buttons

### 5. Command Center Dashboard

Use for:
- analytics
- ops
- admin
- trading or monitoring

Characteristics:
- card clusters with clear hierarchy
- strong state color system
- chart-safe palette
- keyboard-friendly structure
- concise microcopy

## Layout Patterns

Default to one of these instead of a generic stack:
- immersive split hero
- asymmetric bento grid
- editorial stagger
- sticky narrative sections
- command-center dashboard
- gallery + detail pane

Every section should have a reason to exist and a different density from the one before it.

## Motion Rules

Use only 3 to 5 meaningful motion moments:
- hero entrance
- section reveal
- button or card hover
- nav state change
- prototype transition emphasis

Use transform and opacity first.
Respect reduced motion.
Avoid decorative motion that does not improve orientation or delight.

## Accessibility And UX Guards

Always enforce:
- 4.5:1 contrast for standard text
- visible focus states
- icon buttons must have labels
- touch targets at least 44x44
- body text at least 16px on mobile
- layouts that do not horizontally scroll
- reduced-motion fallback
- clear loading and error states for product UI

## Component Rules

### Buttons

Define all of:
- primary
- secondary
- ghost or tertiary
- destructive if relevant
- link style if relevant

Also define states:
- default
- hover
- focus
- active
- disabled
- loading

### Cards

Specify:
- radius
- elevation
- background treatment
- spacing
- hover behavior

### Forms

Specify:
- label position
- field density
- helper text
- error treatment
- submit behavior

### Navigation

Pick:
- floating glass nav
- sticky solid nav
- sidebar
- split nav

Do not leave nav behavior unspecified in premium work.

## Anti-Patterns

Reject these when they show up:
- "modern gradient website" with no structure
- full page centered stack
- hero + 3 cards + testimonial strip as default formula
- big gradient CTA with no hierarchy
- mixed radii and inconsistent shadows
- charts with decorative colors but no legibility
