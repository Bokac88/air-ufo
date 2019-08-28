# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
Review.destroy_all
Rental.destroy_all
Ufo.destroy_all
User.destroy_all

  user = User.new(
    email: "admin@airufo.com",
    password: 1234567890,
    photo: "https://randomuser.me/api/portraits/med/men/9.jpg"
  )
  user.save!

puts 'Creating 20 fake users...'
20.times do |n|
  user = User.new(
    email: Faker::Internet.email,
    password: 1234567890,
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
    description:  Faker::Vehicle.car_options.sample(3).join(", "),
    owner: User.all.sample
)
  ufo.save!
end
puts 'Finished!'


puts 'Creating 20 fake rentals...'
20.times do
  rental = Rental.new(
    start_date: Faker::Date.between(from: 2.days.ago, to: 15.days.from_now),
    end_date: Faker::Date.between(from: 16.days.from_now, to: 1.year.from_now),
    ufo: Ufo.all.sample,
    customer: User.all.sample
)
  rental.save!
end
puts 'Finished!'


puts 'Creating 20 fake reviews...'
20.times do
  review = Review.new(
    rating: rand(1..5),
    content:  Faker::Vehicle.car_options,
    rental: Rental.all.sample
)
  review.save!
end
puts 'Finished!'

