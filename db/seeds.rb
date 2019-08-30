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

UFOS_PICTURES = [
  "https://media.istockphoto.com/photos/spaceship-shiny-rocket-flying-into-outer-space-picture-id935699132?k=6&m=935699132&s=612x612&w=0&h=qcwzM9-R4jEwozQ1VKzBMdQjuaVWYk72_ny-mliF5y0=",
  "https://img.thedailybeast.com/image/upload/c_crop,d_placeholder_euli9k,h_1439,w_2560,x_0,y_0/dpr_1.5/c_limit,w_1044/fl_lossy,q_auto/v1492179299/articles/2015/07/02/why-do-ufos-love-this-utah-ranch-so-much/150701-strolhlic-ufo-tease_avkv8u",
  "https://i.pinimg.com/originals/4e/17/4c/4e174c2fa70d3343797ed62f7676c09a.jpg",
  "https://i.ytimg.com/vi/vzLeq2pRgIY/maxresdefault.jpg",
  "https://compote.slate.com/images/248266ae-bc3c-4aa2-a8d0-69a3f65d5500.jpg",
  "https://image.shutterstock.com/image-illustration/3d-render-alien-spaceship-concept-260nw-1361212634.jpg",
  "https://www.outthere.fr/wp-content/uploads/2018/12/9948-1.jpg",
  "https://i.pinimg.com/originals/4b/ce/f2/4bcef2a2fe143d94e867a9a301ddb5d6.jpg",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS-srHnBecU-k7POBXIhSZNLoC0-uaBJI1vE5_UVUteO8d53itq",
  "https://img-new.cgtrader.com/items/666066/f55674da32/spaceship-fighter-3d-model-low-poly-fbx-mat-prefab.jpg",
  "https://cdn-asoundeffect2.pressidium.com/wp-content/uploads/2016/05/spaceship-sound-design-.jpg",
  "https://cdna.artstation.com/p/assets/images/images/010/452/118/large/felix-barthel-still-spaceship-jpg.jpg?1524509922",
  "https://cdn.arstechnica.net/wp-content/uploads/2015/04/HighResScreenShot_2015-03-07_23-13-50-980x551.jpg",
  "https://cdn.disclose.tv/sites/default/files/styles/article_image/public/img/post/2016/03/04/this-luxury-super-yacht-looks-like-a-levitating-alien-spaceship-128597.jpg?itok=vFFu9bAx",
  "https://www.pcgamesn.com/wp-content/uploads/legacy/thorax993424_1-590x334.jpg"
]

puts 'Creating 15 fake ufos...'
15.times do |n|
  ufo = Ufo.new(
    brand: Faker::Movies::StarWars.vehicle,
    speed: rand(9_899..19_000),
    age: rand(0..5),
    price: rand(100_000..500_000),
    description:  Faker::Vehicle.car_options.sample(3).join(", "),
    owner: User.all.sample,
    photo: UFOS_PICTURES[n - 1]
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
40.times do
  review = Review.new(
    rating: rand(1..5),
    content:  Faker::Quote.yoda,
    rental: Rental.all.sample
)
  review.save!
end
puts 'Finished!'