FactoryBot.define do
  factory :comment do
    content { 'MyText' }
    belongs_to { :user }
    belongs_to { :post }
    commenteable { true }
    likeable { true }
  end
end
