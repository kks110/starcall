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
  end
end
