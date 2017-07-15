require_relative '../crypto_compare.rb'

class CryptoCompare::CLI

	puts "Welcome to CryptoCompare!"

	def call
		@s = CryptoCompare::Scraper.new

		Money.default_bank = Money::Bank::GoogleCurrency.new

		set_crypto_currency_and_data
		set_variables
		set_infinite_precision	
		set_base_currency
		display_results
		another_or_exit  
	end

	def set_crypto_currency_and_data
		puts "Please enter your crypto currency of interest (e.g. bitcoin, ethereum, dogecoin, etc.)"
		puts "or enter the number (e.g. 1) or name (e.g. bitcoin) of a currency from the top 10 list below:"
		CryptoCompare::CryptoCurrency.make_crypto_from_list(@s.get_list(@s.page), @s)
		CryptoCompare::CryptoCurrency.all.each_with_index {|crypto, index| puts "#{index+1}. #{crypto.name}" if index <= 9} 
		@crypto_currency = gets.downcase.chomp
		@crypto_currency = @s.get_list(@s.page)[@crypto_currency.to_i-1] if @crypto_currency.to_i >= 1 
		@data = @s.get_attributes(@crypto_currency, @s.page)

		if @data["price"] == ""
			puts "No such crypto currency found."
			set_crypto_currency_and_data
		end
	end

	def set_variables
		@crypto_currency = CryptoCompare::CryptoCurrency.new(@data)
		@price = Money.new("#{@crypto_currency.price}".delete("$").to_f*100, "USD")
		@cap = Money.new("#{@crypto_currency.market_cap}".delete("$").to_f*100, "USD")
		@cap_value = @crypto_currency.market_cap.delete("$,").length >= 10 ? "billion" : "million"
		@volume = Money.new("#{@crypto_currency.volume}".delete("$").to_f*100, "USD")
		@change_direction = @crypto_currency.percent_change[0] == "-" ? "v" : "^"
	end

	def set_infinite_precision
		@crypto_currency.price.to_f < 1 ? Money.infinite_precision = true : Money.infinite_precision = false
	end

	def set_base_currency
		puts "Please enter your fiat currency of interest's ISO code (e.g. USD, CAD, GBP, JPY, etc.):"
		@base_currency = gets.upcase.chomp.to_sym

		if Money::Currency.include?(@base_currency) == false
			puts "No such fiat currency found."
			set_base_currency
		end
	end	

	def display_results
		puts "-"*20
		puts "Crypto Currency: #{@crypto_currency.name}"
		puts "Current Price: #{@price.exchange_to(@base_currency).symbol}#{@price.exchange_to(@base_currency)} #{@price.exchange_to(@base_currency).currency.iso_code}"
		puts "Market Cap:  #{@cap.exchange_to(@base_currency).symbol}#{@cap.exchange_to(@base_currency)} #{@cap_value} #{@cap.exchange_to(@base_currency).currency.iso_code}"
		puts "Circulating Supply: #{@crypto_currency.circulating_supply}"
		puts "Percent Change (24 hrs): #{@crypto_currency.percent_change} #{@change_direction}" 
		puts "-"*20	
	end

	def another_or_exit
		puts "Convert another? y/n"
		input = gets.downcase.chomp

		case input 
		when "y", "yes"
			call
		when "n", "no"
			puts "Thank you for using CryptoCompare!"
			puts "Goodbye."
			exit
		else
			puts "Incorrect input."
			another_or_exit
		end
	end

end