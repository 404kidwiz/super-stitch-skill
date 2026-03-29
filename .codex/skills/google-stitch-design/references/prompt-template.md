# Prompt Template

Use these templates as the final structure for Stitch prompts.

## Full Screen Prompt

```md
[One-line summary of the product, audience, and purpose]

**PLATFORM**
- Platform: [web or mobile]
- Priority: [desktop-first, mobile-first, responsive]
- Primary audience: [who this is for]
- Primary action: [what the user should do]

**VISUAL DIRECTION**
- Design direction: [Dark Tech, Clean Minimal, Editorial Premium, Warm Product, Command Center Dashboard]
- Mood: [3 to 5 adjectives]
- Background treatment: [surface color, gradient, texture, glass, etc.]
- Typography: [tone and hierarchy]
- Iconography: [Lucide-style, minimal line icons, etc.]

**DESIGN SYSTEM**
- Primary color: [name] ([hex]) for [role]
- Secondary color: [name] ([hex]) for [role]
- Surface color: [name] ([hex])
- Text primary: [name] ([hex])
- Text secondary: [name] ([hex])
- Radius: [sharp, subtle, rounded, pill-heavy]
- Elevation: [flat, whisper-soft, medium, pronounced]

**LAYOUT**
1. **Header / Navigation:** [pattern and behavior]
2. **Hero / Entry State:** [headline, support copy, CTAs, visual treatment]
3. **Primary Content Area:** [main modules or sections]
4. **Secondary Content Area:** [proof, details, features, charts, etc.]
5. **Footer / Exit:** [links, legal, secondary CTA]

**COMPONENT RULES**
- Primary CTA: [variant, emphasis, placement]
- Secondary CTA: [variant, placement]
- Buttons: include default, hover, focus, disabled, and loading states
- Cards: [style]
- Forms / Inputs: [style]

**RESPONSIVE BEHAVIOR**
- Mobile layout: [how it collapses]
- Tablet layout: [if important]
- Desktop behavior: [grid, split layout, or wide canvas notes]

**QUALITY BAR**
- Avoid generic AI layouts
- Keep the design cohesive and implementation-ready
- Prioritize accessibility and clear hierarchy
```

## Targeted Edit Prompt

```md
Update the existing screen without changing the overall design system.

**CHANGE REQUEST**
- Change: [single focused request]
- Why: [intent]
- Keep: [what must remain unchanged]

**STATE / LAYOUT NOTES**
- Component affected: [button, hero, nav, card, chart, form, etc.]
- Behavior changes: [hover, loading, spacing, hierarchy, etc.]

Make only this change and preserve the existing visual language.
```

## Reference Clone Prompt

```md
Recreate the provided reference site as closely as possible.

**CLONE GOAL**
- Site type: [landing page, dashboard, marketing site, product app, etc.]
- Fidelity target: [high, very high, structure-first, visual-first]
- Must match: [list the critical elements]
- Can simplify: [list any acceptable simplifications]

**REFERENCE SYSTEM**
- Layout pattern: [hero split, editorial, bento, dashboard, etc.]
- Typography: [weight, scale, density, tracking]
- Color system: [primary, secondary, surfaces, text roles]
- Radius and elevation: [corners and shadows]
- Interaction cues: [hover states, sticky nav, menus, accordions, tabs, etc.]

**PAGE STRUCTURE**
1. **Header / Navigation:** [exact pattern]
2. **Hero / Above the Fold:** [exact composition]
3. **Main Sections:** [ordered list]
4. **Secondary Modules:** [proof, forms, cards, charts, etc.]
5. **Footer:** [layout and density]

**RESPONSIVE BEHAVIOR**
- Desktop: [how it should feel]
- Mobile: [how it should collapse]

**QUALITY BAR**
- Match the reference closely in spacing, hierarchy, and composition
- Preserve the overall feel of the original site
- Keep the output implementation-ready
```

## Clone Delta Edit Prompt

```md
Refine the cloned screen to reduce these differences from the reference.

**DELTA LIST**
- [difference 1]
- [difference 2]
- [difference 3]

**KEEP**
- [elements that are already correct]

Do not redesign the page. Only reduce the visual and structural differences from the reference.
```

## Multi-Screen Flow Prompt

```md
Design a multi-screen flow for [product or task].

**FLOW GOAL**
- User: [who]
- Start state: [entry point]
- End state: [success state]

**SCREENS**
1. [screen name] — [purpose]
2. [screen name] — [purpose]
3. [screen name] — [purpose]
4. [screen name] — [purpose or fallback]

**SYSTEM**
- Use one cohesive design system across all screens
- Keep CTA hierarchy consistent
- Design for prototype-ready transitions

**STATES**
- Include empty, loading, success, and error behavior where relevant
```
