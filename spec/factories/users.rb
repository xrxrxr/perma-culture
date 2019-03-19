FactoryBot.define do
  factory :user do
    email { Faker::Internet.free_email }
    password { '#$taawktljasktlw4aaglj' }
	user_name { Faker::FunnyName.name }
	is_admin { false }
  end
end