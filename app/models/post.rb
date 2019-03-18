# frozen_string_literal: true

class Post < ApplicationRecord
  has_many_attached :post_pictures

  belongs_to :writter, class_name: 'User'
  belongs_to :category
  has_many :comments, as: :commenteable
  has_many :likes, as: :likeable

	validates :content, 
	presence: true,	
	length:{minimum: 5, maximum: 3000}
	
	validates :title,
	presence: true,
	length:{minimum: 5, maximum: 60}

  scope :by_latest_comment, -> {Post.joins(:comments).merge(Comment.order(created_at: :desc))}
  scope :by_date, -> { order(created_at: :asc)}

  def latest_comment
    comments
     .order(Comment.arel_table['created_at'].asc)
     .first
  end
end
