# Change log

## master (unreleased)

### New features
- Regions
    - `Starcall::Regions.list` for a full list of support regions.
    - Static data that can change per region, now supports a region.

### Changes
- `Starcall::StaticData` now needs to be initialised. Can be initialised with a region. If none is supplied, 'euw' is assumed.
- `dd_euw_versions` has now become `dd_region_versions` defaulting to `euw` if no region has been supplied.
- Errors
    - An error module has now been created where custom errors will be stored.

### Bug fixes 
None

## v0.1.1 - Aatrox
![Aatrox](http://ddragon.leagueoflegends.com/cdn/10.12.1/img/champion/Aatrox.png)

### New features
- Riot API static endpoints

### Changes
None

### Bug fixes 
None

-----
