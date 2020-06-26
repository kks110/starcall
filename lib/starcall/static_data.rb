# frozen_string_literal: true

require 'starcall/api_requests'
require 'starcall/regions'

module Starcall
  # This class is used for all things Static Data related.
  # Using Riots Static data and Data Dragon.
  class StaticData
    # Season ids are used in match history to indicate which season a match was played.
    # A full list of season ids can be retrieved with the below method.
    def self.season_ids
      ApiRequests.make_request(url: static_url(search_term: 'seasons'))
    end

    # Queue ids show up in several places throughout the API and are used to indicate which kind of match was played.
    # A full list of queue ids can be can be retrieved with the below method.
    def self.queue_ids
      ApiRequests.make_request(url: static_url(search_term: 'queues'))
    end

    # Map ids are used in match history to indicate which map a match was played.
    # A full list of map ids can be can be retrieved with the below method.
    def self.map_ids
      ApiRequests.make_request(url: static_url(search_term: 'maps'))
    end

    # A full list of game modes can be can be retrieved with the below method.
    def self.game_modes
      ApiRequests.make_request(url: static_url(search_term: 'gameModes'))
    end

    # A full list of game types can be can be retrieved with the below method.
    def self.game_types
      ApiRequests.make_request(url: static_url(search_term: 'gameTypes'))
    end

    # All valid Data Dragon versions  can be can be retrieved with the below method.
    # Typically there's only a single build of Data Dragon for a given patch,
    # however occasionally there will be additional builds.
    # This typically occurs when there's an error in the original build.
    # As such, you should always use the most recent Data Dragon version for a given patch for the best results.
    def self.dd_versions
      ApiRequests.make_request(url: dd_versions_url)
    end

    # Data Dragon versions aren't always equivalent to the League of Legends client version in a region.
    # You can find the version each region is using via the realms files.
    # If a region isn't passed, it will default to EUW
    def self.dd_region_versions(region: 'euw')
      Starcall::Regions.valid?(region: region)
      ApiRequests.make_request(url: dd_specific_version_url(region: region))
    end

    # This returns a list of all champion with a brief summary, including stats, id and blurb.
    # Each region can have slightly different versions, so for a specific version, pass in a region.
    # If a region isn't passed, it will default to EUW
    def self.dd_champions(region: 'euw')
      Starcall::Regions.valid?(region: region)
      ApiRequests.make_request(url: dd_url(region: region, game_component: 'champion'))
    end

    # For me detailed and specific information about a champion, this call can be used.
    # Each region can have slightly different versions, so for a specific version, pass in a region.
    # If a region isn't passed, it will default to EUW
    def self.dd_specific_champion(region: 'euw', champion_name:)
      Starcall::Regions.valid?(region: region)
      ApiRequests.make_request(url: dd_specific_champion_url(region: region, champion_name: champion_name))
    end

    # Data Dragon also provides detail for every item in the game.
    # with this method you can find info such as the item's description, purchase value, sell value,
    # items it builds from, items it builds into, and stats granted from the item.
    # Each region can have slightly different versions, so for a specific version, pass in a region.
    # If a region isn't passed, it will default to EUW
    def self.dd_items(region: 'euw')
      Starcall::Regions.valid?(region: region)
      ApiRequests.make_request(url: dd_url(region: region, game_component: 'item'))
    end

    # Details about summoner spells.
    # Each region can have slightly different versions, so for a specific version, pass in a region.
    # If a region isn't passed, it will default to EUW
    def self.dd_summoner_spells(region: 'euw')
      Starcall::Regions.valid?(region: region)
      ApiRequests.make_request(url: dd_url(region: region, game_component: 'summoner'))
    end

    # Details about profile icons and where they can be found on the sprite sheets.
    # Each region can have slightly different versions, so for a specific version, pass in a region.
    # If a region isn't passed, it will default to EUW
    def self.dd_profile_icons(region: 'euw')
      Starcall::Regions.valid?(region: region)
      ApiRequests.make_request(url: dd_url(region: region, game_component: 'profileicon'))
    end

    # This help build the static data url for thins such as map ids.
    def self.static_url(search_term:)
      "http://static.developer.riotgames.com/docs/lol/#{search_term}.json"
    end

    # This is the data dragon version URL
    def self.dd_versions_url
      'https://ddragon.leagueoflegends.com/api/versions.json'
    end

    # This is the specific EUW data dragon version URL.
    def self.dd_specific_version_url(region: 'euw')
      Starcall::Regions.valid?(region: region)
      "https://ddragon.leagueoflegends.com/realms/#{region}.json"
    end

    # This gets the current version of specific game components, such as champions.
    def self.dd_current_data_version(region: 'euw', game_component:)
      Starcall::Regions.valid?(region: region)
      ApiRequests.make_request(url: dd_specific_version_url(region: region))['n'][game_component]
    end

    # This builds the data dragon url for specific components such as champions,
    # using the above method to get the version.
    def self.dd_url(region: 'euw', game_component:)
      Starcall::Regions.valid?(region: region)
      'http://ddragon.leagueoflegends.com/cdn/'\
      "#{dd_current_data_version(region: region, game_component: game_component)}/data/en_GB/"\
      "#{game_component}.json"
    end

    # This builds the data dragon url for a specific champion.
    def self.dd_specific_champion_url(region: 'euw', champion_name:)
      Starcall::Regions.valid?(region: region)
      'http://ddragon.leagueoflegends.com/cdn/'\
      "#{dd_current_data_version(region: region, game_component: 'champion')}"\
      "/data/en_GB/champion/#{champion_name}.json"
    end

    private_class_method :static_url,
                         :dd_versions_url,
                         :dd_specific_version_url,
                         :dd_current_data_version,
                         :dd_url,
                         :dd_specific_champion_url
  end
end
