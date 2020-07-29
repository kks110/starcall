# frozen_string_literal: true

require_relative '../../../lib/starcall/endpoints/clash_v1'

RSpec.describe Starcall::Endpoints::ClashV1 do
  before do
    allow(Starcall::ApiRequests).to receive(:make_request).and_return(response)
    allow(Starcall::Regions).to receive(:valid?).and_return(true)
    allow(Starcall::Helpers::RegionParser).to receive(:parse).and_return('euw1')
  end

  let(:response) { 'response' }

  describe '.clash_by_summoner_id' do
    subject(:clash_by_summoner_id) do
      described_class.clash_by_summoner_id(encrypted_summoner_id: summoner_id, region: region)
    end

    let(:summoner_id) { 'summoner_id' }
    let(:region) { 'euw' }

    let(:url) do
      { url: "https://euw1.api.riotgames.com/lol/clash/v1/players/by-summoner/#{summoner_id}" }
    end

    it 'calls the api' do
      clash_by_summoner_id
      expect(Starcall::ApiRequests).to have_received(:make_request).with(url)
    end
  end

  describe '.clash_by_team_id' do
    subject(:clash_by_team_id) do
      described_class.clash_by_team_id(team_id: team_id, region: region)
    end

    let(:team_id) { 'team_id' }
    let(:region) { 'euw' }

    let(:url) do
      { url: "https://euw1.api.riotgames.com/lol/clash/v1/teams/#{team_id}" }
    end

    it 'calls the api' do
      clash_by_team_id
      expect(Starcall::ApiRequests).to have_received(:make_request).with(url)
    end
  end

  describe '.clash_tournaments' do
    subject(:clash_tournaments) do
      described_class.clash_tournaments(region: region)
    end

    let(:region) { 'euw' }

    let(:url) do
      { url: 'https://euw1.api.riotgames.com/lol/clash/v1/tournaments' }
    end

    it 'calls the api' do
      clash_tournaments
      expect(Starcall::ApiRequests).to have_received(:make_request).with(url)
    end
  end

  describe '.clash_tournaments_by_team_id' do
    subject(:clash_tournaments_by_team_id) do
      described_class.clash_tournaments_by_team_id(team_id: team_id, region: region)
    end

    let(:team_id) { 'team_id' }
    let(:region) { 'euw' }

    let(:url) do
      { url: "https://euw1.api.riotgames.com/lol/clash/v1/tournaments/by-team/#{team_id}" }
    end

    it 'calls the api' do
      clash_tournaments_by_team_id
      expect(Starcall::ApiRequests).to have_received(:make_request).with(url)
    end
  end

  describe '.clash_tournaments_by_tournament_id' do
    subject(:clash_tournaments_by_tournament_id) do
      described_class.clash_tournaments_by_tournament_id(tournament_id: tournament_id, region: region)
    end

    let(:tournament_id) { 'tournament_id' }
    let(:region) { 'euw' }

    let(:url) do
      { url: "https://euw1.api.riotgames.com/lol/clash/v1/tournaments/#{tournament_id}" }
    end

    it 'calls the api' do
      clash_tournaments_by_tournament_id
      expect(Starcall::ApiRequests).to have_received(:make_request).with(url)
    end
  end
end
