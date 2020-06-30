# frozen_string_literal: true

require 'httparty'

module Starcall
  # A small class to make a HTTP get request using the passed in URL
  # Intened to only be used my internal Gem classes and not be called directly.
  class ApiRequests
    def self.make_request(url:)
      HTTParty.get(url, { headers: { 'X-Riot-Token' => ENV['RIOT_API_KEY'] } }).parsed_response
    end
  end
end
