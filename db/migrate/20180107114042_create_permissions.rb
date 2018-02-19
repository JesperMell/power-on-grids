class CreatePermissions < ActiveRecord::Migration[5.1]
  def change
    create_table :permissions do |t|
      t.string :name, null: false
      t.string :modules

      t.timestamps
    end
  end
end
