require 'httparty'


class PokemonService
  include HTTParty
  
  base_uri 'https://pokeapi.co/api/v2'

  def fetch_pokemon(name)
    self.class.get("/pokemon/#{name}")
  end

  def fetch_move_details(move_name)
    response = RestClient.get("https://pokeapi.co/api/v2/move/#{move_name}")
    {
      success: true,
      parsed_response: JSON.parse(response.body)
    }
  rescue RestClient::ExceptionWithResponse => e
    {
      success: false,
      message: e.response
    }
  end
  
end
