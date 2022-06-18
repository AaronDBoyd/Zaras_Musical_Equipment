require 'rails_helper'

describe "the delete a review process" do
  it "deletes a review" do
    User.create({email: "admin", password: "123456", admin: true})
    visit signin_path
    fill_in 'Email', with: 'admin'
    fill_in 'Password', with: '123456'
    click_on 'Sign In'
    product = Product.create({name: "Slide Whistle", cost: 40, country_of_origin: 'Japan'})
    review = Review.create({author: 'some person', 
      content: 'abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz',
      rating: 2, product_id: product.id})
    visit product_review_path(product, review)
    click_on 'Delete review'
    expect(page).to have_content 'Review successfully DESTROYED!!'
    expect(page).to have_no_content 'Some Person'
  end
end