# frozen_string_literal: true

require 'starcall/helpers/region_parser'
require 'starcall/api_requests'

module Starcall
  module Endpoints
    # Method to check the status of services in a region
    class StatusV3
      # Get League of Legends status for the given shard
      def self.status_data(region: 'euw')
        Starcall::Regions.valid?(region: region)
        Starcall::ApiRequests.make_request(
          url: "https://#{parse_region(region: region)}.api.riotgames.com"\
               '/lol/status/v3/shard-data'
        )
      end

      def self.parse_region(region:)
        Starcall::Helpers::RegionParser.parse(region: region)
      end

      private_class_method :parse_region
    end
  end
end
