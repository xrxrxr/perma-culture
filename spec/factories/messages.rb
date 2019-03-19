FactoryBot.define do
  factory :message do
    belongs_to{ :user}
    belongs_to{ :conversation }
    body { "MyText" }
    user { nil }
    conversation { nil }
  end
end
