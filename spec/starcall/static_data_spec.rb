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
        'profileicon' => 10,
    }
    }
  end

  def shared_test(subject:, url:)
    subject
    expect(ApiRequests).to have_received(:make_request).with(url)
  end

  describe '#season_ids' do
    subject(:season_ids) { described_class.new.season_ids }
    let(:url) { {:url=>"http://static.developer.riotgames.com/docs/lol/seasons.json"} }

    it 'calls the api' do
      shared_test(subject: season_ids, url: url)
    end
  end

  describe '#queue_ids' do
    subject(:queue_ids) { described_class.new.queue_ids }
    let(:url) { {:url=>"http://static.developer.riotgames.com/docs/lol/queues.json"} }

    it 'calls the api' do
      shared_test(subject: queue_ids, url: url)
    end
  end

  describe '#map_ids' do
    subject(:map_ids) { described_class.new.map_ids }
    let(:url) { {:url=>"http://static.developer.riotgames.com/docs/lol/maps.json"} }

    it 'calls the api' do
      shared_test(subject: map_ids, url: url)
    end
  end

  describe '#game_modes' do
    subject(:game_modes) { described_class.new.game_modes }
    let(:url) { {:url=>"http://static.developer.riotgames.com/docs/lol/gameModes.json"} }

    it 'calls the api' do
      shared_test(subject: game_modes, url: url)
    end
  end

  describe '#game_types' do
    subject(:game_types) { described_class.new.game_types }
    let(:url) { {:url=>"http://static.developer.riotgames.com/docs/lol/gameTypes.json"} }

    it 'calls the api' do
      shared_test(subject: game_types, url: url)
    end
  end

  describe '#dd_versions' do
    subject(:dd_versions) { described_class.new.dd_versions }
    let(:url) { {:url=>"https://ddragon.leagueoflegends.com/api/versions.json"} }

    it 'calls the api' do
      shared_test(subject: dd_versions, url: url)
    end
  end

  describe '#dd_euw_versions' do
    subject(:dd_euw_versions) { described_class.new.dd_euw_versions }
    let(:url) { {:url=>"https://ddragon.leagueoflegends.com/realms/euw.json"} }

    it 'calls the api' do
      shared_test(subject: dd_euw_versions, url: url)
    end
  end

  describe '#dd_champions' do
    subject(:dd_champions) { described_class.new.dd_champions }
    let(:url) { {:url=>"http://ddragon.leagueoflegends.com/cdn/#{response['n']['champion']}/data/en_GB/champion.json"} }

    it 'calls the api' do
      shared_test(subject: dd_champions, url: url)
    end
  end

  describe '#dd_items' do
    subject(:dd_items) { described_class.new.dd_items }
    let(:url) { {:url=>"http://ddragon.leagueoflegends.com/cdn/#{response['n']['item']}/data/en_GB/item.json"} }

    it 'calls the api' do
      shared_test(subject: dd_items, url: url)
    end
  end

  describe '#dd_summoner_spells' do
    subject(:dd_summoner_spells) { described_class.new.dd_summoner_spells }
    let(:url) { {:url=>"http://ddragon.leagueoflegends.com/cdn/#{response['n']['summoner']}/data/en_GB/summoner.json"} }

    it 'calls the api' do
      shared_test(subject: dd_summoner_spells, url: url)
    end
  end

  describe '#dd_profile_icons' do
    subject(:dd_profile_icons) { described_class.new.dd_profile_icons }
    let(:url) { {:url=>"http://ddragon.leagueoflegends.com/cdn/#{response['n']['profileicon']}/data/en_GB/profileicon.json"} }

    it 'calls the api' do
      shared_test(subject: dd_profile_icons, url: url)
    end
  end

  describe '#dd_specific_champion' do
    subject(:dd_specific_champion) { described_class.new.dd_specific_champion(champion_name: champion_name) }
    let(:champion_name) { 'Aatrox' }
    let(:url) { {:url=>"http://ddragon.leagueoflegends.com/cdn/#{response['n']['profileicon']}/data/en_GB/champion/#{champion_name}.json"} }

    it 'calls the api' do
      shared_test(subject: dd_specific_champion, url: url)
    end
  end
end
