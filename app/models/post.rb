class Post < ApplicationRecord
	belongs_to :writter, class_name: 'User'
	belongs_to :category
	#has_many :comments
	#has_many :likes

	validates :content, 
	presence: true,	
	length:{minimum: 25, maximum: 1000}
	
	validates :title,
	presence: true,
	length:{minimum: 5, maximum: 30}
end
