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
    service = PokemonService.new
    response = service.fetch_pokemon(params[:name].downcase)
  
    if response.success?
      data = response.parsed_response
    
      # Coletar o primeiro ataque
      move_name = data['moves'][0]['move']['name'] if data['moves'].any?
      attack_response = service.fetch_move_details(move_name) if move_name
    
      if attack_response[:success]
        attack_data = attack_response[:parsed_response]
    
        @pokemon = Pokemon.create(
          name: data['name'],
          hp: data['stats'].find { |stat| stat['stat']['name'] == 'hp' }['base_stat'],
          pokemon_type: data['types'][0]['type']['name'],
          height: data['height'],
          weight: data['weight'],
          abilities: data['abilities'].map { |a| a['ability']['name'] }.join(", "),
          image_url: data['sprites']['front_default'],
          name_attack: attack_data['name'],
          base_damage: attack_data['power'], 
          attack_type: attack_data['type']['name'], 
          effect: attack_data['effect_entries'][0]['effect'],
          
        )
      else
        flash[:alert] = "Detalhes do ataque não encontrados!"
      end
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
