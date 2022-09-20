require 'httparty'

class HomeController < ApplicationController
  before_action :authenticate_investor!
  before_action :set_purchase, only: %i[destroy]
  before_action :set_purchases, only: %i[index]

  def index
    UpdatePokemonPrices.price_update(@purchases)
  end

  def create
    pokemon = Utils::PokeApi.fetch_pokemon(params[:pokemon])
    return redirect_to '/', alert: 'Purchase failed!' if pokemon == 'Not Found'
    
    outcome = CreatePokemon.call(pokemon, current_investor)
    if outcome[:success]
      redirect_to '/', notice: 'Pokemon bought successfully!'
    else
      redirect_to '/', alert: 'Purchase failed!'
    end
  end

  def logs
    @logs = WalletLog.where(investor_id: current_investor.id).order(created_at: 'DESC')
  end

  # class DestroyPokemon
  def destroy
    outcome = SellPokemon.call(@purchase)
    if outcome[:success]
      redirect_to '/', notice: 'Pokemon sold successfylly!'
    else
      redirect_to '/', alert: 'Pokemon was not sold!'
    end
  end

  private

  def set_purchases
    @purchases = Purchase.where(investor_id: current_investor)
  end

  def set_purchase
    @purchase = Purchase.find(params[:id])
  end
end