class AddImageUrlToPokemons < ActiveRecord::Migration[7.2]
  def change
    add_column :pokemons, :image_url, :string
  end
end
