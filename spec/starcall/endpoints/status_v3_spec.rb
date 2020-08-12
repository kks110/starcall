# frozen_string_literal: true

require_relative '../../../lib/starcall/endpoints/status_v3'

RSpec.describe Starcall::Endpoints::StatusV3 do
  before do
    allow(Starcall::ApiRequests).to receive(:make_request).and_return(response)
    allow(Starcall::Regions).to receive(:valid?).and_return(true)
    allow(Starcall::Helpers::RegionParser).to receive(:parse).and_return('euw1')
  end

  let(:response) { 'response' }

  describe '.status_data' do
    subject(:status_data) { described_class.status_data }

    let(:url) do
      { url: 'https://euw1.api.riotgames.com/lol/status/v3/shard-data' }
    end

    it 'calls the api' do
      status_data
      expect(Starcall::ApiRequests).to have_received(:make_request).with(url)
    end
  end

  context 'region passed in' do
    subject(:status_data) { described_class.status_data(region: 'eune') }

    let(:url) do
      { url: 'https://eun1.api.riotgames.com/lol/status/v3/shard-data' }
    end

    it 'called the correct end point' do
      allow(Starcall::Helpers::RegionParser).to receive(:parse).and_return('eun1')
      status_data
      expect(Starcall::ApiRequests).to have_received(:make_request).with(url)
    end
  end
end
