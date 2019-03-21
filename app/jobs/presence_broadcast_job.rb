class PresenceBroadcastJob < ApplicationJob
  queue_as :default

  def perform
    ActionCable.server.broadcast('presence', current_user.id)
  end
end
