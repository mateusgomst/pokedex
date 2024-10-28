require 'httparty'

class PokemonService
  include HTTParty
  base_uri 'https://pokeapi.co/api/v2'

  def fetch_pokemon(name)
    self.class.get("/pokemon/#{name}")
  end
end
