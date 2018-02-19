class AddUserInGameAction < ActiveRecord::Migration[5.1]
  def change
    add_reference :game_actions, :user, index: true
  end
end
