# frozen_string_literal: true

require 'starcall/error'

module Starcall
  # This class is used to list and validate languages.
  class Languages
    # A list of valid Riot Languages.
    # rubocop:disable Metrics/MethodLength
    def self.list
      [
        'cs_CZ',	# Czech (Czech Republic)
        'el_GR',	# Greek (Greece)
        'pl_PL',	# Polish (Poland)
        'ro_RO',	# Romanian (Romania)
        'hu_HU',	# Hungarian (Hungary)
        'en_GB',	# English (United Kingdom)
        'de_DE',	# German (Germany)
        'es_ES',	# Spanish (Spain)
        'it_IT',	# Italian (Italy)
        'fr_FR',	# French (France)
        'ja_JP',	# Japanese (Japan)
        'ko_KR',	# Korean (Korea)
        'es_MX',	# Spanish (Mexico)
        'es_AR',	# Spanish (Argentina)
        'pt_BR',	# Portuguese (Brazil)
        'en_US',	# English (United States)
        'en_AU',	# English (Australia)
        'ru_RU',	# Russian (Russia)
        'tr_TR',	# Turkish (Turkey)
        'ms_MY',	# Malay (Malaysia)
        'en_PH',	# English (Republic of the Philippines)
        'en_SG',	# English (Singapore)
        'th_TH',	# Thai (Thailand)
        'vn_VN',	# Vietnamese (Viet Nam)
        'id_ID',	# Indonesian (Indonesia)
        'zh_MY',	# Chinese (Malaysia)
        'zh_CN',	# Chinese (China)
        'zh_TW'	# Chinese (Taiwan)
      ]
    end
    # rubocop:enable Metrics/MethodLength

    # A method to check is the language is valid, if not, raise an error.
    def self.valid?(language:)
      return true if list.include? language

      raise Starcall::Error::InvalidLanguage.new(language: language)
    end
  end
end
