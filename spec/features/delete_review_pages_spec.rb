require 'rails_helper'

describe "the delete a review process" do
  it "deletes a review" do
    product = Product.create({name: "Guitar", cost: 40, country_of_origin: 'Japan'})
    review = Review.create({author: 'some person', 
      content: 'abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz',
      rating: 2, product_id: product.id})
    visit products_path
    click_on 'Guitar'
    click_on 'Some Person'
    click_on 'Delete review'
    expect(page).to have_content 'Review successfully DESTROYED!!'
    expect(page).to have_no_content 'Some Person'
  end
end