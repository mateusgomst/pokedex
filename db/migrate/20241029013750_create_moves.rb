class CreateMoves < ActiveRecord::Migration[7.2]
  def change
    create_table :moves do |t|
      t.timestamps
    end
  end
end