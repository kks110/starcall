# frozen_string_literal: true

require_relative '../../lib/starcall/languages'

RSpec.describe Starcall::Languages do
  describe '.list' do
    subject(:available_languages) { described_class.list }

    let(:languages) do
      %w[
        cs_CZ
        el_GR
        pl_PL
        ro_RO
        hu_HU
        en_GB
        de_DE
        es_ES
        it_IT
        fr_FR
        ja_JP
        ko_KR
        es_MX
        es_AR
        pt_BR
        en_US
        en_AU
        ru_RU
        tr_TR
        ms_MY
        en_PH
        en_SG
        th_TH
        vn_VN
        id_ID
        zh_MY
        zh_CN
        zh_TW
      ]
    end

    it 'returns the list of languages' do
      expect(available_languages).to eq(languages)
    end
  end

  describe '.valid?' do
    subject(:valid_language_check) { described_class.valid?(language: language_to_test) }

    context 'valid language' do
      let(:language_to_test) { 'en_GB' }

      it 'returns true on a valid region' do
        expect(valid_language_check).to be_truthy
      end
    end

    context 'invalid region' do
      before do
        allow(Starcall::Errors::InvalidLanguage).to receive(:new).and_raise(StandardError)
      end

      let(:region_to_test) { 'ab_CD' }

      it 'raises and error on an invalid language' do
        expect { valid_language_check }.to raise_error(StandardError)
      end
    end
  end
end
