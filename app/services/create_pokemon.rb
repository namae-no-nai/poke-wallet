class CreatePokemon
    def self.call(pokemon, current_investor)
      self.new(pokemon, current_investor).create_pokemon
    end
  
    def initialize(pokemon, current_investor)
      @success = false
      @errors = []
      @pokemon = {
        :pokemon_name => pokemon['name'],
        :pokemon_id => pokemon['id'],
        :base_experience => pokemon['base_experience'],
        :usd_value => UpdatePokemonPrices.price_build(pokemon['base_experience'])
      }
      @current_investor = current_investor
    end

    def create_pokemon
      @purchase = Purchase.new(@pokemon)
      @purchase.investor = @current_investor
  
      if @purchase.save
        add_log
        @success = true
      else
        @errors = @purchase.errors.full_messages
      end
      response
    end

    private

    def add_log
      WalletLog.create(pokemon_name: @purchase.pokemon_name, pokemon_id: @purchase.pokemon_id, investor_id: @current_investor.id, usd_value: @purchase.usd_value)
    end

    def response
      {
        success: @success,
        errors: @errors,
        pokemon: @pokemon,
        current_investor: @current_investor
      }
    end  
end