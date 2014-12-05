# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

admin = User.create(email: 'admin@gmail.com', firstname: 'Admin', lastname: 'Admin', admin: true, password: 'qweqweqwe')
users = []
5.times do |u|
	users << User.create(email: "user#{u}@gmail.com", firstname: Faker::Name.first_name, lastname: Faker::Name.last_name, password: 'qweqweqwe')
end

categories_names = ['Shooter', 'RPG', 'Action', 'Sports', 'Strategy', 'Racing']
categories = []


categories_names.each do |c|
	categories << Category.create(name: "#{c}")
end

shooter_prod = ['Call of Duty: Advanced Warfare', 'Battlefield 4', 'Counter-Strike: Global Offensive', 'Crysis 3', 'Max Payne 3', 'Metro 2033', 'Call of Duty: Black Ops II']
rpg_prod = ['Dragon Age: Inquisition', 'Wasteland 2', 'Fallout: New Vegas', 'Star Wars: Knights of the Old Republic', 'Legend of Grimrock', 'Blackguards', 'Might & Magic X: Legacy']
action_prod = ['Far Cry 4', 'Grand Theft Auto V', 'Assassins Creed: Unity', 'Middle-earth: Shadow of Mordor', 'Watch_Dogs', 'Alien: Isolation', 'Wolfenstein: The New Order']
sports_prod = ['Pro Evolution Soccer 2015', 'WWE 2K15', 'Deluxe Ski Jump 4', 'NBA 2K15', 'Real Boxing', 'FIFA 15' , 'Tony Hawks American Wasteland']
strategy_prod = ['The Witcher Adventure Game', 'League of Legends', 'Warhammer 40,000: Armageddon', 'Total War: Rome II', 'Stronghold: Crusader II', 'Company of Heroes 2', 'Europa Universalis IV']
racing_prod = ['The Crew', 'Need for Speed Rivals', 'Need for Speed: Most Wanted', 'Fuel', 'DriveClub', 'GRID: Autosport', 'F1 2014']


7.times do |p|
	categories[0].products.create(title: shooter_prod[p], description: Faker::Lorem.paragraph(3), price: rand(30)+10, user: users[rand(5)])
	categories[1].products.create(title: rpg_prod[p], description: Faker::Lorem.paragraph(3), price: rand(30)+10, user: users[rand(5)])
	categories[2].products.create(title: action_prod[p], description: Faker::Lorem.paragraph(3), price: rand(30)+10, user: users[rand(5)])
	categories[3].products.create(title: sports_prod[p], description: Faker::Lorem.paragraph(3), price: rand(30)+10, user: users[rand(5)])
	categories[4].products.create(title: strategy_prod[p], description: Faker::Lorem.paragraph(3), price: rand(30)+10, user: users[rand(5)])
	categories[5].products.create(title: racing_prod[p], description: Faker::Lorem.paragraph(3), price: rand(30)+10, user: users[rand(5)])
end

Product.all.each do |p|
	5.times do
		p.reviews.create(content: Faker::Lorem.sentence(rand(5)+2), rating: rand(5)+1, user: users[rand(5)])
	end
end

