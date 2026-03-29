# Stitch Studio

Use this file for the current Stitch workflow and official-source grounding.

## Current Source Notes

Checked March 28, 2026.

Primary sources:
- Google blog: `https://blog.google/innovation-and-ai/models-and-research/google-labs/stitch-gemini-3/`
- Stitch prompting guide:
  `https://stitch.withgoogle.com/docs/learn/prompting/`
- shadcn button docs:
  `https://ui.shadcn.com/docs/components/radix/button`

## What Is Current In Stitch

From Google's March 2026 Stitch update:
- Stitch uses Gemini 3 for higher-quality UI generation.
- Stitch supports **Prototypes**, which means screens should be designed as connected user flows when the product needs interaction, not as isolated canvases.

Treat those as the baseline workflow:
- prompt
- generate
- refine
- connect screens as prototypes
- hand off to code

## Studio Process

### 1. Intake

Capture:
- product or page type
- audience
- primary conversion or task
- platform
- visual direction

If a request is vague, ask only the missing pieces.

### 2. Route The Work

- **Prompt-only request**: write a production-grade Stitch prompt
- **Existing project**: pull or update `.stitch/DESIGN.md`
- **Multi-screen flow**: design the flow and explicitly call for prototype transitions
- **Implementation request**: prepare component handoff after design direction is approved

### 3. Create A Design System First

Before screen generation, define:
- color roles
- typography
- spacing rhythm
- radius and shadow rules
- navigation style
- button system
- form behavior

If a real Stitch project exists, generate `DESIGN.md` from the actual screens first.

### 4. Prompt With Structure

Stitch prompts work best when they specify:
- exact page or screen purpose
- layout sections
- visual tone
- key components
- CTA behavior
- platform and breakpoint behavior

Do not rely on one-line aesthetic prompts.

### 5. Refine By Edit, Not Reset

Once the visual direction is close:
- prefer targeted edits
- request variants
- isolate one change at a time when refining

Examples:
- adjust the card density
- switch hero layout from centered to split
- make the primary CTA more prominent
- add a stronger empty state

### 6. Prototype Flows

When working on apps or user journeys, define:
- starting screen
- critical transition screen
- decision screen
- success state
- fallback or error state

Then connect the screens as a prototype. Do not stop at static hero screens if the user needs interaction design.

### 7. Handoff

Once approved:
- map the design to components
- map tokens to Tailwind
- choose the right UI library primitives
- capture motion and responsive notes

## Prompting Rules

Always specify:
- page type
- audience
- primary action
- layout pattern
- visual direction
- CTA and interaction states
- mobile or desktop priority

Usually include:
- header/nav pattern
- section order
- card style
- button variants
- form treatment
- empty/loading/error states if product UI

## Preferred Deliverables

### New screen

Return:
- final prompt
- rationale
- follow-up refinement suggestions

### Existing project

Return:
- `.stitch/DESIGN.md`
- edit prompt or next-screen prompt

### Full flow

Return:
- ordered screen list
- prototype transition notes
- prompt per screen or one structured multi-screen prompt
