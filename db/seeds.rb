Category.create!(name: 'Permaculture')
puts 'Category created'
Category.create!(name: 'Pisciculture')
puts 'Category created'
Category.create!(name: 'Agroécologie')
puts 'Category created'
Category.create!(name: 'Agroforesterie')
puts 'Category created'
Category.create!(name: 'Maréchage')
puts 'Category created'


10.times do
  user = User.create!(user_name: Faker::Internet.username, email: Faker::Internet.email, password: Faker::Educator.university, address: "#{rand(10..75) *1000}")
  rand(0..3).times do
    user.categories << Category.all.sample
  end
end
puts '10 users created'

25.times do
  post = Post.create!(title: Faker::Lorem.sentence, content: Faker::Lorem.sentence(25), writter: User.all.sample, category: Category.all.sample)
  post.post_pictures.attach(io: File.open(Rails.root.join('app', 'assets', 'images', "bg-#{rand(0..18)}.jpg")), filename: 'image.png')
end
puts '5 posts created'

40.times do
  Comment.create!(content: Faker::Lorem.paragraph, user: User.all.sample, commenteable: Post.all.sample)
end
puts '20 comments created'

40.times do
  Comment.create!(content: Faker::Lorem.paragraph, user: User.all.sample, commenteable: Comment.all.sample)
end
puts '20 baby comments created'

50.times do
  Like.create!(user: User.all.sample, likeable: [Post.all.sample, Comment.all.sample][rand(0..1)])
end
puts '20 likes created'


EventsCreator.new.perform
puts 'Events Created'

puts 'Building Encyclopedia..'
puts 'This could be long..'
Scrapper.new.perform
puts 'Scrapping done'