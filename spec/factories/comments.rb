FactoryBot.define do
  factory :comment do
    content { 'MyText' }
    user{FactoryBot.create(:user)}
    post{FactoryBot.create(:post)}
  end
end
