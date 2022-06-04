require 'rails_helper'

describe 'the edit a review process' do
  it 'edits a review' do
    product = Product.create({name: "Guitar", cost: 40, country_of_origin: 'Japan'})
    review = Review.create({author: 'some person', 
      content: 'abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz',
      rating: 2, product_id: product.id})
    visit products_path
    click_on "Guitar"
    click_on 'Some Person'
    click_on 'Edit review'
    fill_in 'Author', with: "Another person"
    # fill_in 'Cost', with: '868'
    # fill_in 'Country of origin', with: 'Croatia'
    click_on 'Update Review'
    expect(page).to have_content "Review successfully updated!"
    expect(page).to have_content "Another Person"
  end

  # it "gives an error when no name is entered" do
  #   visit new_product_path
  #   click_on 'Create Product'
  #   expect(page).to have_content "Name can't be blank"
  # end
end