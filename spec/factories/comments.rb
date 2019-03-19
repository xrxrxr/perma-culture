FactoryBot.define do
  factory :comment do
    content { 'MyText' }
    user{FactoryBot.create(:user)}
    post{FactoryBot.create(:post)}
    commenteable { true }
    likeable { true }
  end
end
