require 'rails_helper'

describe 'the edit a product process' do
  it 'edits a product' do
    product = Product.create({name: "Guitar", cost: 40, country_of_origin: 'Japan'})
    visit products_path
    click_on "Guitar"
    click_on 'Edit'
    fill_in 'Name', with: "Trumpet"
    fill_in 'Cost', with: '868'
    fill_in 'Country of origin', with: 'Croatia'
    click_on 'Update Product'
    expect(page).to have_content "Product successfully updated!"
  end

  it "gives an error when no name is entered" do
    visit new_product_path
    click_on 'Create Product'
    expect(page).to have_content "Name can't be blank"
  end
end