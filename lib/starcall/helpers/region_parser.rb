# frozen_string_literal: true

require 'starcall/regions'

module Starcall
  module Helpers
    # The API URLs don't use the actual region name, they used different ones.
    # This converts from a region name to the URL string.
    class RegionParser
      def self.parse(region:)
        Starcall::Regions.valid?(region: region)

        region_matchup = {
          br: 'br1',
          eune: 'eun1',
          euw: 'euw1',
          lan: 'la1',
          las: 'la2',
          na: 'na1',
          oce: 'oc1',
          ru: 'ru',
          tr: 'tr1',
          jp: 'jp1',
          kr: 'kr'
        }
        region_matchup[region.to_sym]
      end
    end
  end
end
