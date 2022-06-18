require 'rails_helper'

describe 'the edit a product process' do
  it 'edits a product' do
    User.create({email: "admin", password: "123456", admin: true})
    visit signin_path
    fill_in 'Email', with: 'admin'
    fill_in 'Password', with: '123456'
    click_on 'Sign In'
    product = Product.create({name: "Guitar", cost: 40, country_of_origin: 'Japan'})
    visit products_path
    click_on "Guitar"
    click_on 'Edit'
    fill_in 'Name', with: "Trumpet"
    fill_in 'Cost', with: '868'
    fill_in 'Country of Origin', with: 'Croatia'
    click_on 'Update Product'
    expect(page).to have_content "Product successfully updated!"
  end 
end