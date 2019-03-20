# frozen_string_literal: true

class Category < ApplicationRecord
  has_many :user_categories
  has_many :users, through: :user_categories
  has_many :posts

  validates :name, 
  presence: true, 
  uniqueness: true,
  length: { in: 5..20 }
end
