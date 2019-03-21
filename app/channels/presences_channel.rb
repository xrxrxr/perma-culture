class PresencesChannel < ApplicationCable::Channel
  def subscribed
    stream_from "presence"
    current_user.online
  end

  def unsubscribed
    stop_all_streams
    current_user.offline
  end

  def presence(data)
  	ActionCable.server.broadcast('presence', current_user.id)
  end
end