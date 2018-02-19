class AddMapToGames < ActiveRecord::Migration[5.1]
  def change
    add_reference :games, :map, index: true
  end
end
