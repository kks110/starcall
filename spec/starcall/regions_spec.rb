# frozen_string_literal: true

require_relative '../../lib/starcall/regions'

RSpec.describe Starcall::Regions do
  describe '.list' do
    subject(:available_regions) { described_class.list }

    let(:regions) do
      %w[
        br
        eune
        euw
        lan
        las
        na
        oce
        ru
        tr
        jp
        kr
      ]
    end

    it 'returns the list of regions' do
      expect(available_regions).to eq(regions)
    end
  end

  describe '.valid?' do
    subject(:valid_region_check) { described_class.valid?(region: region_to_test) }

    context 'valid region' do
      let(:region_to_test) { 'euw' }

      it 'returns true on a valid region' do
        expect(valid_region_check).to be_truthy
      end
    end

    context 'invalid region' do
      before do
        allow(Starcall::Errors::InvalidRegion).to receive(:new).and_raise(StandardError)
      end

      let(:region_to_test) { 'abc' }

      it 'raises and error on an invalid region' do
        expect { valid_region_check }.to raise_error(StandardError)
      end
    end
  end
end
