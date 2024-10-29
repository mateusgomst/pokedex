class CreatePokemonImages < ActiveRecord::Migration[7.2]
  def change
    create_table :pokemon_images do |t|
      t.string :name
      t.string :image_url

      t.timestamps
    end
  end
end
