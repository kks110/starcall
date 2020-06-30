# frozen_string_literal: true

require 'starcall/helpers/region_parser'
require 'starcall/api_requests'

module Starcall
  module Endpoints
    # Methods used to call the Champion Mastery endpoints.
    class ChampionMasteryV4
      # Get all champion mastery entries sorted by number of champion points descending.
      def self.summoner(encrypted_summoner_id:, region:)
        Starcall::Regions.valid?(region: region)
        parsed_region = Starcall::Helpers::RegionParser.parse(region: region)
        Starcall::ApiRequests.make_request(
          url: "https://#{parsed_region}.api.riotgames.com"\
               "/lol/champion-mastery/v4/champion-masteries/by-summoner/#{encrypted_summoner_id}"
        )
      end

      # Get a champion mastery by player ID and champion ID.
      def self.summoner_on_champion(encrypted_summoner_id:, champion_id:, region:)
        Starcall::Regions.valid?(region: region)
        parsed_region = Starcall::Helpers::RegionParser.parse(region: region)
        Starcall::ApiRequests.make_request(
          url: "https://#{parsed_region}.api.riotgames.com"\
               "/lol/champion-mastery/v4/champion-masteries/by-summoner/#{encrypted_summoner_id}"\
               "/by-champion/#{champion_id}"
        )
      end

      # Get a player's total champion mastery score, which is the sum of individual champion mastery levels.
      def self.summoner_total_mastery(encrypted_summoner_id:, region:)
        Starcall::Regions.valid?(region: region)
        parsed_region = Starcall::Helpers::RegionParser.parse(region: region)
        Starcall::ApiRequests.make_request(
          url: "https://#{parsed_region}.api.riotgames.com"\
               "/lol/champion-mastery/v4/scores/by-summoner/#{encrypted_summoner_id}"
        )
      end
    end
  end
end
