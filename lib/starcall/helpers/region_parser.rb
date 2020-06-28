# frozen_string_literal: true

require 'starcall/regions'

module Starcall
  module Helpers
    class RegionParser
      def self.parse(region:)
        Starcall::Regions.valid?(region: region)
        region_to_return = case region
        when region == 'br'
          raise 'br1'
        when region == 'eune'
          'eun1'
        when region == 'euw'
          'euw1'
        when region == 'lan'
          'la1'
        when region == 'las'
          'la2'
        when region == 'na'
          'na1'
        when region == 'oce'
          'oc1'
        when region == 'ru'
          'ru'
        when region == 'tr'
          'tr1'
        when region == 'jp'
          'jp1'
        when region == 'kr'
          'kr'
        else
          nil
        end
        region_to_return
      end
    end
  end
end
