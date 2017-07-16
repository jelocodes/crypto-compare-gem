# CryptoCompare::CLI::Gem

[![Gem Version](https://badge.fury.io/rb/crypto_compare.svg)](https://badge.fury.io/rb/crypto_compare)

CryptoCompare is a gem that allows you to quickly display information on the top 10 Crypto Currencies (by market cap) in your fiat currency of choice. It uses Nokogiri and OpenURI to scrape data from http://coinmarketcap.com/, which is a complete, up-to-date list of cryptocurrency valuations in USD, ordered from highest to lowest market cap. It also uses the Ruby Money and Google Currency (which extends Ruby Money) gems to instantiate Money objects for currency conversion using data from https://www.google.com/finance/converterWelcome. 

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'crypto_compare'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install crypto_compare

## Usage

After gem installation, run the CLI by typing 'crypto-compare' in your terminal.

The CLI will greet the user, display the top 10 crypto currencies by market cap, and prompt the user for their crypto currency of interest. To choose, the user can either type the crypto currency of interest's name (e.g. bitcoin), or the number that appears with it in the top 10 list.

The user will then be prompted to enter their fiat currency of interest's [ISO Code](https://en.wikipedia.org/wiki/ISO_4217#Active_codes), the shorthand code for a country's national currency. The naming convention is the first two letters of the country (e.g. CA for Canada) followed by the first letter of it's currency (e.g. D for Dollars, put together: CAD).

The information on the user's crypto currency of choice is then displayed in denominations of their chosen fiat currency. The user can run the CLI again by choosing 'y' in the prompt above, or simply exit with 'n'.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/jelocodes/crypto-compare-gem. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the CryptoCompare project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/jelocodes/crypto-compare-gem/blob/master/CODE_OF_CONDUCT.md).
