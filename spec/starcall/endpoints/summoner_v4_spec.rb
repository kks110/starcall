# frozen_string_literal: true

require_relative '../../../lib/starcall/endpoints/summoner_v4'

RSpec.describe Starcall::Endpoints::SummonerV4 do
  before do
    allow(Starcall::ApiRequests).to receive(:make_request).and_return(response)
    allow(Starcall::Regions).to receive(:valid?).and_return(true)
    allow(Starcall::Helpers::RegionParser).to receive(:parse).and_return('euw1')
  end

  let(:response) { 'response' }

  describe '.by_account_id' do
    subject(:by_account_id) { described_class.by_account_id(encrypted_account_id: encrypted_account_id, region: region) }

    let(:encrypted_account_id) { 'encrypted_account_id' }
    let(:region) { 'euw' }

    let(:url) do
      { url: "https://euw1.api.riotgames.com/lol/summoner/v4/summoners/by-account/#{encrypted_account_id}" }
    end

    it 'calls the api' do
      by_account_id
      expect(Starcall::ApiRequests).to have_received(:make_request).with(url)
    end
  end

  describe '.by_summoner_name' do
    subject(:by_summoner_name) { described_class.by_summoner_name(summoner_name: summoner_name, region: region) }

    let(:summoner_name) { 'kks110' }
    let(:region) { 'euw' }

    let(:url) do
      { url: "https://euw1.api.riotgames.com/lol/summoner/v4/summoners/by-name/#{summoner_name}" }
    end

    it 'calls the api' do
      by_summoner_name
      expect(Starcall::ApiRequests).to have_received(:make_request).with(url)
    end
  end

  describe '.by_puuid' do
    subject(:by_puuid) { described_class.by_puuid(puuid: puuid, region: region) }

    let(:puuid) { 'puuid' }
    let(:region) { 'euw' }

    let(:url) do
      { url: "https://euw1.api.riotgames.com/lol/summoner/v4/summoners/by-puuid/#{puuid}" }
    end

    it 'calls the api' do
      by_puuid
      expect(Starcall::ApiRequests).to have_received(:make_request).with(url)
    end
  end

  describe '.by_summoner_id' do
    subject(:by_summoner_id) { described_class.by_summoner_id(summoner_id: summoner_id, region: region) }

    let(:summoner_id) { 'summoner_id' }
    let(:region) { 'euw' }

    let(:url) do
      { url: "https://euw1.api.riotgames.com/lol/summoner/v4/summoners/#{summoner_id}" }
    end

    it 'calls the api' do
      by_summoner_id
      expect(Starcall::ApiRequests).to have_received(:make_request).with(url)
    end
  end
end
