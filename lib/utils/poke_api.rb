module Utils
  class PokeApi
    BASE_URL = 'https://pokeapi.co/api/v2'

    def self.fetch_pokemon(pokemon)
      HTTParty.get("#{BASE_URL}/pokemon/#{pokemon}/").parsed_response
    end
  end
end