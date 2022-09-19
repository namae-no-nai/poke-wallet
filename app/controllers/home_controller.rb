# frozen_string_literal: true
require 'httparty'

class HomeController < ApplicationController
  include HTTParty
  before_action :authenticate_investor!
  before_action :set_purchase, only: %i[destroy]

  def index
    purchases = Purchase.where(investor_id: current_investor)
    @purchases = price_update(purchases)
  end

  def create
    pokemon = catch_pokemon(params[:pokemon])
    @purchase = Purchase.new(pokemon)
    @purchase.investor = current_investor
  
    if @purchase.save
      WalletLog.create(
        pokemon_name: @purchase.pokemon_name,
        pokemon_id: @purchase.pokemon_id,
        investor_id: current_investor.id,
        usd_value: @purchase.usd_value
      )
      redirect_to home_index_path, flash: { notice: 'Pokemon was bought successfully' }
    else
      redirect_to home_index_path, flash: { error: "Pokemon couldn't be bought" }
    end
  end

  def logs
    @logs = WalletLog.where(investor_id: current_investor.id).order(created_at: 'DESC')
  end

  def destroy
    WalletLog.create!(
      pokemon_name: @purchase.pokemon_name,
      pokemon_id: @purchase.pokemon_id,
      investor_id: @purchase.investor_id,
      usd_value: exchange_rate(@purchase.base_experience)*-1
    )
    @purchase.destroy
    redirect_to home_index_path, flash: { notice: 'Pokemon was sold successfully' }
  end

  private

  def purchase_params
    params.require(:purchase).permit(:pokemon)
  end

  def request_api(pokemon)
    HTTParty.get("https://pokeapi.co/api/v2/pokemon/#{pokemon}/").parsed_response
  end

  def fetch_price
    HTTParty.get("https://blockchain.info/ticker").parsed_response
  end

  def catch_pokemon(pokemon)
    parsed_pokemon = request_api(pokemon)
    build_pokemon(parsed_pokemon)
  end

  def build_pokemon(pokemon_data)
    {
      :pokemon_name => pokemon_data['name'],
      :pokemon_id => pokemon_data['id'],
      :base_experience => pokemon_data['base_experience'],
      :usd_value => exchange_rate(pokemon_data['base_experience'])
    }
  end

  def price_update(purchases)
    purchases.each do |purchase|
      purchase.usd_value = exchange_rate(purchase.base_experience) 
    end
  end

  def exchange_rate(purchase)
    purchase * satoshi_to_usd
  end

  def satoshi_to_usd
    fetch_price["USD"]["last"]*0.00000001
  end

  def set_purchase
    @purchase = Purchase.find(params[:id])
  end
end
