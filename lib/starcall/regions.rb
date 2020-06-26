module Starcall
  class Regions
    class InvalidRegion < StandardError
      attr_reader :region

      def initialize(region:)
        super
        @region = region
      end

      def message
        "#{region} is not a valid region. Please consult Starcall::Regions.list for a list of valid regions."
      end
    end

    def self.list
      %w[
      br
      eune
      euw
      lan
      las
      na
      oce
      ru
      tr
      jp
      kr
    ]
    end

    def self.valid?(region:)
      return true if list.include? region
      raise InvalidRegion.new(region: region)
    end
  end
end
