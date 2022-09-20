# frozen_string_literal: true

class UpdatePokemonPrices
  def self.call(purchase)
    new(purchase).price_update
  end

  def initialize(purchase)
    @success = false
    @errors = []
    @purchase = purchase
  end

  def self.price_update(purchases)
    purchases.each do |purchase|
      purchase.usd_value = price_build(purchase.base_experience)
    end
  end

  def self.price_build(base_experience)
    btc_rate = ::Utils::BlockchainApi.fetch_price
    satoshi = satoshi_to_usd(btc_rate)
    satoshi * base_experience
  end

  def self.satoshi_to_usd(btc_rate)
    btc_rate['USD']['last'] * 0.00000001
  end
end
