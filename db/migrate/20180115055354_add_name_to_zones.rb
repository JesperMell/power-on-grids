class AddNameToZones < ActiveRecord::Migration[5.1]
  def change
    add_column :zones, :name, :string
  end
end
