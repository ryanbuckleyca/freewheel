# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
Faker::Config.locale = 'en-CA'

User.destroy_all
Bike.destroy_all
Rental.destroy_all

USER_RYAN = User.create(id: 1, email: 'ryanbuckley@gmail.com',
                        first_name: 'Ryan', last_name: 'Buckley',
                        phone_number: '(347) 272-0159', password: '123456')
BIKE_TYPES = ['Mountain Bike', 'Hybrid/Comfort Bike', 'Road Bike',
              'Triathlon Bike', 'BMX Bike', 'Commuting Bike',
              'Cyclocross Bike', 'Track Bike', 'Fixed Gear',
              'Folding Bike', 'Kids Bike', 'Beach Cruiser', 'Recumbent']
BIKE_BRANDS = ['Bianchi', '6KU', 'Colnago', 'Co-op Cycles',
               'Critical Cycles', 'Retrospec', 'Cube', 'Devinci',
               'Diamondback', 'Felt', 'Firmstrong', 'Fuji', 'sixthreezero',
               'Giant', 'GT', 'Ibis', 'Jamis', 'Kestrel', 'Niner', 'Peugeot',
               'Orbea', 'Prevelo', 'Priority', 'Pure-Fix', 'Rad Power', 'Raleigh',
               'Sage Titanium', 'Salsa Cycles', 'Santa Cruz', 'Schwinn',
               'Specialized', 'Surly', 'Tommaso', 'Trek', 'woom', 'Yeti Cycles']
ryan_bike = Bike.new(frame_size: 72, seat_count: 1, bike_type: 'Fixed Gear',
                     year: 2005, brand: 'Peugeot', price: 4,
                     location: '1200 Rue Atatken', available_for_rent: true)
ryan_bike.user = USER_RYAN
ryan_bike.save!

def generate_users
  new_user = User.new(email: Faker::Internet.email,
                      first_name: Faker::Name.first_name,
                      last_name: Faker::Name.last_name,
                      phone_number: Faker::PhoneNumber.cell_phone,
                      password: '123456')
  new_user.save!
end

puts 'generating users...'
10.times do
  generate_users
end
puts '10 users generated'


def generate_bikes
  seats = rand(1) < 0.9 ? 1 : 2
  new_bike = Bike.new(frame_size: rand(61..86), seat_count: seats,
                      bike_type: seats == 2 ? 'Tandem' : BIKE_TYPES.sample,
                      year: rand(1) < 0.1 ? rand(1900..1990) : rand(1991..2020),
                      brand: BIKE_BRANDS.sample, price: rand(3..5),
                      location: Faker::Address.full_address, available_for_rent: true)
  new_bike.user = User.all.sample
  new_bike.save!
end

puts 'generating bikes...'
30.times do
  generate_bikes
end
puts '30 bikes generated...'


def generate_rentals
    user = User.all.sample
    bike = Bike.all.sample
    message = [Faker::Quote.famous_last_words,
               'Hey! Love this bike. Looking forward to zipping around!',
               'Coooool. Glad I found this!',
               'Hell yeah, sweet wheels!',
               'Do you mind if I take this off-roading?',
               'Hiii, is the seat adjustable at all on this? I am 80cm and not sure it would fit otherwise.']
    rental_start = DateTime.new(2020, rand(8..10), rand(1..29),
                                rand(9..20), [00, 15, 30, 45].sample, 0)
    rental_length = (30 * rand(672)).minutes
    new_rental = Rental.new(rental_start: rental_start,
                            rental_end: rental_start + rental_length,
                            booking_confirmed: false,
                            bike_returned: false,
                            message: message.sample)
    new_rental.bike = bike
    new_rental.user = user
    new_rental.save!
end

puts 'generating rentals...'
15.times do
  generate_rentals
end
puts '15 rentals generated...'

