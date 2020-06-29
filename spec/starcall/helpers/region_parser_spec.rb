# frozen_string_literal: true

require_relative '../../../lib/starcall/helpers/region_parser'

RSpec.describe Starcall::Helpers::RegionParser do
  describe '.parse' do
    subject(:parser) { described_class.parse(region: region) }

    context 'br is passed in' do
      let(:region) { 'br' }

      it 'returns br1' do
        expect(parser).to eq('br1')
      end
    end

    context 'eune is passed in' do
      let(:region) { 'eune' }

      it 'returns eun1' do
        expect(parser).to eq('eun1')
      end
    end

    context 'euw is passed in' do
      let(:region) { 'euw' }

      it 'returns euw1' do
        expect(parser).to eq('euw1')
      end
    end

    context 'lan is passed in' do
      let(:region) { 'lan' }

      it 'returns la1' do
        expect(parser).to eq('la1')
      end
    end

    context 'las is passed in' do
      let(:region) { 'las' }

      it 'returns la2' do
        expect(parser).to eq('la2')
      end
    end

    context 'na is passed in' do
      let(:region) { 'na' }

      it 'returns na1' do
        expect(parser).to eq('na1')
      end
    end

    context 'oce is passed in' do
      let(:region) { 'oce' }

      it 'returns oc1' do
        expect(parser).to eq('oc1')
      end
    end

    context 'ru is passed in' do
      let(:region) { 'ru' }

      it 'returns ru' do
        expect(parser).to eq('ru')
      end
    end

    context 'tr is passed in' do
      let(:region) { 'tr' }

      it 'returns tr1' do
        expect(parser).to eq('tr1')
      end
    end

    context 'jp is passed in' do
      let(:region) { 'jp' }

      it 'returns jp1' do
        expect(parser).to eq('jp1')
      end
    end

    context 'kr is passed in' do
      let(:region) { 'kr' }

      it 'returns kr' do
        expect(parser).to eq('kr')
      end
    end
  end
end
