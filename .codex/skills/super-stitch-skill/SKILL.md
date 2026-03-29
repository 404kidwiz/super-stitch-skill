---
name: super-stitch-skill
description: Use when working in Google Stitch or a Stitch-adjacent workflow to design or refine web/mobile screens, create multi-screen flows and prototypes, clone or closely replicate existing websites from URLs, screenshots, or HTML/CSS/JS references, generate or update DESIGN.md, or hand off Stitch concepts into premium Tailwind, shadcn/ui, and React interfaces. Canonical packaged version of the repo's premium Stitch design orchestration skill.
---

# Super Stitch Skill

Treat Stitch like a design studio, not a one-shot mockup generator.

This is the canonical packaged orchestrator for:
- Google Stitch prompt design
- reference-site recreation and redesign loops
- DESIGN.md design-system continuity
- premium visual direction and layout choice
- button, theme, and component-system decisions
- code-ready handoff into Tailwind v4, shadcn/ui, and React

## Read In This Order

1. `references/stitch-studio.md`
Use for current Stitch workflow, official-source notes, prompt strategy, prototypes, and routing.

2. `references/premium-ui-system.md`
Use for layout, mood, motion, spacing, accessibility, and anti-generic design rules distilled from `super-frontend-design` and `ui-ux-pro-max`.

3. `references/site-clone-loop.md`
Use when replicating an existing site from a live URL, screenshots, or source files and iterating until the Stitch output matches closely.

4. `references/component-handoff.md`
Use when the request touches buttons, libraries, component primitives, forms, charts, or implementation handoff.

5. `references/prompt-template.md`
Use when writing the final Stitch prompt or an edit/refinement prompt.

## Internal Routing

Use these local companion skills when the request needs deeper execution in a specific lane:

- Prompt enhancement:
  `/Users/404kidwiz/.agents/skills/enhance-prompt/SKILL.md`
- Stitch generation and editing:
  `/Users/404kidwiz/.agents/skills/stitch-design/SKILL.md`
- DESIGN.md synthesis from real Stitch screens:
  `/Users/404kidwiz/.agents/skills/design-md/SKILL.md`
- Iterative page-by-page Stitch build loop:
  `/Users/404kidwiz/.agents/skills/stitch-loop/SKILL.md`
- Stitch-to-React implementation:
  `/Users/404kidwiz/.agents/skills/react-components/SKILL.md`
- shadcn/ui component and registry decisions:
  `/Users/404kidwiz/.agents/skills/shadcn-ui/SKILL.md`
- screenshot capture and marketing-grade visual exports:
  `/Users/404kidwiz/.gemini/antigravity/skills/screenshots/SKILL.md`
- flexible browser automation for live-site inspection:
  `/Users/404kidwiz/.gemini/antigravity/skills/playwright-skill/SKILL.md`
- local webapp inspection and selector discovery:
  `/Users/404kidwiz/antigravity-skills/skills/webapp-testing/SKILL.md`

## Workflow

### 1. Clarify Only What Matters

If the prompt is underspecified, ask only the missing high-impact questions:
- what is being built
- who it is for
- the main action the user should take
- platform or breakpoint priority
- brand tone or visual direction

If enough context already exists, infer and proceed.

### 2. Pick The Right Stitch Mode

- **New concept or new screen**: compose a full structured prompt
- **Existing Stitch project**: prefer DESIGN.md + targeted edits or variants
- **Multi-screen product flow**: design the flow, then connect it as a prototype
- **Reference site clone**: audit the live site or screenshots, extract structure and behavior, and run the clone loop
- **Code handoff**: map the approved screen to components, tokens, and libraries

### 3. Build A Real Design System First

Before generation, define:
- platform and responsive intent
- visual direction
- color roles, not just colors
- typography hierarchy
- spacing rhythm
- button hierarchy and interaction states
- card, form, and navigation behavior

If a Stitch project already exists, generate or refresh `.stitch/DESIGN.md` before pushing new screens.

### 4. Write Strong Prompts

Every Stitch prompt must explicitly define:
- audience
- product purpose
- layout structure
- theme and surface treatment
- component hierarchy
- primary and secondary CTA behavior
- responsiveness
- motion or interaction emphasis

Never send vague prompts like "make a nice dashboard" or "modern landing page".

### 5. Design Flows, Not Isolated Screens

For product work:
- define the entry screen
- define the key transition screens
- define the success state
- define the empty, loading, and error states
- use prototypes when the flow matters

### 6. Clone And Iterate Precisely

When the request is to recreate or closely match an existing site:
- capture desktop and mobile screenshots first
- inspect the live DOM, CSS, spacing, typography, and interaction behavior when possible
- identify what must match exactly versus what can be simplified
- write a structured Stitch prompt from the reference audit
- generate in Stitch
- compare the result against the reference
- issue targeted edit prompts until the major visual deltas are closed
- only then move into redesign, modernization, or code handoff

Use `references/site-clone-loop.md` for the exact sequence.

### 7. Hand Off Cleanly

If implementation is requested, convert the design into:
- Tailwind v4 tokens and utilities
- shadcn/ui and Radix-friendly component choices
- React component boundaries
- motion guidance
- accessibility rules

## Non-Negotiables

- Avoid generic AI layouts.
- Only clone or closely reproduce sites the user owns or is authorized to recreate.
- No emoji icons in production UI.
- No static hero if the page is meant to sell, impress, or lead.
- No pure black or pure white unless the brand explicitly calls for it.
- Always define button states: default, hover, focus, active, disabled, loading.
- Always account for touch targets, keyboard focus, and reduced motion.
- Prefer targeted edits over full regenerations once the direction is correct.
- When cloning, compare against screenshots and note the remaining deltas explicitly instead of guessing.
- If a user asks for "premium", "cinematic", "modern", or "2026-grade", bias toward the premium rules in `references/premium-ui-system.md`.

## Output Shapes

### When generating a new design prompt

Return:
- the final Stitch-ready prompt
- 3 to 5 explicit design decisions
- optional next-step recommendation: DESIGN.md, prototype, or component handoff

### When cloning or recreating an existing site

Return:
- a short reference audit
- the Stitch-ready clone prompt
- the major delta list after each comparison round
- the next edit prompt needed to close fidelity gaps

### When building DESIGN.md

Generate or update:
- `.stitch/DESIGN.md`

### When preparing code handoff

Return:
- component breakdown
- button and form variants
- library picks
- motion guidance
- implementation notes for React, Tailwind, and shadcn/ui

## Success Criteria

The skill is succeeding when the design output:
- feels intentional instead of generic
- carries a consistent visual language across screens
- can reproduce a reference site closely when cloning is requested
- is implementation-ready
- includes interaction states and responsive behavior
- can move cleanly from Stitch into code
