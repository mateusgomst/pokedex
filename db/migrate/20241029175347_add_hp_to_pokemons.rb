class AddHpToPokemons < ActiveRecord::Migration[7.2]
  def change
    add_column :pokemons, :hp, :integer
  end
end
