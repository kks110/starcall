# frozen_string_literal: true

require 'httparty'

# A small class to make a HTTP get request using the passed in URL
class ApiRequests
  def self.make_request(url:)
    HTTParty.get(url).parsed_response
  end
end
