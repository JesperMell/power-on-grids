class AddValuesToGameActions < ActiveRecord::Migration[5.1]
  def change
    enable_extension "hstore"
   add_column :game_actions, :values, :hstore 
   add_index :game_actions, :values, using: :gin
  end
end
