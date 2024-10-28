class CreatePokemons < ActiveRecord::Migration[7.2]
  def change
    create_table :pokemons do |t|
      t.string :name
      t.string :pokemon_type
      t.integer :height
      t.integer :weight
      t.text :abilities

      t.timestamps
    end
  end
end
