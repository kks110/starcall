# frozen_string_literal: true

require 'starcall/error'

module Starcall
  # This class is used to list and validate regions.
  class Regions
    # A list of valid Riot Regions.
    def self.list
      [
        'br',   # Brazil
        'eune', # EU North East
        'euw',  # EU West
        'lan',  # Latin America North
        'las',  # Latin America South
        'na',   # North America
        'oce',  # Oceania
        'ru',   # Russia
        'tr',   # Turkey
        'jp',   # Japan
        'kr'    # Korea
      ]
    end

    # A method to check is the region is valid, if not, raise an error.
    def self.valid?(region:)
      return true if list.include? region

      raise Starcall::Error::InvalidRegion.new(region: region)
    end
  end
end
