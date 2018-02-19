class CreatePlayers < ActiveRecord::Migration[5.1]
  def change
    create_table :players do |t|
      t.integer :sequence
      t.boolean :current_player

      t.timestamps
    end
  end
end
