module Starcall
  module Errors
    # A Custom error message, used when an incorrect language is passed.
    class InvalidLanguage < StandardError
      def initialize(language:)
        super
        @language = language
      end

      def message
        "#{language} is not a valid language. Please consult Starcall::Languages.list for a list of valid languages."
      end

      private

      attr_reader :language
    end
  end
end
