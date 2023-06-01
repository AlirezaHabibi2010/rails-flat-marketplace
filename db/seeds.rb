# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'open-uri'

puts "Drop all!"
Booking.destroy_all
Flat.destroy_all
User.destroy_all

def add_imag(model, url)
  downloaded_image = URI.parse(URI::Parser.new.escape(url)).open
  if model.respond_to?(:photo)
    model.photo.attach(io: downloaded_image, filename: "avatar.jpg")
  else
    model.photos.attach(io: downloaded_image, filename: "avatar.jpg")
  end
end

puts "Creating users"
user = User.new(email: "habibi.alireza2010@gmail.com", password: "123456", password_confirmation: "123456", first_name: "Alireza", last_name: "Habibi", address: "Jülich, Germany", admin: true)
url = "https://avatars.githubusercontent.com/u/87390313?v=4"
add_imag(user, url)
user.save!

user = User.new(email: "aaronsilva95@outlook.es", password: "123456", password_confirmation: "123456", first_name: "Aaron", last_name: "Lorenzo Silva", address: "Ulitzkastr., 13, Cologne, Germany")
url = "https://avatars.githubusercontent.com/u/130074355?v=4"
add_imag(user, url)
user.save!

user = User.new(email: "martis3007@gmail.com", password: "123456", password_confirmation: "123456", first_name: "Marta", last_name: "Spilnyk", address: "Cologne, Germany")
url = "https://avatars.githubusercontent.com/u/119310647?v=4"
add_imag(user, url)
user.save!

user_ids = User.ids

puts "Creating Flats"
descriptions = [
  "With this special accommodation, all the important points of interest are very close by - making planning your stay very easy.",
  "It is a 68 square meter apartment with a balcony. There is an elevator in the house. Upon arrival, the beds are made and you will find coffee or tea.
  The space
  We warmly welcome you to our holiday apartment.

  We offer:

  1 holiday apartment (68 sqm) for 2-5 people,

  bedflat (double bed) and small child's bed.

  Living flat (with integrated kitchen incl. dishwasher) and furnished balcony;

  In the living flat there are also 2 leather couches that can be converted into beds.

  Bathflat with shower cubicle.

  In the bathflat there is a washing machine and a dryer.",
  "Hi! You are welcome in my really nice guest flat that will provide everything you need: a comfortable bed, cosiness and enough storage flat. With garden view - so it is nice and quiet there. Kitchen and bathflat are right next door - in the apartment beside the flat. That is the other extra bonus: you can enjoy your own private flat - it is separated from the apartment in the stairwell - next door.",
  "I rent a modern & beautiful flat in Cologne, close to the exhibition center.

  You can experience the city up close or relax in the beautiful sun garden after a long day.

  Sufficient leisure activities are provided here with WLAN, smart TV, shopping facilities as well as cafes and restaurants.

  There is a lot to discover in Cologne...",
  "Apartment with kitchen, bedflat, living area and bathflat. One bed in the bedflat, double sofa bed with slatted frame in the living area. Quiet street with parking space.

  The apartment is located in Bergisch Gladbach, district Refrath with direct train connection to the city center of Cologne (20 minutes driving time) as well as to the fair Cologne Deutz and the airport Cologne Bonn.",
  "The flat is 20 square meters and offers everything you need for a short stay in Cologne.
  It is only 20 minutes by S-Bahn from the Cologne Exhibition Center and 15 minutes from the Cologne main station
  The space
  A sofa bed is available for sleeping, which is equipped with an additional topper. Towels and linens are provided.
  A small fridge and a stovetop are also available.

  The entrance is in a garage but is completely separate from the residential building.",
  "The apartment in Cologne Niehl with balcony and parquet floor offers a cozy flat with a comfortable bed (140x200). The kitchen is fully equipped. The underfloor heating ensures a pleasant living environment. The apartment is in a quiet area, close to restaurants, cafes and shops. The train station can be reached in a few minutes and is therefore also ideal for trade fair visitors. The apartment offers a quiet and comfortable stay close to the city center and its attractions. ",
  "Oasis for 2-4 people in the old ferry house directly on the Rhine. Forget your worries - in this spacious and quiet accommodation and relax in the nature reserve. eg as a yoga teacher or organizer of small events. We rent this apartment to individualists and people who enjoy nature and a free lifestyle. The lovingly furnished apartment on the ground floor is suitable for people with animals and individualists who still don't want to miss the spirit of the city of Cologne "
]

addresses = [
  "Robert-Perthel-Straße 1, 50739 Köln",
  "Longericher Str. 150, 50739 Köln",
  "Tiefentalstraße 72, 51063 Köln",
  "Wasserwerkstraße 12, 51067 Köln",
  "Silesiusstraße 28, 51065 Köln",
  "Messepl. 1, 50679 Köln",
  "Siegburger Str. 308/310, 51105 Köln",
  "Kerpener Str. 62, 50937 Köln",
  "Franz-Kremer-Allee 1-3, 50937 Köln",
  "Butzweilerstraße 35-39, 50829 Köln",
  "Anfahrt über die Militärringstraße, Goldammerweg 361, 50829 Köln",
  "Butzweilerstraße 51, 50829 Köln",
  "Otto-Bayer-Straße 10, 51061 Köln",
  "Overfeldweg 61, 51371 Leverkusen",
  "Bahnhofstraße 11, 51379 Leverkusen",
]
# name: "The holy flat", description: nil, address: nil, price: nil, user_id: nil
rand((15..20)).times.each do |i|
  puts "flat number", i
  random_flat_url = "https://source.unsplash.com/random/500×1000/?room"
  flat = Flat.new(name: Faker::Name.female_first_name , description: descriptions.sample, address: addresses.sample, price: rand(100..900), user_id: user_ids.sample)
  rand((3..5)).times.each do |_|
    add_imag(flat, random_flat_url);
    flat.save!
  end
end

flat_ids = Flat.ids

puts "Creating Flats"
rand((20..40)).times.each do |i|
  booking = Booking.new(start_date: Faker::Date.forward(days: 30), end_date: Faker::Date.forward(days: 60), flat_id: flat_ids.sample, user_id: user_ids.sample)
  puts booking.save
end
