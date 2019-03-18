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
  after_create :set_description
  after_create :welcome_send

  has_one_attached :avatar
  has_many :user_categories
  has_many :categories, through: :user_categories
  has_many :posts, foreign_key: 'writter_id'
  has_many :comments
  has_many :likes
  has_many :messages
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
    downloaded_image = (open('https://epicattorneymarketing.com/wp-content/uploads/2016/07/Headshot-Placeholder-1.png'))
    self.avatar.attach(io: downloaded_image, filename: 'image.png')
  end
  
  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end

  def set_description
    self.update(description: "Il nous faudra répondre à notre véritable vocation, qui n'est pas de produire et de consommer jusqu'à la fin de nos vies, mais d'aimer, d'admirer et de prendre soin de la vie sous toutes ses formes.")
  end
end
