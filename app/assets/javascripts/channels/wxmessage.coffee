App.wxmessage = App.cable.subscriptions.create "WxmessageChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    #App.wxmessage.speak 'adfadsf'
    # Called when there's incoming data on the websocket for this channel

  speak: (message) ->
    #@perform 'speak', message: 'message'