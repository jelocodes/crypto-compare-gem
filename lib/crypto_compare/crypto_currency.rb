require_relative '../crypto_compare.rb'

class CryptoCompare::CryptoCurrency
	attr_accessor :name, :price, :market_cap, :circulating_supply, :volume, :percent_change
	@@all = []

	def initialize(data)
		data.each{|key,value| self.send("#{key}=",value)} 
		@@all << self if !@@all.detect {|crypto| crypto.name == self.name}
	end	

	def self.all
		@@all
	end

	def self.make_crypto_from_list(list, scraper)
		list.each {|crypto| CryptoCompare::CryptoCurrency.new(scraper.get_attributes(crypto, scraper.page))}
		self.all
	end

end