require 'rails_helper'

describe Review do
  it { should belong_to(:product) }
  it { should validate_presence_of :author }
  it { should validate_presence_of :content }
  it { should validate_presence_of :rating }
  it { should validate_length_of(:content).is_at_least(50).is_at_most(250)}

  it("titleizes the author of a review") do
    product = Product.create({name: "distortion pedal", cost: 40, 
                              country_of_origin:"japan"})
    review = Review.create({author: "some person", 
      content: "abcdefghijklmnopqrstuvwxyz abcdefghijklmnopqrstuvwxyz",
                                  rating: 4, product_id: product.id})
    expect(review.author()).to(eq("Some Person"))
  end
end