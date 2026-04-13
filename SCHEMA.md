# Wiki Schema

## Domain
Melbourne, Australia travel — attractions, dining, neighborhoods, accommodation, transportation, and itinerary planning for a 10-day trip (July 1–10).

## Conventions
- File names: lowercase, hyphens, no spaces (e.g., `flinders-street-station.md`)
- Every wiki page starts with YAML frontmatter (see below)
- Use `[[wikilinks]]` to link between pages (minimum 2 outbound links per page)
- When updating a page, always bump the `updated` date
- Every new page must be added to `index.md` under the correct section
- Every action must be appended to `log.md`

## Frontmatter
  ```yaml
  ---
  title: Page Title
  created: YYYY-MM-DD
  updated: YYYY-MM-DD
  type: entity | concept | comparison | query | summary
  tags: [from taxonomy below]
  sources: [raw/articles/source-name.md]
  ---
  ```

  Note: itinerary-day is a type variant for day-by-day itinerary pages stored in `queries/`.
  One page per trip day, named `day-N-short-name.md` (e.g. `day-1-arrival.md`).

## Raw Sources
Every researchable claim (prices, hours, facts, recommendations) should come from a documented source.
Sourced from:
- Numbeo.com — Melbourne cost of living (April 2026)
- Wikivoyage — Melbourne, Great Ocean Road, Mornington Peninsula guides
- Nomadic Matt — Melbourne travel guide (2026)
- KKday/Klook — tour research

**Graph visibility:** Raw files are Layer 1 but are proper Obsidian pages with YAML frontmatter
(`type: source`). Each raw file has a `## Related` section with a `[[wikilink]]` to its primary
entity page. This makes the raw layer visible in Obsidian's graph without creating wrapper pages.
The frontmatter `sources:` field on entity pages remains the canonical citation link.

## Tag Taxonomy

### Trip structure (numerical day tags)
`day-1` through `day-10`, `arrival`, `departure`, `free-day`

### Place types
`attraction`, `accommodation`, `transport-hub`, `market`, `landmark`

### Geography / zones
`cbd`, `inner-suburbs`, `regional-vic`, `beach`, `southbank`

### Specific neighborhoods
`fitzroy`, `st-kilda`, `flinders-street-station`, `fed-square`, `queen-victoria-market`, `yarra-valley`, `mornington-peninsula`, `great-ocean-road`

### Experience / what you'll do
`culture`, `food`, `wine`, `coffee`, `art`, `nature`, `shopping`, `nightlife`, `outdoor`, `wildlife`, `laneways`, `markets`

### Activities / attractions
`hot-springs`, `penguins`, `sovereign-hill`, `puffing-billy`, `ballarat`, `phillip-island`, `puffing-billy-phillip-island`, `open-air-museum`, `gold-rush`

### Practical / logistics
`budget`, `free`, `seasonal`, `logistics`, `practical`, `transport`, `skybus`, `sim-card`, `packing`, `booking`, `self-drive`

### Tour types
`tour`, `day-trip`, `self-drive`

### Trip planning meta
`itinerary`, `trip-planning`, `optimization`, `pricing`, `flight-analysis`, `guide`, `tips`, `departure`, `return-to-melbourne`, `arrival`

### Historical
`history`, `gold-rush`

### Built environment
`architecture`, `landmark`

### Time / conditions
`indoors`, `sunset`, `geography`, `nightlife`, `open-air-museum`

Rule: every tag on a page must appear in this taxonomy. If a new tag is needed,
add it here first, then use it. This prevents tag sprawl.

Note: `accommodation` and `transport` appear in taxonomy above (under place types
and practical respectively). `neighborhood` is deprecated — use specific suburb
names instead. `southbank` is a geographic tag, not a neighborhood.

## Page Thresholds
- **Create a page** when a place/activity appears in 2+ sources OR is central to one source
- **Add to existing page** when a source mentions something already covered
- **DON'T create a page** for passing mentions, minor details, or things outside the domain
- **Split a page** when it exceeds ~200 lines — break into sub-topics with cross-links
- **Archive a page** when its content is fully superseded — move to `_archive/`, remove from index

## Entity Pages (Places, People, Orgs)
One page per notable entity. Include:
- Overview / what it is
- Key facts (hours, address, price range, booking info)
- Relationships to other entities ([[wikilinks]])
- Source references

## Concept Pages
One page per concept or topic. Include:
- Definition / explanation
- Current state of knowledge
- Open questions or tips
- Related concepts ([[wikilinks]])

## Comparison Pages
Side-by-side analyses. Include:
- What is being compared and why
- Dimensions of comparison (table format preferred)
- Verdict or recommendation
- Sources

## Output Files (Non-Wiki Artifacts)
Generated artifacts (HTML maps, timelines, budget spreadsheets, interactive tools) live in `outputs/` — not in the wiki layers. These are opened in a browser, not rendered as wiki pages.
- `outputs/` — HTML deliverables, CSVs, SVG maps

## Update Policy
When new information conflicts with existing content:
1. Check the dates — newer sources generally supersede older ones
2. If genuinely contradictory, note both positions with dates and sources
3. Mark the contradiction in frontmatter: `contradictions: [page-name]`
4. Flag for user review in the lint report

## Wiki Health Rules
- Every entity and concept page MUST have at least one source in `sources:`
- If no raw source exists for a page, create one before writing the wiki page
- Empty directories in `raw/` should be removed
- Comparisons directory should have at least one comparison if comparisons exist in the domain
- **Orphan check** (lint): run only against `entities/`, `concepts/`, `comparisons/`, `queries/`. Exclude `raw/` — Layer 1 files are linked via frontmatter `sources:` and have `## Related` wikilinks; they are not orphans.
