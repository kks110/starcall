# frozen_string_literal: true

require_relative '../../lib/starcall/static_data'
require_relative '../../lib/starcall/error'

RSpec.describe Starcall::StaticData do
  before do
    allow(Starcall::ApiRequests).to receive(:make_request).and_return(response)
  end

  let(:response) do
    {
      'n' => {
        'champion' => 10,
        'item' => 10,
        'summoner' => 10,
        'profileicon' => 10
      }
    }
  end

  describe '.season_ids' do
    subject(:season_ids) { described_class.new.season_ids }
    let(:url) do
      { url: 'http://static.developer.riotgames.com/docs/lol/seasons.json' }
    end

    it 'calls the api' do
      season_ids
      expect(Starcall::ApiRequests).to have_received(:make_request).with(url)
    end
  end

  describe '.queue_ids' do
    subject(:queue_ids) { described_class.new.queue_ids }
    let(:url) do
      { url: 'http://static.developer.riotgames.com/docs/lol/queues.json' }
    end

    it 'calls the api' do
      queue_ids
      expect(Starcall::ApiRequests).to have_received(:make_request).with(url)
    end
  end

  describe '.map_ids' do
    subject(:map_ids) { described_class.new.map_ids }
    let(:url) do
      { url: 'http://static.developer.riotgames.com/docs/lol/maps.json' }
    end

    it 'calls the api' do
      map_ids
      expect(Starcall::ApiRequests).to have_received(:make_request).with(url)
    end
  end

  describe '.game_modes' do
    subject(:game_modes) { described_class.new.game_modes }
    let(:url) do
      { url: 'http://static.developer.riotgames.com/docs/lol/gameModes.json' }
    end

    it 'calls the api' do
      game_modes
      expect(Starcall::ApiRequests).to have_received(:make_request).with(url)
    end
  end

  describe '.game_types' do
    subject(:game_types) { described_class.new.game_types }
    let(:url) do
      { url: 'http://static.developer.riotgames.com/docs/lol/gameTypes.json' }
    end

    it 'calls the api' do
      game_types
      expect(Starcall::ApiRequests).to have_received(:make_request).with(url)
    end
  end

  describe '.dd_versions' do
    subject(:dd_versions) { described_class.new.dd_versions }
    let(:url) do
      { url: 'https://ddragon.leagueoflegends.com/api/versions.json' }
    end

    it 'calls the api' do
      dd_versions
      expect(Starcall::ApiRequests).to have_received(:make_request).with(url)
    end
  end

  context 'region is invalid' do
    before do
      allow(Starcall::Regions).to receive(:valid?).and_raise(Starcall::Error::InvalidRegion.new(region: region))
    end

    describe '#initialize' do
      let(:region) { 'not_a_region' }
      it 'raises an error in initialisation' do
        expect { described_class.new(region: region) }.to raise_error(Starcall::Error::InvalidRegion)
      end
    end
  end

  context 'region is invalid' do
    before do
      allow(Starcall::Languages).to receive(:valid?).and_raise(Starcall::Error::InvalidLanguage.new(language: language))
    end

    describe '#initialize' do
      let(:language) { 'not_a_language' }
      it 'raises an error in initialisation' do
        expect { described_class.new(language: language) }.to raise_error(Starcall::Error::InvalidLanguage)
      end
    end
  end
end
