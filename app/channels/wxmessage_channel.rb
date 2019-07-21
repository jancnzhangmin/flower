class WxmessageChannel < ApplicationCable::Channel
  def subscribed
    stream_from "wxmessage_channel"
    #ActionCable.server.broadcast 'wxmessage_channel','aadfs'
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    #ActionCable.server.broadcast 'wxmessage_channel','adfasdf'
  end
end
