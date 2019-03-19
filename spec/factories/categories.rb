FactoryBot.define do
  factory :category do
    name { Faker::FunnyName.name }
    belongs_to {:post}
  end
end
