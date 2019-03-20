FactoryBot.define do
  factory :user do
  	user_name {Faker::Name.name}
    email{Faker::Internet.email}
    password { 'password123' }
    address { '69001 - Lyon' }
  end
end