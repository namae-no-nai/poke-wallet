# frozen_string_literal: true
require 'httparty'

class HomeController < ApplicationController
  include HTTParty
  before_action :authenticate_investor!

  def index
    @purchases = Purchase.where(investor_id: current_investor)
  end

  def create
    @pokemon = catch_pokemon(params[:pokemon])
    @purchase = Purchase.new(@pokemon)
    @purchase.investor = current_investor
  
    if @purchase.save
      redirect_to home_index_path, flash: { notice: 'Pokemon bought successfully' }
    else
      redirect_to home_index_path, flash: { error: "Pokemon couldn't be bought" }
    end
  end

  private

  def purchase_params
    params.require(:purchase).permit(:pokemon)
  end

  def request_api(pokemon)
    HTTParty.get("https://pokeapi.co/api/v2/pokemon/#{pokemon}/").parsed_response
  end

  def catch_pokemon(pokemon)
    parsed_pokemon = request_api(pokemon)
    build_pokemon(parsed_pokemon)
  end

  def build_pokemon(pokemon_data)
    {
      :pokemon_name => pokemon_data['name'],
      :pokemon_id => pokemon_data['id'],
      :base_experience => pokemon_data['base_experience']
    }
  end
end
