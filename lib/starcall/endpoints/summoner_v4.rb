# frozen_string_literal: true

require 'starcall/helpers/region_parser'
require 'starcall/api_requests'

module Starcall
  module Endpoints
    # Methods used to get information about summoners.
    class SummonerV4
      # Get a summoner by account ID.
      def self.by_account_id(encrypted_account_id:, region:)
        Starcall::Regions.valid?(region: region)
        Starcall::ApiRequests.make_request(
          url: "https://#{parse_region(region: region)}.api.riotgames.com"\
               "/lol/summoner/v4/summoners/by-account/#{encrypted_account_id}"
        )
      end

      # Get a summoner by summoner name.
      def self.by_summoner_name(summoner_name:, region:)
        Starcall::Regions.valid?(region: region)
        Starcall::ApiRequests.make_request(
          url: "https://#{parse_region(region: region)}.api.riotgames.com"\
               "/lol/summoner/v4/summoners/by-name/#{summoner_name}"
        )
      end

      # Get a summoner by PUUID.
      def self.by_puuid(puuid:, region:)
        Starcall::Regions.valid?(region: region)
        Starcall::ApiRequests.make_request(
          url: "https://#{parse_region(region: region)}.api.riotgames.com"\
               "/lol/summoner/v4/summoners/by-puuid/#{puuid}"
        )
      end

      # Get a summoner by summoner ID.
      def self.by_summoner_id(summoner_id:, region:)
        Starcall::Regions.valid?(region: region)
        Starcall::ApiRequests.make_request(
          url: "https://#{parse_region(region: region)}.api.riotgames.com"\
               "/lol/summoner/v4/summoners/#{summoner_id}"
        )
      end

      def self.parse_region(region:)
        Starcall::Helpers::RegionParser.parse(region: region)
      end

      private_class_method :parse_region
    end
  end
end
