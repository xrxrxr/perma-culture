# frozen_string_literal: true

FactoryBot.define do
  factory :user_category do
  	belongs_to { :user }
  	belongs_to { :category }
  end
end
