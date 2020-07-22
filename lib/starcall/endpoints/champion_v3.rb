# frozen_string_literal: true

require 'starcall/helpers/region_parser'
require 'starcall/api_requests'

module Starcall
  module Endpoints
    # Methods used to call the Champion endpoints.
    class ChampionV3
      # Returns champion rotations, including free-to-play and low-level free-to-play rotations
      def self.champion_rotations(region: 'euw')
        Starcall::Regions.valid?(region: region)
        Starcall::ApiRequests.make_request(
          url: "https://#{parse_region(region: region)}.api.riotgames.com"\
               "/lol/platform/v3/champion-rotations"
        )
      end

      def self.parse_region(region:)
        Starcall::Helpers::RegionParser.parse(region: region)
      end

      private_class_method :parse_region
    end
  end
end
