# frozen_string_literal: true

require 'starcall/regions'

module Starcall
  module Helpers
    class RegionParser
      def self.parse(region:)
        Starcall::Regions.valid?(region: region)
        case region
        when 'br'
          'br1'
        when 'eune'
          'eun1'
        when 'euw'
          'euw1'
        when 'lan'
          'la1'
        when 'las'
          'la2'
        when 'na'
          'na1'
        when 'oce'
          'oc1'
        when 'ru'
          'ru'
        when 'tr'
          'tr1'
        when 'jp'
          'jp1'
        when 'kr'
          'kr'
        end
      end
    end
  end
end
