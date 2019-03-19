FactoryBot.define do
  factory :post do
    title { Faker::Space.agency}
    content { Faker::Lorem.paragraphs}
    writter{FactoryBot.create(:user)}
    category{FactoryBot.created(:category)}
    commenteable { true }
    likeable { true }
  end
end