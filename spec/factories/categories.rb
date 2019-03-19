FactoryBot.define do
  factory :category do
    name { Faker::FunnyName.name }
    post{FactoryBot.create(:post)}
  end
end
