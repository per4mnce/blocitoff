# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
 
 #User Schema
    # t.string   "email",                  default: "", null: false
    # t.string   "encrypted_password",     default: "", null: false
    # t.string   "reset_password_token"
    # t.datetime "reset_password_sent_at"
    # t.datetime "remember_created_at"
    # t.integer  "sign_in_count",          default: 0,  null: false
    # t.datetime "current_sign_in_at"
    # t.datetime "last_sign_in_at"
    # t.string   "current_sign_in_ip"
    # t.string   "last_sign_in_ip"
    # t.datetime "created_at",                          null: false
    # t.datetime "updated_at",        
 
 # To use
 # rake db:reset
 
50.times do
  User.create!(
    email:  Faker::Internet.email,
    password: Faker::Internet.password(10, 20),
  )
end
