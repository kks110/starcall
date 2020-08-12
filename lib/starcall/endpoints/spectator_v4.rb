# frozen_string_literal: true

require 'starcall/helpers/region_parser'
require 'starcall/api_requests'

module Starcall
  module Endpoints
    # Methods for getting spectator information
    class SpectatorV4
      # Get current game information for the given summoner ID
      def self.summoner_game_info(encrypted_summoner_id:, region:)
        Starcall::Regions.valid?(region: region)
        Starcall::ApiRequests.make_request(
          url: "https://#{parse_region(region: region)}.api.riotgames.com"\
               "/lol/spectator/v4/active-games/by-summoner/#{encrypted_summoner_id}"
        )
      end

      # Get list of featured games
      def self.featured_games(region: 'euw')
        Starcall::Regions.valid?(region: region)
        Starcall::ApiRequests.make_request(
          url: "https://#{parse_region(region: region)}.api.riotgames.com"\
               '/lol/spectator/v4/featured-games'
        )
      end

      def self.parse_region(region:)
        Starcall::Helpers::RegionParser.parse(region: region)
      end

      private_class_method :parse_region
    end
  end
end
