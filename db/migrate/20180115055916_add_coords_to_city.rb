class AddCoordsToCity < ActiveRecord::Migration[5.1]
  def change
    add_column :cities, :coords, :hstore 
  end
end
