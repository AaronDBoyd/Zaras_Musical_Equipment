Product.destroy_all

product_id_array = []
country_array = ["USA", Faker::WorldCup.team]
50.times do |index|
  Product.create!(name: Faker::Music.instrument,
                  cost: Faker::Number.within(range: 1..1000),
                  country_of_origin: country_array.sample ) 

      product_id_array.push(Product.last.id)                  
end

p "Created #{Product.count} products."

p "product_id list: #{product_id_array}"

product_id_array.each do |num|
  5.times do |index|
  Review.create!(author: Faker::Superhero.name,
                content: Faker::Lorem.paragraph_by_chars(number: 180),
                rating: Faker::Number.within(range: 1..5) ,
                product_id: num)   
  end
end

p "Created #{Review.count} reviews"
