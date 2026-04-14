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

## [2026-04-13] update | Mornington Peninsula repricing
- Repriced with 2026 AUD data (verified Apr 13, 2026):
  - AUD/TWD = 22.44 (x-rates.com)
  - Car rental: Kayak shows economy $24–73/day (July peak); Kayak aggregate confirmed realistic mid-range $35–55 AUD/day
  - Peninsula Hot Springs: confirmed from official booking site (secure.peninsulahotsprings.com) — Revitalise Bath House $80 AUD, Reset Bathing $125 AUD
  - Note: "Full Day Pass" and "Hilltop Pool" no longer listed in 2026 pricing
  - Accommodation: Airbnb/booking rates updated ~$130–350 AUD/night range
  - Car insurance ~$20–30/day AUD (full coverage)
- Files updated:
  - raw/articles/hot-springs-peninsula-research.md (created date corrected, prices updated)
  - raw/articles/mornington-peninsula-accommodation.md (created date corrected, prices updated)
  - queries/tour-details-and-prices.md (hot springs prices corrected, note added)
  - queries/day-7-mornington-peninsula.md (car rental table, accommodation, budget updated)
  - queries/day-8-peninsula-hot-springs.md (hot springs prices, budget updated)
  - queries/round2-optimizations.md (accommodation prices updated)
- Files not modified (no changes needed):
  - entities/mornington-peninsula.md (general entity page, no specific prices)
  - queries/day-trip-comparison.md (side-by-side comparison uses per-person estimates, not day-trip breakdown)

## [2026-04-13] update | Embedded maps added to all days
- Added OpenStreetMap iframe embeds to all 10 day itinerary pages
- Each map section includes a bounding box covering all day locations
- Added per-stop Google Maps links for routing in browser/app
- Maps use OSM embed (no API key required, works in Obsidian preview)
- Files updated:
  - queries/day-1-arrival.md — MEL T2 to Southern Cross
  - queries/day-2-great-ocean-road.md — Lorne, Apollo Bay, Twelve Apostles, Loch Ard Gorge
  - queries/day-3-sovereign-hill.md — Melbourne to Sovereign Hill/Ballarat
  - queries/day-4-markets-cbd.md — QVM + laneways walk
  - queries/day-5-fitzroy-st-kilda.md — Tram routes, Fitzroy streets, St Kilda
  - queries/day-6-puffing-billy-phillip-island.md — Dandenong Ranges + Phillip Island
  - queries/day-7-mornington-peninsula.md — Peninsula self-drive route
  - queries/day-8-peninsula-hot-springs.md — Hot springs + peninsula
  - queries/day-9-yarra-valley-or-free-day.md — Yarra Valley + rain day options
  - queries/day-10-departure.md — CBD morning + SkyBus to airport


## [2026-04-13] update | SCHEMA tag taxonomy + full Quartz 4 site setup
- Filled in complete tag taxonomy in SCHEMA.md — all 86 tags currently in use are now enumerated
- Deprecated: "neighborhood" (use specific suburb names), "outer-suburbs" (unused)
- Added full Quartz 4 build infrastructure to this directory: package.json, quartz.config.ts, quartz/, deploy.sh, netlify.toml, etc.
- content/ symlink points to . so this directory IS the Quartz content root
- .gitignore updated: excludes public/, quartz/.quartz-cache/, node_modules/
- Force-pushed to GitHub main (source of truth is now ~/Downloads/Melbourne-vacation-7-1-to-7-10)
- Netlify build triggered via deploy.sh
- Index verified: 35 pages, all present in index.md, no orphans

## [2026-04-13] update | Map embeds verified working in Quartz build
- Confirmed: OSM iframe embeds work in local Quartz build (public/ output has iframes)
- Live site at melbourne-trip-wiki.netlify.app was stale — showed 0 iframes
- Structure: wiki content now lives in content/ directory (proper Quartz convention)
- All 10 day itinerary pages have OSM iframe maps + per-stop Google Maps links
- Triggered Netlify rebuild via deploy.sh hook

## [2026-04-13] update | Spreadsheet sync — all day pages updated from Google Sheets
- Read Google Sheets document "墨爾本2026" via Sheets API (OAuth2 authenticated)
- Audited all 10 day itinerary pages against spreadsheet "行程" sheet
- Key changes made:
  - day-4-markets-cbd.md: Added Convent Bakery breakfast, Market Lane Coffee, State Library, Melbourne Central; removed NGV (moved to day-5); fixed QVM schedule (closed Mon/Wed); removed Hardware Lane (omitted)
  - day-5-fitzroy-st-kilda.md: Added Sunday Markets (Southgate, Rose Street, Lost and Found); added Crown Melbourne + Gas Bridge fire ceremony (~18:00); added Market Lane Coffee; added National Gallery of Victoria reference; fixed day from "Saturday" to "Sunday"
  - day-6-puffing-billy-phillip-island.md: Added LUNA Croissanterie stop before departure (6:30–7:00 AM queue)
  - day-7-mornington-peninsula.md: Complete rewrite — reflects "sleep until noon", afternoon car pickup, scenic drive, evening hot springs (Peninsula Hot Springs 07:00–23:00); updated title from "Self-Drive" to "Self-Drive + Peninsula Hot Springs"; removed car rental urgency language (already booked by now)
  - day-8-peninsula-hot-springs.md: Complete rewrite — now Arthurs Seat Eagle cable car, Murrays Lookout, Ashcombe Maze & Lavender Gardens, Cape Schanck Lighthouse; hot springs moved to day-7 evening; title changed to reflect new content
  - day-9-yarra-valley-or-free-day.md: Complete rewrite — changed from "Yarra Valley or Free Day" to "Shopping Day + South Melbourne Market"; added DFO South Wharf, Myer Centre, Emporium, shopping checklist, souvenir guide
  - day-3-sovereign-hill.md: Added self-drive via V/Line train (Southern Cross → Ballarat, Bus 9/10/21); added Ballarat Wildlife Park optional add-on (koalas, kangaroos); documented paper ticket = free Ballarat bus transit
- External links verified (KKday, penguins.org.au, peninsulahotsprings.com, sovereignhill.com.au, skybus.com.au)
- index.md note added: "Day 7 and Day 8 pages updated with Apr 2026 repricing and itinerary changes from spreadsheet"
