class PokemonsController < ApplicationController
  def index
    # Exibe todos os Pokémon armazenados localmente
    @pokemons = Pokemon.all
  end

  def show
    # Exibe detalhes de um Pokémon específico
    @pokemon = Pokemon.find(params[:id])
  end

  def search
    # Faz requisição para a API caso o Pokémon não esteja no banco de dados
    service = PokemonService.new
    response = service.fetch_pokemon(params[:name].downcase)

    if response.success?
      # Parseia e salva os dados no banco
      data = response.parsed_response
      @pokemon = Pokemon.create(
        name: data['name'],
        pokemon_type: data['types'][0]['type']['name'],
        height: data['height'],
        weight: data['weight'],
        abilities: data['abilities'].map { |a| a['ability']['name'] }.join(", "),
        image_url: data['sprites']['front_default']
      )
    else
      flash[:alert] = "Pokémon não encontrado!"
    end
  end

  def destroy
    @pokemon = Pokemon.find(params[:id])
    @pokemon.destroy
    redirect_to root_path
  end

end
