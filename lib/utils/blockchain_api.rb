module Utils
  class BlockchainApi
    BASE_URL = 'https://blockchain.info/'

    def self.fetch_price
      HTTParty.get("#{BASE_URL}/ticker").parsed_response
    end
  end
end