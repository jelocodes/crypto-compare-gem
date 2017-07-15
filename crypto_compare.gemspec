# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "crypto_compare/version"
require "crypto_compare/cli"
require "crypto_compare/crypto_currency"
require "crypto_compare/scraper"

Gem::Specification.new do |spec|
  spec.name          = "crypto_compare"
  spec.version       = CryptoCompare::VERSION
  spec.authors       = ["Michaelangelo Yambao"]
  spec.email         = ["michaelangelo.yambao@gmail.com"]

  spec.summary       = "A Ruby CLI application to quickly get crypto currency information in various fiat currencies."
  spec.description   = "Get information on your crypto currency of interest (such as its market cap, price, and daily volume) in denominations of your chosen fiat currency, all within the command line."
  spec.homepage      = "https://github.com/jelocodes/crypto-compare-gem"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.executables   = ["crypto-compare"]
  spec.require_paths = ["lib", "lib/crypto_compare"]

  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "pry"
  spec.add_dependency "nokogiri"
  spec.add_dependency "money"
  spec.add_dependency "google_currency"

end
