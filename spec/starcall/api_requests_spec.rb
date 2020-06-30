# frozen_string_literal: true

require_relative '../../lib/starcall/api_requests'

RSpec.describe Starcall::ApiRequests do
  describe '.make_request' do
    subject(:requester) { described_class.make_request(url: url) }

    let(:url) { 'https://ddragon.leagueoflegends.com/api/versions.json' }
    let(:headers) { { headers: { 'X-Riot-Token' => ENV['RIOT_API_KEY'] } } }
    let(:response) { instance_double(HTTParty::Response, body: response_body) }
    let(:response_body) { 'response_body' }

    before do
      allow(HTTParty).to receive(:get).and_return(response)
      allow(response).to receive(:parsed_response).and_return(response_body)
      ENV['RIOT_API_KEY'] = 'fake_key'
      requester
    end

    it 'fetches the response from the Riot API' do
      expect(HTTParty).to have_received(:get).with(url, headers)
    end
  end
end
