# frozen_string_literal: true

FactoryBot.define do
  factory :user_category do
  	user{FactoryBot.create(:user)}
  	category{FactoryBot.create(:category)}
  end
end
