FactoryBot.define do
  factory :comment do
    content { Faker::Lorem.paragraphs }
    user{ FactoryBot.build(:user) }
    commenteable { FactoryBot.build(:post)}
  end
end