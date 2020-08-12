# frozen_string_literal: true

require 'starcall/helpers/region_parser'
require 'starcall/api_requests'

module Starcall
  module Endpoints
    # Methods to check 3rd party codes
    class ThirdPartyCodeV4
      # Get third party code for a given summoner ID
      def self.check_for_summoner(encrypted_summoner_id:, region:)
        Starcall::Regions.valid?(region: region)
        Starcall::ApiRequests.make_request(
          url: "https://#{parse_region(region: region)}.api.riotgames.com"\
               "/lol/platform/v4/third-party-code/by-summoner/#{encrypted_summoner_id}"
        )
      end

      def self.parse_region(region:)
        Starcall::Helpers::RegionParser.parse(region: region)
      end

      private_class_method :parse_region
    end
  end
end
