class CreateMaps < ActiveRecord::Migration[5.1]
  def change
    create_table :maps do |t|
      t.string :name, null: false
      t.integer :published_version
      t.string :created_by

      t.timestamps
    end
  end
end
