class AddReferenceToRelatedTables < ActiveRecord::Migration[5.1]
  def change
    add_reference :zones, :map, index: true
    add_reference :cities, :map, index: true
    add_reference :cities, :zone, index: true
    add_reference :connections, :map, index: true
    add_reference :connections, :city, index: true
    add_column :connections, :connected_city_id, :integer
  end
end
