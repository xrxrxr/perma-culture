FactoryBot.define do
  factory :conversation do
   sender{FactoryBot.create(:user)}
   recipient{FactoryBot.create(:user)}
    recipient_id { 1 }
    sender_id { 1 }
  end
end
