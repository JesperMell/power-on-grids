class CreateUserStats < ActiveRecord::Migration[5.1]
  def change
    create_table :user_stats do |t|
      t.integer :games_won
      t.integer :games_lost
      t.string :current_state
      t.integer :current_score

      t.timestamps
    end
  end
end
