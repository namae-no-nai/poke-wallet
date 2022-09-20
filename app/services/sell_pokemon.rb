# frozen_string_literal: true

class SellPokemon
  def self.call(purchase)
    new(purchase).sell_pokemon
  end

  def initialize(purchase)
    @success = false
    @errors = []
    @purchase = purchase
  end

  def sell_pokemon
    add_log
    @purchase.destroy
    response
  end

  private

  def add_log
    WalletLog.create(
      pokemon_name: @purchase.pokemon_name,
      pokemon_id: @purchase.pokemon_id,
      investor_id: @purchase.investor_id,
      usd_value: UpdatePokemonPrices.price_build(@purchase.base_experience * -1)
    )
  end

  def response
    {
      success: @success,
      errors: @errors,
      pokemon: @pokemon
    }
  end
end
