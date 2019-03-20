# frozen_string_literal: true
require 'open-uri'

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable
  geocoded_by :address
  after_validation :geocode
  
  before_create :grab_image
  after_create :welcome_send

  has_one_attached :avatar
  has_many :user_categories, dependent: :destroy
  has_many :categories, through: :user_categories
  has_many :posts, foreign_key: 'writter_id'
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :conversations, foreign_key: :sender_id
  
  validates :user_name, 
  presence: true, 
  uniqueness: true,
  length: { in: 3..25 }

  validates :email, 
  presence: true, 
  uniqueness: true,
  format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "Veuillez entrer un email valide"}

  def grab_image
    self.avatar.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'default-avatar.png')), filename: 'image.png')
  end
  
  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end

  def dont_already_like?(likeable)
    self.likes.find_by(likeable: likeable).nil?
  end

  def self.search(search)
    if search
      where('user_name ILIKE ?', "%#{search}%")
    else
      all
    end
  end

  def avatar_mini
      return self.avatar.variant(combine_options: [
                                [:resize, "64x64^"],
                                [:gravity, "center"],
                                [:crop, "64x64+0+0"]
                                ])
  end
end
