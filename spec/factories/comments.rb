# frozen_string_literal: true

FactoryBot.define do
  factory :comment do
    content { 'MyText' }
    belongs_to { '' }
    belongs_to { '' }
  end
end
