# Wiki Log

> Chronological record of all wiki actions. Append-only.
> Format: `## [YYYY-MM-DD] action | subject`
> Actions: ingest, update, query, lint, create, archive, delete
> When this file exceeds 500 entries, rotate: rename to log-YYYY.md, start fresh.

## [2025-04-13] create | Wiki initialized
- Domain: Melbourne vacation travel (Jul 1–10, 2025)
- Structure created with entities/, concepts/, comparisons/, queries/, itinerary/, raw/articles/, raw/assets/
- 24 raw source files ingested from web research
- 34 wiki pages created across entities, concepts, comparisons, and itinerary

## [2025-07-05] lint + fix | Wiki graph audit
- Ran graph analysis across all wiki layers (entities, concepts, comparisons, queries, itinerary)
- Found 34 wiki pages had frontmatter sources but no body wikilinks to raw sources
- Action: Added `## Sources` section with `[[wikilinks]]` to 32 wiki pages
- 2 pages already had Sources sections (day-trip-comparison, accommodation-areas-comparison) — skipped
- Created 2 entity pages for previously unattached raw sources:
  - entities/melbourne-cost-of-living.md (from raw/articles/melbourne-cost-of-living.md)
  - entities/nomadic-matt-melbourne-guide.md (from raw/articles/nomadic-matt-melbourne-guide.md)
- Created index.md (first time) and log.md (first time)
- Files touched: 32 wiki pages patched, 2 new entities created, index.md created, log.md created

## [2025-07-05] archive | melbourne-10-day-itinerary
- queries/melbourne-10-day-itinerary.md moved to _archive/queries/melbourne-10-day-itinerary.md
- Superseded by 10 individual itinerary/day-*.md pages
- No other wiki page linked to it (confirmed orphan)

## [2026-04-13] lint + fix | Wiki graph and index audit
- 47 broken wikilinks fixed: all `[[raw/articles/...]]` wikilinks converted to plain text references
- 1 remaining raw wikilink (`[[mornington-peninsula|Rye]]`) fixed to `[[mornington-peninsula]] (Rye)`
- SCHEMA.md patched: `itinerary-day` added to type enum; 15 new tags added to taxonomy (practical, gold-rush, tour, self-drive, day-trip, hot-springs, penguins, wine-region, open-air-museum, guide, tips, optimization, pricing, flight-analysis)
- index.md rebuilt: removed `## Raw Sources` section (Layer 1 not indexed per schema); added 3 missing pages (fed-square, melbourne-accommodation-areas, what-to-pack-melbourne); removed 25 stale raw source entries + archived melbourne-10-day-itinerary; all 35 pages now indexed
- 2 orphan pages connected: accommodation-areas-comparison now links to melbourne-cost-of-living and nomadic-matt-melbourne-guide
- Final audit: 0 broken links, 0 orphans, 0 missing from index, 0 in index not in filesystem

## [2026-04-13] restructure | Fold itinerary/ into queries/ (schema compliance)
- Moved 10 `itinerary/*.md` files into `queries/` — itinerary is a type variant of query, not a separate layer
- Empty `itinerary/` directory removed
- index.md updated: `## Itinerary` section merged into `## Queries` (12 entries total)
- SCHEMA.md: `itinerary-day` type removed from main enum; documented as a stored-in-queries variant with naming convention `day-N-short-name.md`
- All wikilinks to day pages already used bare filenames — no link fixes needed
- Final state: 35 pages across 4 Layer 2 directories (entities 14, concepts 7, comparisons 2, queries 12)

## [2026-04-13] update | Raw layer graph visibility
- All 24 raw files now have `## Related` section with `[[wikilink]]` to their primary entity page
- raw/articles/day-9-suggestions.md -> [[yarra-valley]]
- raw/articles/fed-square-research.md -> [[fed-square]]
- raw/articles/fitzroy-research.md -> [[fitzroy]]
- raw/articles/flinders-street-station-research.md -> [[flinders-street-station]]
- raw/articles/great-ocean-road-research.md -> [[great-ocean-road]]
- raw/articles/hot-springs-peninsula-research.md -> [[mornington-peninsula]]
- raw/articles/kkday-tour-research.md -> [[tour-details-and-prices]]
- raw/articles/melbourne-arts-precinct-research.md -> [[melbourne-arts-precinct]]
- raw/articles/melbourne-cbd-research.md -> [[melbourne-cbd]]
- raw/articles/melbourne-coffee-culture-research.md -> [[melbourne-coffee-culture]]
- raw/articles/melbourne-cost-of-living.md -> [[melbourne-cost-of-living]]
- raw/articles/melbourne-laneways-research.md -> [[melbourne-laneways]]
- raw/articles/melbourne-stay-transport.md -> [[accommodation-areas-comparison]]
- raw/articles/melbourne-transport-myki-research.md -> [[melbourne-transport-myki]]
- raw/articles/melbourne-weather-july-research.md -> [[melbourne-weather-july]]
- raw/articles/mornington-peninsula-accommodation.md -> [[mornington-peninsula]]
- raw/articles/nomadic-matt-melbourne-guide.md -> [[nomadic-matt-melbourne-guide]]
- raw/articles/puffing-billy-research.md -> [[puffing-billy-phillip-island]]
- raw/articles/queen-victoria-market-research.md -> [[queen-victoria-market]]
- raw/articles/sovereign-hill-research.md -> [[sovereign-hill]]
- raw/articles/st-kilda-research.md -> [[st-kilda]]
- raw/articles/wikivoyage-great-ocean-road.md -> [[great-ocean-road]]
- raw/articles/wikivoyage-melbourne.md -> [[melbourne-cbd]]
- raw/articles/wikivoyage-mornington-peninsula.md -> [[mornington-peninsula]]
- SCHEMA.md updated: Raw Sources section now documents graph visibility convention
- SCHEMA.md updated: orphan check rule scoped to L2 only; raw/ excluded
- All 24 raw files confirmed cited in L2 frontmatter `sources:` fields
