class AddNameToZones2 < ActiveRecord::Migration[5.1]
  def change
    add_column :zones, :name, :string
  end
end
