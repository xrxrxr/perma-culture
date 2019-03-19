FactoryBot.define do
  factory :like do
  	user{FactoryBot.create(:user)}
  end
end
