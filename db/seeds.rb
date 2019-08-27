# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
puts 'Creating 20 fake users...'
20.times do |n|
  user = User.new(
    email: Faker::Internet.email,
    password: Faker::Internet.password(min_length: 10, max_length: 20),
    photo: "https://randomuser.me/api/portraits/med/men/#{n}.jpg"
)
  user.save!
end
puts 'Finished!'


puts 'Creating 20 fake ufos...'
20.times do
  ufo = Ufo.new(
    brand: Faker::Movies::StarWars.vehicle,
    speed: rand(9_899..19_000),
    age: rand(0..5),
    price: rand(100_000..500_000),
    description: Faker::Movies::StarWars.wookiee_sentence,
    owner: User.find(rand(1..20))
)
  ufo.save!
end
puts 'Finished!'


puts 'Creating 20 fake rentals...'
20.times do
  rental = Rental.new(
    start_date: Faker::Date.between(from: 2.days.ago, to: 15.days.from_now),
    end_date: Faker::Date.between(from: 16.days.from_now, to: 1.year.from_now),
    ufo_id: rand(1..20),
    customer_id: rand(1..20)
)
  rental.save!
end
puts 'Finished!'


puts 'Creating 20 fake reviews...'
20.times do
  review = Review.new(
    rating: rand(1..5),
    content:  Faker::Vehicle.car_options,
    rental_id: rand(1..20)
)
  review.save!
end
puts 'Finished!'

