# frozen_string_literal: true

require 'starcall/api_requests'

module Starcall
  # This class is used for all things Static Data related.
  # Using Riots Static data and Data Dragon.
  class StaticData
    # Initialize the class with a region, if none is supplied, EUW will be assumed.
    def initialize(region: 'euw', language: 'en_GB')
      Starcall::Regions.valid?(region: region)
      Starcall::Languages.valid?(language: language)

      @region = region
      @language = language
    end

    # Season ids are used in match history to indicate which season a match was played.
    # A full list of season ids can be retrieved with the below method.
    def season_ids
      Starcall::ApiRequests.make_request(url: static_url(search_term: 'seasons'))
    end

    # Queue ids show up in several places throughout the API and are used to indicate which kind of match was played.
    # A full list of queue ids can be can be retrieved with the below method.
    def queue_ids
      Starcall::ApiRequests.make_request(url: static_url(search_term: 'queues'))
    end

    # Map ids are used in match history to indicate which map a match was played.
    # A full list of map ids can be can be retrieved with the below method.
    def map_ids
      Starcall::ApiRequests.make_request(url: static_url(search_term: 'maps'))
    end

    # A full list of game modes can be can be retrieved with the below method.
    def game_modes
      Starcall::ApiRequests.make_request(url: static_url(search_term: 'gameModes'))
    end

    # A full list of game types can be can be retrieved with the below method.
    def game_types
      Starcall::ApiRequests.make_request(url: static_url(search_term: 'gameTypes'))
    end

    # All valid Data Dragon versions  can be can be retrieved with the below method.
    # Typically there's only a single build of Data Dragon for a given patch,
    # however occasionally there will be additional builds.
    # This typically occurs when there's an error in the original build.
    # As such, you should always use the most recent Data Dragon version for a given patch for the best results.
    def dd_versions
      Starcall::ApiRequests.make_request(url: dd_versions_url)
    end

    # Data Dragon versions aren't always equivalent to the League of Legends client version in a region.
    def dd_region_versions
      Starcall::ApiRequests.make_request(url: dd_region_version_url)
    end

    # This returns a list of all champion with a brief summary, including stats, id and blurb.
    def dd_champions
      Starcall::ApiRequests.make_request(url: dd_url(game_component: 'champion'))
    end

    # For me detailed and specific information about a champion, this call can be used.
    def dd_specific_champion(champion_name:)
      Starcall::ApiRequests.make_request(url: dd_specific_champion_url(champion_name: champion_name))
    end

    # Data Dragon also provides detail for every item in the game.
    # with this method you can find info such as the item's description, purchase value, sell value,
    # items it builds from, items it builds into, and stats granted from the item.
    def dd_items
      Starcall::ApiRequests.make_request(url: dd_url(game_component: 'item'))
    end

    # Details about summoner spells.
    def dd_summoner_spells
      Starcall::ApiRequests.make_request(url: dd_url(game_component: 'summoner'))
    end

    # Details about profile icons and where they can be found on the sprite sheets.
    def dd_profile_icons
      Starcall::ApiRequests.make_request(url: dd_url(game_component: 'profileicon'))
    end

    private

    attr_reader :region, :language

    # This help build the static data url for thins such as map ids.
    def static_url(search_term:)
      "http://static.developer.riotgames.com/docs/lol/#{search_term}.json"
    end

    # This is the data dragon version URL
    def dd_versions_url
      'https://ddragon.leagueoflegends.com/api/versions.json'
    end

    # This is the specific EUW data dragon version URL.
    def dd_region_version_url
      "https://ddragon.leagueoflegends.com/realms/#{region}.json"
    end

    # This gets the current version of specific game components, such as champions.
    def dd_current_data_version(game_component:)
      Starcall::ApiRequests.make_request(url: dd_region_version_url)['n'][game_component]
    end

    # This builds the data dragon url for specific components such as champions,
    # using the above method to get the version.
    def dd_url(game_component:)
      'http://ddragon.leagueoflegends.com/cdn/'\
      "#{dd_current_data_version(game_component: game_component)}/data/#{language}/"\
      "#{game_component}.json"
    end

    # This builds the data dragon url for a specific champion.
    def dd_specific_champion_url(champion_name:)
      'http://ddragon.leagueoflegends.com/cdn/'\
      "#{dd_current_data_version(game_component: 'champion')}"\
      "/data/#{language}/champion/#{champion_name}.json"
    end
  end
end
