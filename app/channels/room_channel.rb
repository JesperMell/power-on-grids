class RoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "room_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def action(data)
    GameAction.create values: data, user_id: 16
    ActionCable.server.broadcast 'room_channel', message: data 
  end
end
