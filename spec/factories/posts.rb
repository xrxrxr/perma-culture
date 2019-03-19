FactoryBot.define do
  factory :post do
    title { Faker::Space.agency }
    content { Faker::Lorem.paragraphs }
    belongs_to { :writter}
    belongs_to { :category}
    commenteable { true }
    likeable { true }
  end
end