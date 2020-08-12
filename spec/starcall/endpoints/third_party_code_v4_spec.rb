# frozen_string_literal: true

require_relative '../../../lib/starcall/endpoints/third_party_code_v4'

RSpec.describe Starcall::Endpoints::ThirdPartyCodeV4 do
  before do
    allow(Starcall::ApiRequests).to receive(:make_request).and_return(response)
    allow(Starcall::Regions).to receive(:valid?).and_return(true)
    allow(Starcall::Helpers::RegionParser).to receive(:parse).and_return('euw1')
  end

  let(:response) { 'response' }

  context 'region passed in' do
    subject(:check_for_summoner) { described_class.check_for_summoner(encrypted_summoner_id: summoner, region: region) }

    let(:region) { 'euw' }
    let(:summoner) { 'summoner_id' }
    let(:url) do
      { url: "https://euw1.api.riotgames.com/lol/platform/v4/third-party-code/by-summoner/#{summoner}" }
    end

    it 'called the correct end point' do
      allow(Starcall::Helpers::RegionParser).to receive(:parse).and_return('euw1')
      check_for_summoner
      expect(Starcall::ApiRequests).to have_received(:make_request).with(url)
    end
  end
end
