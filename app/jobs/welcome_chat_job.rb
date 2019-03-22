class WelcomeChatJob < ApplicationJob
  queue_as :default

  def perform(user)
  	conversation = Conversation.create(sender_id: 1, recipient_id: user.id)
    conversation.messages.create(user_id: 1, body: "Bienvenue sur perma-culture #{user.user_name}. Si tu as des questions ou des remarques, tu peux m'écire ici ! Je te répondrais dans les plus brefs delais!")
  end
end
