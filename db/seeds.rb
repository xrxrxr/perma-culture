# frozen_string_literal: true

Category.create!(name: 'General')
puts 'Category created'
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

# Encyclopedia scrapper
Scrapper.new.perform

# Event scrapper
EventsCreator.new.perform


