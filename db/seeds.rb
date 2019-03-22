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

Scrapper.new.perform
puts 'Scrapping done'
Events.new.perform
puts 'Events Created'

EventsCreator.new.perform
puts 'Events Created'

puts 'Building Encyclopedia..'
puts 'This could be long..'
Scrapper.new.perform
puts 'Scrapping done'

