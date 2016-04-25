# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


3.times do 
  user = User.create(email: Faker::Internet.email, password: 'password', password_confirmation: 'password')
end

User.all.each do |user|
  10.times do 
    Item.create(name: Faker::Lorem.sentence, user: user)
  end
end