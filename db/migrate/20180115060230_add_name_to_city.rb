class AddNameToCity < ActiveRecord::Migration[5.1]
  def change
    add_column :cities, :name, :string
  end
end
