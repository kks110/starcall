# frozen_string_literal: true

require 'httparty'

class ApiRequests
  def self.make_request(url:)
    HTTParty.get(url).parsed_response
  end
end
