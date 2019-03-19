FactoryBot.define do
  factory :like do
    belongs_to { :user}
    likeable { true }
  end
end
