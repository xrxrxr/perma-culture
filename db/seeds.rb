# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Category.create!(name: 'Permaculture')	
Category.create!(name: 'Pisciculture')
Category.create!(name: 'Agroécologie')
Category.create!(name: 'Agroforesterie')
Category.create!(name: 'Maréchage')

10.times do 
	user = User.create!(user_name:Faker::Internet.username, email:Faker::Internet.email, password:Faker::Educator.university)
	rand(0..3).times do 
		user.categories << Category.all.sample
	end
end

5.times do
	post = Post.create!(title:Faker::Educator.subject, content:Faker::Lorem.sentences(25), writter: User.all.sample, category: Category.all.sample)
end
