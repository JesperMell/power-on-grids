class Public::GameActionController < Public::PublicController

  def create
    action = GameAction.new(action_params)
    if action.save
      ActionCable.server.broadcast 'room_channel',
        content: action.data,
        user: action.user
    end
  end

  private

  def action_params
    params.require("action").permit('user_id', 'data')
  end

end
