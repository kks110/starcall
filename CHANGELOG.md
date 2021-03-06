# Change log

## master (unreleased)

### New features
None

### Changes
None

### Bug fixes 
None

---

## v0.6.0 - Annie
![Annie](http://ddragon.leagueoflegends.com/cdn/10.12.1/img/champion/Annie.png)

### New features
- Add Status V3 endpoint.
- Add third party code endpoint.
- Add Spectator endpoints.

### Changes
None

### Bug fixes
None

---

## v0.5.0 - Anivia
![Anivia](http://ddragon.leagueoflegends.com/cdn/10.12.1/img/champion/Anivia.png)

### New features
- Add Clash V1 endpoint.
- Add the summoner endpoint.

### Changes
None

### Bug fixes
- Add Champion V3 to the endpoints file, making it accessible.

---

## v0.4.0 - Amumu
![Amumu](http://ddragon.leagueoflegends.com/cdn/10.12.1/img/champion/Amumu.png)

### New features
- Added the champion endpoints.

### Changes
None

### Bug fixes
None

---

## v0.3.0 - Alistar
![Alistar](http://ddragon.leagueoflegends.com/cdn/10.12.1/img/champion/Alistar.png)

### New features
- Added the 3 Champion Mastery Endpoints. 
- `ApiRequests` now checks for an API key called `RIOT_API_KEY` and adds to the headers.
- Added a region parser as the API URLs require a region, but they are not the same as the normal regions.

### Changes
- Move `ApiRequests` under the `Starcall` namespace.
- Move errors in to their own directory.

### Bug fixes
None

---

## v0.2.1 - Akali
![Akali](http://ddragon.leagueoflegends.com/cdn/10.12.1/img/champion/Akali.png)

### New features
None

### Changes
None

### Bug fixes 
- The program now functions correctly with the details in the read me.

---

## v0.2.0 - Ahri
![Ahri](http://ddragon.leagueoflegends.com/cdn/10.12.1/img/champion/Ahri.png)

### New features
- Regions
    - `Starcall::Regions.list` for a full list of supported regions.
    - Static data that can change per region and now supports different regions.
    
- Languages
    - `Starcall::Languages.list` for a full list of supported languages.
    - Static data comes in different languages and now supports different languages.

### Changes
- `Starcall::StaticData` now needs to be initialised. Can be initialised with a region and a language.
If none is supplied, `euw` and `en_GB` is assumed.
- `dd_euw_versions` has now become `dd_region_versions` defaulting to `euw` if no region has been supplied.
- Errors
    - An error module has now been created where custom errors will be stored.

### Bug fixes 
None

---

## v0.1.1 - Aatrox
![Aatrox](http://ddragon.leagueoflegends.com/cdn/10.12.1/img/champion/Aatrox.png)

### New features
- Riot API static endpoints

### Changes
None

### Bug fixes 
None

-----
