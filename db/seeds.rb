# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
 
 # To use this file:
 # rake db:reset
 
50.times do
  User.create!(
    name:     Faker::Name.name,
    email:    Faker::Internet.email,
    password: Faker::Internet.password(8, 15)
  )
end
users = User.all

#Create items
100.times do
  Item.create!(
    user:   users.sample,
    name:   Faker::Lorem.characters(10),
    done:   false
  )
end
items = Item.all  

#Generate data for Henry
User.first.update_attributes!(
  name:     'Henry Schaumburger',
  email:    'per4mnce@gmail.com',
  password: 'password'
)

#Generate todos for henry
5.times do
  Item.create!(
    user:   User.first,
    name:   Faker::Lorem.characters(10),
    done:   false
  )
end

puts "Seed finished"
puts "#{User.count} users created!"
puts "#{Item.count} todos created!"
