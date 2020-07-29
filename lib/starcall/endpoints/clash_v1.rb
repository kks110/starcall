# frozen_string_literal: true

require 'starcall/helpers/region_parser'
require 'starcall/api_requests'

module Starcall
  module Endpoints
    # Methods used to get information about clash
    class ClashV1
      # Get players by summoner ID.
      def self.clash_by_summoner_id(encrypted_summoner_id:, region:)
        Starcall::Regions.valid?(region: region)
        Starcall::ApiRequests.make_request(
          url: "https://#{parse_region(region: region)}.api.riotgames.com"\
               "/lol/clash/v1/players/by-summoner/#{encrypted_summoner_id}"
        )
      end

      # Get team by ID.
      def self.clash_by_team_id(team_id:, region:)
        Starcall::Regions.valid?(region: region)
        Starcall::ApiRequests.make_request(
          url: "https://#{parse_region(region: region)}.api.riotgames.com"\
               "/lol/clash/v1/teams/#{team_id}"
        )
      end

      # Get all active or upcoming tournaments.
      def self.clash_tournaments(region:)
        Starcall::Regions.valid?(region: region)
        Starcall::ApiRequests.make_request(
          url: "https://#{parse_region(region: region)}.api.riotgames.com/lol/clash/v1/tournaments"
        )
      end

      # Get tournament by team ID.
      def self.clash_tournaments_by_team_id(team_id:, region:)
        Starcall::Regions.valid?(region: region)
        Starcall::ApiRequests.make_request(
          url: "https://#{parse_region(region: region)}.api.riotgames.com"\
               "/lol/clash/v1/tournaments/by-team/#{team_id}"
        )
      end

      # Get tournament by ID
      def self.clash_tournaments_by_tournament_id(tournament_id:, region:)
        Starcall::Regions.valid?(region: region)
        Starcall::ApiRequests.make_request(
          url: "https://#{parse_region(region: region)}.api.riotgames.com"\
               "/lol/clash/v1/tournaments/#{tournament_id}"
        )
      end

      def self.parse_region(region:)
        Starcall::Helpers::RegionParser.parse(region: region)
      end

      private_class_method :parse_region
    end
  end
end
