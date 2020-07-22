# frozen_string_literal: true

require_relative '../../../lib/starcall/endpoints/champion_v3'

RSpec.describe Starcall::Endpoints::ChampionV3 do
  before do
    allow(Starcall::ApiRequests).to receive(:make_request).and_return(response)
    allow(Starcall::Regions).to receive(:valid?).and_return(true)
    allow(Starcall::Helpers::RegionParser).to receive(:parse).and_return('euw1')
  end

  let(:response) { 'response' }

  describe '.champion_rotations' do
    subject(:champion_rotations) { described_class.champion_rotations }

    let(:url) do
      { url: 'https://euw1.api.riotgames.com/lol/platform/v3/champion-rotations' }
    end

    it 'calls the api' do
      champion_rotations
      expect(Starcall::ApiRequests).to have_received(:make_request).with(url)
    end
  end

  context 'region passed in' do
    subject(:champion_rotations) { described_class.champion_rotations(region: 'eune') }

    let(:url) do
      { url: 'https://eun1.api.riotgames.com/lol/platform/v3/champion-rotations' }
    end

    it 'called the correct end point' do
      allow(Starcall::Helpers::RegionParser).to receive(:parse).and_return('eun1')
      champion_rotations
      expect(Starcall::ApiRequests).to have_received(:make_request).with(url)
    end
  end
end
