# Site Clone Loop

Use this file when the user wants one of these:
- clone a website into Stitch
- match an existing site as closely as possible
- recreate a screenshot as a real UI
- turn an existing site into a redesign starting from a faithful replica

## Scope

This workflow covers:
- live URL input
- screenshot-only input
- HTML/CSS/JS reference input
- redesign after fidelity pass

Use only for sites the user owns or is authorized to reproduce.

## Core Principle

Do not jump straight from "clone this site" to a vague prompt.

Always move through this loop:
1. capture
2. inspect
3. extract
4. prompt
5. generate
6. compare
7. edit
8. repeat

## Step 1: Capture The Reference

If the site is live:
- capture desktop screenshot
- capture mobile screenshot
- capture full-page screenshot where useful
- note the viewport sizes used

Recommended tooling:
- Playwright-based browser capture
- existing screenshot/browser automation skills

If screenshots are provided by the user:
- inspect all images
- identify visible layout breakpoints
- note what parts of the UI are missing from the screenshots

## Step 2: Inspect The Site

When a live site or code is available, extract:
- layout structure
- section order
- nav behavior
- typography hierarchy
- spacing rhythm
- colors and gradients
- border radius
- shadows and surface treatment
- button variants
- card patterns
- form styling
- animation and hover behavior
- responsive changes
- any meaningful JavaScript interactions

If HTML/CSS/JS is available, recreate the structural truth:
- semantic HTML regions
- CSS variables and tokens
- layout utilities
- JS-driven interactions like tabs, accordions, menus, sliders, sticky behavior

Do not flatten interactive sites into static mockups unless the user explicitly wants a static approximation.

## Step 3: Create A Clone Audit

Write a concise audit before prompting Stitch.

Suggested structure:

```md
## Clone Audit
- Site type:
- Viewports captured:
- Must-match elements:
- Simplifiable elements:
- Design system summary:
- Interaction summary:
- Risky fidelity areas:
```

Must-match elements usually include:
- overall composition
- hero structure
- section ordering
- navigation pattern
- typography scale
- color roles
- CTA placement

Simplifiable elements may include:
- exact copy
- micro-animations
- embedded third-party widgets
- complex data feeds

## Step 4: Write The Stitch Clone Prompt

The prompt should explicitly say this is a **high-fidelity recreation** of a reference site.

Include:
- page purpose
- exact layout pattern
- section order
- colors and roles
- typography character
- spacing rhythm
- button styles
- card and form styles
- responsive behavior
- interaction expectations
- what should match closely
- what can be approximated

Use the clone prompt template in `prompt-template.md`.

## Step 5: Generate In Stitch

Generate the first-pass screen or screens.

If it is a single-page site:
- start with the home page

If it is multi-page or app-like:
- start with the highest-value screen
- then create the rest of the flow and connect as prototype

## Step 6: Compare Against The Reference

After generation, compare the new Stitch output against the captured screenshots.

Always assess:
- structure
- spacing
- typography
- surfaces
- color and contrast
- button hierarchy
- image/media framing
- interaction cues
- breakpoint behavior

Use a delta list, not vague commentary.

Suggested format:

```md
## Delta List
- Header is too tall by roughly 12 to 16px
- Hero typography is too soft; needs bolder weight and tighter tracking
- CTA button needs sharper corners and stronger contrast
- Feature cards need less padding and flatter shadows
- Footer columns are too evenly spaced; reference uses denser grouping
```

## Step 7: Edit, Don’t Restart

Feed the delta list back into Stitch as targeted edit prompts.

Good edits:
- reduce header height and tighten nav spacing
- switch hero from centered stack to left text / right visual split
- flatten cards and reduce radius
- darken the background and brighten CTA contrast
- match mobile nav behavior more closely

Bad edits:
- make it better
- modernize it
- improve spacing everywhere

## Step 8: Move Into Redesign

Once the clone is close enough, branch into redesign if requested.

Possible redesign directions:
- modernize while preserving structure
- keep layout but swap theme
- convert to dark mode
- elevate into premium cinematic style
- simplify and improve accessibility
- translate into shadcn/ui + Tailwind implementation

When redesigning, preserve a clear thread back to the reference unless the user asks for a larger departure.

## HTML/CSS/JS Recreation Guidance

When the user wants an actual recreation in code before or alongside Stitch:
- rebuild the DOM structure faithfully
- preserve key CSS layout logic and tokens
- replicate JS-driven interactions that define the feel of the site
- capture screenshots of the recreated version
- use those screenshots and the code audit to drive Stitch prompts

This creates a tighter loop:
reference site -> recreated HTML/CSS/JS -> screenshots -> Stitch prompt -> Stitch edits

## Suggested Artifacts

These can live under `.stitch/reference/`:
- `audit.md`
- `desktop.png`
- `mobile.png`
- `delta-round-01.md`
- `delta-round-02.md`
- `clone-prompt.md`
- `redesign-prompt.md`

These artifacts make fidelity work repeatable instead of subjective.

## Enhancement Suggestions

Recommend these when useful:
- maintain a per-round delta log
- capture both desktop and mobile before every major comparison
- build `DESIGN.md` from the approved clone before redesigning
- use prototypes for app or multi-step flows
- define a "must-match" list and a "creative freedom" list before redesign
