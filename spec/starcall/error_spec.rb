# frozen_string_literal: true

require_relative '../../lib/starcall/error'

RSpec.describe Starcall::Error::InvalidRegion do
  describe '.message' do
    subject(:invalid_region_error) { described_class.new(region: region) }

    let(:region) { 'abc' }
    let(:msg) do
      'abc is not a valid region. Please consult Starcall::Regions.list for a list of valid regions.'
    end

    it 'raises and error on an invalid region' do
      expect { raise invalid_region_error }.to raise_error(Starcall::Error::InvalidRegion)
      expect { raise invalid_region_error }.to raise_error.with_message(msg)
    end
  end
end
