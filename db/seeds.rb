Product.destroy_all
User.destroy_all

user = User.create!(email: 'user@user.com', password: '123456')
admin = User.create!(email: 'admin@admin.com', password: '123456', admin: true)
p "Created #{User.count} users."

product_id_array = []

50.times do |index|
  country_array = ["USA", Faker::WorldCup.team, Faker::WorldCup.team, Faker::WorldCup.team]
  Product.create!(name: Faker::Music.instrument,
                  cost: Faker::Number.within(range: 1..1000),
                  country_of_origin: country_array.sample ) 

  product_id_array.push(Product.last.id)                  
end

p "Created #{Product.count} products."

product_id_array.each do |num|
  5.times do |index|
  Review.create!(author: Faker::Superhero.name,
                content: Faker::Lorem.paragraph_by_chars(number: 180),
                rating: Faker::Number.within(range: 1..5) ,
                product_id: num)   
  end
end

p "Created #{Review.count} reviews"
