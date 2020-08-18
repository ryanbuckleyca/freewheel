# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
Faker::Config.locale = 'en-CA'

def generate_users
  User.create(id: 1, email: "ryanbuckley@gmail.com",
              first_name: "Ryan", last_name: "Buckley",
              phone_number: "(347) 272-0159")
  new_user = User.new(email: Faker::Internet.email,
                      first_name: Faker::Name.first_name,
                      last_name: Faker::Name.last_name,
                      phone_number: Faker::PhoneNumber.cell_phone,
                      password: [*('A'..'Z')].sample(8).join)
  new_user.save!
end

bike_types = ['Mountain Bike', 'Hybrid/Comfort Bike', 'Road Bike',
              'Triathlon/Time Trial Bike', 'BMX/Trick Bike', 'Commuting Bike',
              'Cyclocross Bike', 'Track Bike/Fixed Gear', 'Tandem',
              'Folding Bike', 'Kids Bike', 'Beach Cruiser', 'Recumbent']
bike_brands = ['Bianchi', 'Cannondale', 'Colnago', 'Co-op Cycles',
               'Critical Cycles', 'Retrospec', 'Cube', 'Devinci',
               'Diamondback', 'Felt', 'Firmstrong', 'Fuji', 'sixthreezero',
               'Giant', 'GT', 'Ibis', 'Jamis', 'Kestrel', 'Niner', 'Orange Mountain',
               'Orbea', 'Prevelo', 'Priority', 'Pure-Fix', 'Rad Power', 'Raleigh',
               'Sage Titanium', 'Salsa Cycles', 'Santa Cruz', 'Schwinn',
               'Specialized', 'Surly', 'Tommaso', 'Trek', 'woom', 'Yeti Cycles']
def generate_bikes
  new_bike = Bike.new(frame_size: rand(61..86),
                      seat_count: rand(1) < .9 ? 1 : 2,
                      type: bike_types.sample,
                      year: rand(1) < .1 ? rand(1900..1990) : rand(1991..2020),
                      brand: bike_brands.sample,
                      price: rand(3..5),
                      location: Faker::Address.full_address,
                      available_for_rent: true)
  new_bike.save!
end

User.destroy_all
Bike.destroy_all

50.times do
  generate_users
  generate_bikes
end
