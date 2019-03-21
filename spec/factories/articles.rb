FactoryBot.define do
  factory :article do
    title { Faker::Name.name }
    content { "MyText" }
  end
end
