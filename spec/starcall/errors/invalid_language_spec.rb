# frozen_string_literal: true

require_relative '../../../lib/starcall/errors/invalid_language'

RSpec.describe Starcall::Errors::InvalidLanguage do
  describe '#message' do
    subject(:invalid_language_error) { described_class.new(language: language) }

    let(:language) { 'ab_CD' }
    let(:msg) do
      'ab_CD is not a valid language. Please consult Starcall::Languages.list for a list of valid languages.'
    end

    it 'raises and error on an invalid language' do
      expect { raise invalid_language_error }.to raise_error(Starcall::Errors::InvalidLanguage)
      expect { raise invalid_language_error }.to raise_error.with_message(msg)
    end
  end
end
