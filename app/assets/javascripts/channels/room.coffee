App.room = App.cable.subscriptions.create "RoomChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    # Called when there's incoming data on the websocket for this channel
    console.log(data)
    $("#logs").append("<p>City_id: "+data.message.data+"</p>")
  
  action: (data) ->
    @perform 'action', data: data

