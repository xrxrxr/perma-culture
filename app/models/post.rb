# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :writter, class_name: 'User'
  belongs_to :category
  has_many :comments, as: :commenteable
  has_many :likes, as: :likeable

  validates :content,
            presence: true,
            length: { minimum: 25, maximum: 1000 }

  validates :title,
            presence: true,
            length: { minimum: 5, maximum: 60 }
end
