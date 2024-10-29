class AddAttackAttributesToPokemons < ActiveRecord::Migration[7.2]
  def change
    add_column :pokemons, :name_attack, :string
    add_column :pokemons, :base_damage, :integer
    add_column :pokemons, :attack_type, :string
    add_column :pokemons, :effect, :string
  end
end
