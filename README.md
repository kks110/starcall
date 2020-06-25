![starcall](starcall.png)

----
[![Build Status](https://travis-ci.com/kks110/starcall.svg?branch=master)](https://travis-ci.com/kks110/starcall)

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

### Static Queries

You can then call the any of the below methods like:
```ruby
Starcall::StaticData.season_ids
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
Please be aware that Riot update Data Dragon after each League of Legends manualy, so it is not always updated immediately after a patch.

#### `dd_versions`
All valid Data Dragon versions  can be can be retrieved with the below method.
Typically there's only a single build of Data Dragon for a given patch,
however occasionally there will be additional builds.
This typically occurs when there's an error in the original build.
As such, you should always use the most recent Data Dragon version for a given patch for the best results.

#### `dd_euw_versions`
Data Dragon versions aren't always equivalent to the League of Legends client version in a region.
You can find the version each region is using via the realms files.
This function returns the EWU versions

#### `dd_champions`
This returns a list of all champion with a brief summary, including stats, id and blurb.

#### `dd_specific_champion(champion_name:)`
For me detailed and specific information about a champion, this call can be used.

#### `dd_items`
Data Dragon also provides detail for every item in the game.
with this method you can find info such as the item's description, purchase value, sell value,
items it builds from, items it builds into, and stats granted from the item.

#### `dd_summoner_spells`
Details about summoner spells.

#### `dd_profile_icons`
Details about profile icons and where they can be found on the sprite sheets.


## Development

After checking out the repo, run `bundle install` to install dependencies. 

To run the test suite, you can run `bundle exec rake spec`.

To run rubocop, you can run `bundle exec rake rubocop`.

To install this gem onto your local machine, run `bundle exec rake install`. 

To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
