module Starcall
  module Errors
    # A Custom error message, used when an incorrect region is passed.
    class InvalidRegion < StandardError
      def initialize(region:)
        super
        @region = region
      end

      def message
        "#{region} is not a valid region. Please consult Starcall::Regions.list for a list of valid regions."
      end

      private

      attr_reader :region
    end
  end
end
