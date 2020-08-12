![starcall](starcall.png)

----
![Build Status](https://img.shields.io/github/workflow/status/kks110/starcall/tests/master)
![Gem Version](https://img.shields.io/gem/v/starcall)
![Downloads](https://img.shields.io/gem/dt/starcall)
---
A Gem to help with calls to Riot API.

## Installation

Add this line to your application's Gemfile:

    gem 'starcall'


And then execute:

    bundle

Or install it yourself as:

    gem install starcall

## Usage

### Regions
Sometimes, due to manual upload speeds, versions in different regions might be different or due to things like version specific bugs.
Due to this, if you are looking for details of a specific region, it worth checking there rather than generically.

A full list of supported regions can be obtained by running:
```ruby
Starcall::Regions.list
```

### Languages
Things such as champion data is avalible in different languages.

A full list of supported languages can be obtained by running:
```ruby
Starcall::Languages.list
```


### Static Queries

First you need to initialise and instance of Starcall::StaticData
```ruby
static_data = Starcall::StaticData.new
```

Some of the queries below can return different data based on the region. When you initialize the class, you can pass in a valid region.
Regions that Riot support can be queried as per the Regions section above.
If no region is supplied, 'euw' will be assumed.

Some of the queries below can be returned in different languages.
Languages that Riot support can be queried as per the Languages section above.
If no language is supplied, 'en_GB' (English Great Britain) will be assumed.

```ruby
Starcall::StaticData.new(region: 'kr', language: 'ko_KR')
```

#### `season_ids`

Season ids are used in match history to indicate which season a match was played.
A full list of season ids can be retrieved with the below method.

#### `queue_ids`
Queue ids show up in several places throughout the API and are used to indicate which kind of match was played.
A full list of queue ids can be can be retrieved with the below method.

#### `map_ids`
Map ids are used in match history to indicate which map a match was played.
A full list of map ids can be can be retrieved with the below method.

#### `game_modes`
A full list of game modes can be can be retrieved with the below method.

#### `game_types`
A full list of game types can be can be retrieved with the below method.

#### Data Dragon
Data Dragon is Riots way of centralizing League of Legends game data and assets, including champions, items, runes, summoner spells, and profile icons. 
All of which can be used by third-party developers. 
Please be aware that Riot update Data Dragon after each League of Legends manually, so it is not always updated immediately after a patch.

#### `dd_versions`
All valid Data Dragon versions  can be can be retrieved with the below method.
Typically there's only a single build of Data Dragon for a given patch,
however occasionally there will be additional builds.
This typically occurs when there's an error in the original build.
As such, you should always use the most recent Data Dragon version for a given patch for the best results.

#### `dd_region_versions`

Data Dragon versions aren't always equivalent to the League of Legends client version in a region.
You can find the version each region is using via the realms files.

#### `dd_champions`

This returns a list of all champion with a brief summary, including stats, id and blurb.

#### `dd_specific_champion(champion_name:)`

For more detailed and specific information about a champion, this call can be used.

#### `dd_items`

Data Dragon also provides detail for every item in the game.
with this method you can find info such as the item's description, purchase value, sell value,
items it builds from, items it builds into, and stats granted from the item.

#### `dd_summoner_spells`

Details about summoner spells.

#### `dd_profile_icons`

Details about profile icons and where they can be found on the sprite sheets.

## Endpoints
The below commands require a Riot API key.
It needs to be saved as an ENV var and called `RIOT_API_KEY`
### SummonerV4
#### `by_account_id`
[Riot API Documentation](https://developer.riotgames.com/apis#summoner-v4/GET_getByAccountId)

Required fields:
- `encrypted_summoner_id` (The encrypted summoner ID for the summoner you want to know about.)
- `region` (The region that the summoner is in.)

Optional fields:
None

#### `by_summoner_name`
[Riot API Documentation](https://developer.riotgames.com/apis#summoner-v4/GET_getBySummonerName)

Required fields:
- `summoner_name` (The summoner name for the summoner you want to know about.)
- `region` (The region that the summoner is in.)

Optional fields:
None

#### `by_puuid`
[Riot API Documentation](https://developer.riotgames.com/apis#summoner-v4/GET_getByPUUID)

Required fields:
- `puuid` (The puuid for the summoner you want to know about.)
- `region` (The region that the summoner is in.)

Optional fields:
None

#### `by_summoner_id`
[Riot API Documentation](https://developer.riotgames.com/apis#summoner-v4/GET_getBySummonerId)

Required fields:
- `summoner_id` (The summoner id for the summoner you want to know about.)
- `region` (The region that the summoner is in.)

Optional fields:
None

### Champion Mastery V4

#### `summoner`
[Riot API Documentation](https://developer.riotgames.com/apis#champion-mastery-v4/GET_getAllChampionMasteries)

Required fields:
- `encrypted_summoner_id` (The encrypted summoner ID for the summoner you want to know about.)
- `region` (The region that the summoner is in.)

#### `summoner_on_champion`
[Riot API Documentation](https://developer.riotgames.com/apis#champion-mastery-v4/GET_getChampionMastery)

Required fields:
- `encrypted_summoner_id` (The encrypted summoner ID for the summoner you want to know about.)
- `champion_id` (The ID number of the champion that you want to know about.)
- `region` (The region that the summoner is in.)

#### `summoner_total_mastery`
[Riot API Documentation](https://developer.riotgames.com/apis#champion-mastery-v4/GET_getChampionMasteryScore)

Required fields:
- `encrypted_summoner_id` (the encrypted summoner ID for the summoner you want to know about.)
- `region` (The region that the summoner is in.)

### Champion V3
#### `champion_rotations`
[Riot API Documentation](https://developer.riotgames.com/apis#champion-v3/GET_getChampionInfo)

Required fields:
- None

Optional fields:
- `region` (By default it will assume `euw`, if you want to know for a specific region, you can pass that in.)

### Clash V3
#### `clash_by_summoner_id`
[Riot API Documentation](https://developer.riotgames.com/apis#clash-v1/GET_getPlayersBySummoner)

Required fields:
- `encrypted_summoner_id` (the encrypted summoner ID for the summoner you want to know about.)
- `region` (The region that the summoner is in.)

Optional fields:
- None

#### `clash_by_team_id`
[Riot API Documentation](https://developer.riotgames.com/apis#clash-v1/GET_getTeamById)

Required fields:
- `team_id` (the team ID for the team you want to know about.)
- `region` (The region that the team is in.)

Optional fields:
- None

#### `clash_tournaments`
[Riot API Documentation](https://developer.riotgames.com/apis#clash-v1/GET_getTournaments)

Required fields:
- `region` (The region that you want to know about.)

Optional fields:
- None

#### `clash_tournaments_by_team_id`
[Riot API Documentation](https://developer.riotgames.com/apis#clash-v1/GET_getTournaments)

Required fields:
- `team_id` (the team ID for the team you want to know about.)
- `region` (The region that the team is in.)

Optional fields:
- None

#### `clash_tournaments_by_tournament_id`
[Riot API Documentation](https://developer.riotgames.com/apis#clash-v1/GET_getTournaments)

Required fields:
- `tournament_id` (the tournament ID for the tournament you want to know about.)
- `region` (The region that the tournament is in.)

Optional fields:
- None

### SpectatorV4
#### `summoner_game_info`
[Riot API Documentation](https://developer.riotgames.com/apis#spectator-v4/GET_getCurrentGameInfoBySummoner)

Required fields:
- `encrypted_summoner_id` (The encrypted summoner ID for the summoner you want to know about.)
- `region` (The region that the summoner is in.)

Optional fields:
None

#### `featured_games`
[Riot API Documentation](https://developer.riotgames.com/apis#spectator-v4/GET_getFeaturedGames)

Required fields:
None

Optional fields:
- `region` (By default it will assume `euw`, if you want to know for a specific region, you can pass that in.)

### Status V3
#### `status_data`
[Riot API Documentation](https://developer.riotgames.com/apis#lol-status-v3/GET_getShardData)

Required fields:
- None

Optional fields:
- `region` (By default it will assume `euw`, if you want to know for a specific region, you can pass that in.)

### ThirdPartyCodeV4
#### `check_for_summoner`
[Riot API Documentation](https://developer.riotgames.com/apis#third-party-code-v4)

Required fields:
- `encrypted_summoner_id` (The encrypted summoner ID for the summoner you want to know about.)
- `region` (The region that the summoner is in.)

Optional fields:
None

## Development

After checking out the repo, run `bundle install` to install dependencies. 

To run the test suite, you can run `bundle exec rake spec`.

To run rubocop, you can run `bundle exec rake rubocop`.

To install this gem onto your local machine, run `bundle exec rake install`. 

To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
