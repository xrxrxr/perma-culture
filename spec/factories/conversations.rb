FactoryBot.define do
  factory :conversation do
   belongs_to {:sender}
   belongs_to {:recipient}
    recipient_id { 1 }
    sender_id { 1 }
  end
end
