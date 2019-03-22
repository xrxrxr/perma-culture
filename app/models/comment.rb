# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :user
  has_many :likes, as: :likeable
  belongs_to :commenteable, polymorphic: true
  has_many :comments, as: :commenteable, dependent: :destroy

  validates :content, 
  	presence: true,
  	length:{minimum: 2, maximum: 1000}

  scope :by_recent_comment, -> { order(created_at: :asc)}

  def readable_date
  	self.created_at.strftime("%d/%m/%y à %H:%M")
  end

  def poeple_who_likes
    self.likes.map{|like| like.user.user_name}.join(', ')
  end
end
