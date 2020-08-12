# frozen_string_literal: true

require_relative '../../../lib/starcall/endpoints/spectator_v4'

RSpec.describe Starcall::Endpoints::SpectatorV4 do
  before do
    allow(Starcall::ApiRequests).to receive(:make_request).and_return(response)
    allow(Starcall::Regions).to receive(:valid?).and_return(true)
    allow(Starcall::Helpers::RegionParser).to receive(:parse).and_return('euw1')
  end

  let(:response) { 'response' }

  subject(:summoner_game_info) { described_class.summoner_game_info(encrypted_summoner_id: summoner, region: region) }

  let(:region) { 'euw' }
  let(:summoner) { 'summoner_id' }
  let(:url) do
    { url: "https://euw1.api.riotgames.com/lol/spectator/v4/active-games/by-summoner/#{summoner}" }
  end

  it 'called the correct end point' do
    allow(Starcall::Helpers::RegionParser).to receive(:parse).and_return('euw1')
    summoner_game_info
    expect(Starcall::ApiRequests).to have_received(:make_request).with(url)
  end

  describe '.featured_games' do
    subject(:featured_games) { described_class.featured_games }

    let(:url) do
      { url: 'https://euw1.api.riotgames.com/lol/spectator/v4/featured-games' }
    end

    it 'calls the api' do
      featured_games
      expect(Starcall::ApiRequests).to have_received(:make_request).with(url)
    end
  end

  context 'region passed in' do
    subject(:featured_games) { described_class.featured_games(region: 'eune') }

    let(:url) do
      { url: 'https://eun1.api.riotgames.com/lol/spectator/v4/featured-games' }
    end

    it 'called the correct end point' do
      allow(Starcall::Helpers::RegionParser).to receive(:parse).and_return('eun1')
      featured_games
      expect(Starcall::ApiRequests).to have_received(:make_request).with(url)
    end
  end
end
