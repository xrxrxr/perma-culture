FactoryBot.define do
  factory :post do
    title { Faker::Name.name}
    content { Faker::Lorem.paragraphs}
    category{FactoryBot.build(:category)}
    writter{FactoryBot.build(:user)}
  end
end