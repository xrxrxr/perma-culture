FactoryBot.define do
  factory :user do
  	user_name {"kikou-#{rand(0..100000)}"}
    email{Faker::Internet.email}
    password { 'password123' }
    address { '69001 - Lyon' }
  end
end