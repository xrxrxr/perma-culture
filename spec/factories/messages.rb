FactoryBot.define do
  factory :message do
    user{FactoryBot.create(:user)}
    conversation{FactoryBot.create(:conversation)}
    body { "MyText" }

  end
end
