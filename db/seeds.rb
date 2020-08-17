# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
Faker::Config.locale = 'en-CA'

User.create(id: 1,
            email: "ryanbuckley@gmail.com",
            first_name: "Ryan",
            last_name: "Buckley",
            phone_number: "(347) 272-0159")

50.times do
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  email = Faker::Internet.email
  phone_number = Faker::PhoneNumber.cell_phone
  password = [*('A'..'Z')].sample(8).join
  new_user = User.new(
              email: email,
              first_name: first_name,
              last_name: last_name,
              phone_number: phone_number,
              password: password
              )
  new_user.save!
end
