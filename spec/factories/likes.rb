# frozen_string_literal: true

FactoryBot.define do
  factory :like do
    user { nil }
    likeable { nil }
  end
end
