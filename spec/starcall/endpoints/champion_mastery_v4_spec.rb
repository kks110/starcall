# frozen_string_literal: true

require_relative '../../../lib/starcall/endpoints/champion_mastery_v4'

RSpec.describe Starcall::Endpoints::ChampionMasteryV4 do
  before do
    allow(Starcall::ApiRequests).to receive(:make_request).and_return(response)
    allow(Starcall::Regions).to receive(:valid?).and_return(true)
    allow(Starcall::Helpers::RegionParser).to receive(:parse).and_return('euw1')
  end

  let(:response) { 'response' }

  describe '.summoner' do
    subject(:summoner) { described_class.summoner(encrypted_summoner_id: summoner_id, region: region) }

    let(:summoner_id) { 'summoner_id' }
    let(:region) { 'euw' }

    let(:url) do
      { url: "https://euw1.api.riotgames.com/lol/champion-mastery/v4/champion-masteries/by-summoner/#{summoner_id}" }
    end

    it 'calls the api' do
      summoner
      expect(Starcall::ApiRequests).to have_received(:make_request).with(url)
    end
  end

  describe '.summoner_on_champion' do
    subject(:summoner_on_champion) do
      described_class.summoner_on_champion(encrypted_summoner_id: summoner_id,
                                           region: region,
                                           champion_id: champion_id)
    end

    let(:summoner_id) { 'summoner_id' }
    let(:region) { 'euw' }
    let(:champion_id) { '99' }

    let(:url) do
      { url: "https://euw1.api.riotgames.com/lol/champion-mastery/v4/champion-masteries/by-summoner/#{summoner_id}"\
             "/by-champion/#{champion_id}" }
    end

    it 'calls the api' do
      summoner_on_champion
      expect(Starcall::ApiRequests).to have_received(:make_request).with(url)
    end
  end

  describe '.summoner_total_mastery' do
    subject(:summoner_total_mastery) do
      described_class.summoner_total_mastery(encrypted_summoner_id: summoner_id, region: region)
    end

    let(:summoner_id) { 'summoner_id' }
    let(:region) { 'euw' }

    let(:url) do
      { url: "https://euw1.api.riotgames.com/lol/champion-mastery/v4/scores/by-summoner/#{summoner_id}" }
    end

    it 'calls the api' do
      summoner_total_mastery
      expect(Starcall::ApiRequests).to have_received(:make_request).with(url)
    end
  end
end
