# Component Handoff

Use this file when the design needs to translate cleanly into code.

## Default Library Stack

For most Stitch-to-code handoffs, default to:
- Tailwind CSS v4
- shadcn/ui
- Radix UI primitives when composition is needed
- Lucide icons
- Framer Motion for entrance and interaction motion

Use GSAP only when the page is scroll-driven, narrative, or presentation-heavy.
Use Three.js or R3F only when 3D adds real product value.

## Button System

Prefer a shadcn-aligned mental model so the design survives implementation:

Variants:
- `default`
- `secondary`
- `outline`
- `ghost`
- `link`
- `destructive`

Sizes:
- `xs`
- `sm`
- `default`
- `lg`
- `icon`
- `icon-xs`
- `icon-sm`
- `icon-lg`

Implementation note from current shadcn docs:
- Tailwind v4 can leave buttons with `cursor: default`
- if needed, add a base rule so interactive buttons use `cursor: pointer`

Also require:
- `aria-label` for icon-only buttons
- visible focus rings
- disabled and loading states

## Forms

For production handoff, specify:
- field size and spacing
- validation placement
- helper text style
- success/error messaging
- keyboard and mobile behavior

Good default choices:
- shadcn `Input`
- `Textarea`
- `Select`
- `Checkbox`
- `RadioGroup`
- `Dialog`
- `Popover`

## Layout And Surfaces

Map design decisions into implementation tokens:
- surface background
- border or divider strategy
- radius scale
- shadow scale
- gap rhythm
- container widths

Avoid hardcoding one-off hex colors in components unless the system truly requires it.

## Charts And Dense UI

If the screen includes data views:
- choose chart type by task, not aesthetics
- keep color assignments semantic
- provide table or summary fallback when needed
- preserve legibility over visual flair

## Handoff Checklist

Before calling design "ready for code", make sure you can answer:
- what library owns the component primitives
- what the button variants are
- how the nav behaves
- what the mobile collapse behavior is
- what the loading, empty, and error states look like
- what motion is essential versus optional
