module CryptoCompare
end

require 'open-uri'
require 'nokogiri'
require 'money'
require 'money/bank/google_currency'

require_relative "crypto_compare/cli"
require_relative "crypto_compare/crypto_currency"
require_relative "crypto_compare/scraper"

Money.use_i18n = false
Money.infinite_precision = true