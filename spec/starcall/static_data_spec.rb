# frozen_string_literal: true

require_relative '../../lib/starcall/static_data'

RSpec.describe Starcall::StaticData do
  before do
    allow(ApiRequests).to receive(:make_request).and_return(response)
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
    subject(:season_ids) { described_class.season_ids }
    let(:url) do
      { url: 'http://static.developer.riotgames.com/docs/lol/seasons.json' }
    end

    it 'calls the api' do
      season_ids
      expect(ApiRequests).to have_received(:make_request).with(url)
    end
  end

  describe '.queue_ids' do
    subject(:queue_ids) { described_class.queue_ids }
    let(:url) do
      { url: 'http://static.developer.riotgames.com/docs/lol/queues.json' }
    end

    it 'calls the api' do
      queue_ids
      expect(ApiRequests).to have_received(:make_request).with(url)
    end
  end

  describe '.map_ids' do
    subject(:map_ids) { described_class.map_ids }
    let(:url) do
      { url: 'http://static.developer.riotgames.com/docs/lol/maps.json' }
    end

    it 'calls the api' do
      map_ids
      expect(ApiRequests).to have_received(:make_request).with(url)
    end
  end

  describe '.game_modes' do
    subject(:game_modes) { described_class.game_modes }
    let(:url) do
      { url: 'http://static.developer.riotgames.com/docs/lol/gameModes.json' }
    end

    it 'calls the api' do
      game_modes
      expect(ApiRequests).to have_received(:make_request).with(url)
    end
  end

  describe '.game_types' do
    subject(:game_types) { described_class.game_types }
    let(:url) do
      { url: 'http://static.developer.riotgames.com/docs/lol/gameTypes.json' }
    end

    it 'calls the api' do
      game_types
      expect(ApiRequests).to have_received(:make_request).with(url)
    end
  end

  describe '.dd_versions' do
    subject(:dd_versions) { described_class.dd_versions }
    let(:url) do
      { url: 'https://ddragon.leagueoflegends.com/api/versions.json' }
    end

    it 'calls the api' do
      dd_versions
      expect(ApiRequests).to have_received(:make_request).with(url)
    end
  end

  context 'region is valid' do
    before do
      allow(Starcall::Regions).to receive(:valid?).and_return(true)
    end

    describe '.dd_region_versions' do
      subject(:dd_region_versions) { described_class.dd_region_versions }
      let(:url) do
        { url: 'https://ddragon.leagueoflegends.com/realms/euw.json' }
      end

      it 'calls the api' do
        dd_region_versions
        expect(ApiRequests).to have_received(:make_request).with(url)
      end
    end

    describe '.dd_champions' do
      subject(:dd_champions) { described_class.dd_champions }
      let(:url) do
        { url: "http://ddragon.leagueoflegends.com/cdn/#{response['n']['champion']}/data/en_GB/champion.json" }
      end

      it 'calls the api' do
        dd_champions
        expect(ApiRequests).to have_received(:make_request).with(url)
      end
    end

    describe '.dd_items' do
      subject(:dd_items) { described_class.dd_items }
      let(:url) do
        { url: "http://ddragon.leagueoflegends.com/cdn/#{response['n']['item']}/data/en_GB/item.json" }
      end

      it 'calls the api' do
        dd_items
        expect(ApiRequests).to have_received(:make_request).with(url)
      end
    end

    describe '.dd_summoner_spells' do
      subject(:dd_summoner_spells) { described_class.dd_summoner_spells }
      let(:url) do
        { url: "http://ddragon.leagueoflegends.com/cdn/#{response['n']['summoner']}/data/en_GB/summoner.json" }
      end

      it 'calls the api' do
        dd_summoner_spells
        expect(ApiRequests).to have_received(:make_request).with(url)
      end
    end

    describe '.dd_profile_icons' do
      subject(:dd_profile_icons) { described_class.dd_profile_icons }
      let(:url) do
        { url: "http://ddragon.leagueoflegends.com/cdn/#{response['n']['profileicon']}/data/en_GB/profileicon.json" }
      end

      it 'calls the api' do
        dd_profile_icons
        expect(ApiRequests).to have_received(:make_request).with(url)
      end
    end

    describe '.dd_specific_champion' do
      subject(:dd_specific_champion) { described_class.dd_specific_champion(champion_name: champion_name) }
      let(:champion_name) { 'Aatrox' }
      let(:url) do
        { url: "http://ddragon.leagueoflegends.com/cdn/#{response['n']['profileicon']}"\
             "/data/en_GB/champion/#{champion_name}.json" }
      end

      it 'calls the api' do
        dd_specific_champion
        expect(ApiRequests).to have_received(:make_request).with(url)
      end
    end
  end

  context 'region is invalid' do
    before do
      allow(Starcall::Regions).to receive(:valid?).and_raise(Starcall::Regions::InvalidRegion)
    end

    describe '.dd_region_versions' do
      subject(:dd_region_versions) { described_class.dd_region_versions }

      it 'calls the api' do
        expect { dd_region_versions }.to raise_error(StandardError)
      end
    end

    describe '.dd_champions' do
      subject(:dd_champions) { described_class.dd_champions }

      it 'calls the api' do
        expect { dd_champions }.to raise_error(StandardError)
      end
    end

    describe '.dd_items' do
      subject(:dd_items) { described_class.dd_items }

      it 'calls the api' do
        expect { dd_items }.to raise_error(StandardError)
      end
    end

    describe '.dd_summoner_spells' do
      subject(:dd_summoner_spells) { described_class.dd_summoner_spells }

      it 'calls the api' do
        expect { dd_summoner_spells }.to raise_error(StandardError)
      end
    end

    describe '.dd_profile_icons' do
      subject(:dd_profile_icons) { described_class.dd_profile_icons }

      it 'calls the api' do
        expect { dd_profile_icons }.to raise_error(StandardError)
      end
    end

    describe '.dd_specific_champion' do
      subject(:dd_specific_champion) { described_class.dd_specific_champion(champion_name: champion_name) }
      let(:champion_name) { 'Aatrox' }

      it 'calls the api' do
        expect { dd_specific_champion }.to raise_error(StandardError)
      end
    end
  end
end
