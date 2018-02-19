class CreateGameActions < ActiveRecord::Migration[5.1]
  def change
    create_table :game_actions do |t|
      t.string :type

      t.timestamps
    end
  end
end
