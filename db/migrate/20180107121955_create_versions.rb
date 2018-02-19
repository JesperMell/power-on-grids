class CreateVersions < ActiveRecord::Migration[5.1]
  def change
    create_table :versions do |t|
      t.text :cities, array: true, default: []
      t.text :zones, array: true, default: []
      t.text :connections, array: true, default: []
      t.string :created_by, null: false
      t.timestamps
    end
  end
end
