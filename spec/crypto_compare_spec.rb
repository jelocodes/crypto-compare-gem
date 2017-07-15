require "spec_helper"

RSpec.describe CryptoCompare do
  it "has a version number" do
    expect(CryptoCompare::VERSION).not_to be nil
  end
end

RSpec.describe CryptoCompare::CryptoCurrency do
	sample_page = Nokogiri::HTML(open("spec/fixtures/page.html"))
	file_list = File.read("spec/fixtures/list.rb").split(", ")
	scraper = CryptoCompare::Scraper.new
	list = CryptoCompare::CryptoCurrency.make_crypto_from_list(file_list,scraper)
	crypto_list = CryptoCompare::CryptoCurrency.all
	data = scraper.get_attributes("bitcoin", sample_page)
	new_crypto = CryptoCompare::CryptoCurrency.new(data)

	describe '#initialize' do
		it 'initializes a new instance of a Crypto Currency object' do
			expect(new_crypto).to be_a(CryptoCompare::CryptoCurrency)
		end
	end

	describe '.make_crypto_from_list' do
		it 'instantiates CryptoCurrency objects from list' do
			expect(list[0]).to be_a(CryptoCompare::CryptoCurrency)
		end
	end

	describe '.all' do
		it 'returns an array of CryptoCurrency instances' do
			expect(crypto_list).to be_an(Array)
			expect(crypto_list.first).to be_a(CryptoCompare::CryptoCurrency)
		end
	end

end

RSpec.describe CryptoCompare::Scraper do 

	sample_page = Nokogiri::HTML(open("spec/fixtures/page.html"))
	list = CryptoCompare::Scraper.new.get_list(sample_page)
	attributes = CryptoCompare::Scraper.new.get_attributes("bitcoin", sample_page)

	describe '#get_list' do
		it 'creates an array of the names of the top 10 crypto currencies by market cap' do
			expect(list).to be_an(Array)
			expect(list.first).to eq("bitcoin")
		end
	end

	describe '#get_attributes' do
		it 'creates and returns a hash of cryptocurrency attributes' do
			expect(attributes).to be_a(Hash)
			expect(attributes["name"]).to eq("bitcoin")
			expect(attributes["price"]).to eq("$2326.19")
		end
	end 

end
