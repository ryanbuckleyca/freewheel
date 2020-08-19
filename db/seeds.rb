require 'faker'

Faker::Config.locale = 'en-CA'

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
MTL_ADDRESSES = [ '6817 43 Av, Montreal QC', '7503 Rue St Denis, Montreal QC',
                  '251 Av Percival Montreal Ouest QC', '7766 George Street Lasalle QC',
                  '11727 Rue Notre Dame E, Montreal QC', '5745 17 Av, Montreal QC',
                  '3708 Rue St Hubert, Montreal QC', '800 Rue Gagne Lasalle QC',
                  '4430 Ste Catherine Street O Westmount QC', '5930 Rue Hurteau, Montreal QC',
                  '717 Charron Street Lasalle QC', '2630 St Germain Street, Montreal QC',
                  '6730 44 Av, Montreal QC', '1940 Jolicoeur Street, Montreal QC',
                  '16 Kenaston Av Mont Royal QC', '5240 Randall Av, Montreal QC',
                  '3555 Edouard-Montpetit, Montreal QC', '7299 de l\'Elysee, Saint-Léonard QC',
                  '12225 Av de Saint-Castin, Montreal QC', '391 Rue de la Congrégation, Montreal QC']
MTL_PHONES = ['(514) 376-8344', '(514) 279-7016', '(514) 482-1925', '(514) 366-7190',
              '(514) 680-4011', '(514) 593-0995', '(514) 282-9395', '(514) 769-5499',
              '(514) 488-4685', '(514) 767-3902', '(438) 380-0604', '(514) 253-8475',
              '(514) 729-1844', '(514) 761-3242', '(514) 485-2431', '(514) 507-2550',
              '(514) 342-8215', '(514) 257-9112', '(438) 380-3437', '(514) 935-1002']

def generate_base_user_bike
  USER_RYAN = User.create(email: 'ryanbuckley@gmail.com',
                          first_name: 'Ryan', last_name: 'Buckley',
                          phone_number: '(347) 272-0159', password: '123456')
  ryan_bike = Bike.new(frame_size: 72, seat_count: 1, bike_type: 'Fixed Gear',
                       year: 2005, brand: 'Peugeot', price: 4,
                       location: '1200 Rue Atatken, Montreal QC', available_for_rent: true)
  ryan_bike.user = USER_RYAN
  ryan_bike.save!
end

def generate_users(times)
  puts "generating #{times} users..."
  times.times do |i|
    new_user = User.new(email: Faker::Internet.email,
                        first_name: Faker::Name.first_name,
                        last_name: Faker::Name.last_name,
                        phone_number: MTL_PHONES[i],
                        password: [*('A'..'Z')].sample(8).join)
    new_user.save!
  end
  puts "#{times} users generated"
end

def generate_bikes(times)
  puts "generating #{times} bikes..."
  times.times do |i|
    seats = rand(1) < 0.9 ? 1 : 2
    new_bike = Bike.new(frame_size: rand(61..86), seat_count: seats,
                        bike_type: seats == 2 ? 'Tandem' : BIKE_TYPES.sample,
                        year: rand(1) < 0.1 ? rand(1900..1990) : rand(1991..2020),
                        brand: BIKE_BRANDS.sample, price: rand(3..5),
                        location: MTL_ADDRESSES[i], available_for_rent: true)
    new_bike.user = User.all.sample
    new_bike.save!
  end
  puts "#{times} bikes generated..."
end

def generate_rentals(times)
  puts "generating #{times} rentals..."
  times.times do
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
  puts "#{times} rentals generated..."
end

# DROP EVERYTHING FIRST
Rental.destroy_all
User.destroy_all
Bike.destroy_all

# RUN SEEDS
generate_base_user_bike
generate_users(20)
generate_bikes(20)
generate_rentals(15)



