require_relative '../crypto_compare.rb'

class CryptoCompare::Scraper
	attr_accessor :page

	def initialize
		@page = Nokogiri::HTML(open("http://coinmarketcap.com/"))
	end

	def get_list(source)
		source.css("td.currency-name a" ).enum_for(:each_with_index).collect {|crypto, index| crypto.text.downcase.gsub(" ","-") if index <= 9 }.compact
	end

	def get_attributes(crypto_currency, source)
		data = {}
		data["name"] = crypto_currency 
		data["price"] = source.css("tr#id-#{crypto_currency} td.no-wrap a.price").text
		data["market_cap"] = source.css("tr#id-#{crypto_currency} td.market-cap").text.gsub(/\s+/, "")
		data["circulating_supply"] = source.css("tr#id-#{crypto_currency} td.no-wrap a[target='_blank']").text.gsub(/\s+/, " ")
		data["percent_change"] = source.css("tr#id-#{crypto_currency} td.percent-24h").text
		data
	end 

end
