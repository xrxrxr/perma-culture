class Article < ApplicationRecord
	validates :title,
		presence: true,
		uniqueness: true,
		length:{minimum: 5, maximum: 60}

	validates :content,
		presence: true,
		length:{minimum: 5}
end
