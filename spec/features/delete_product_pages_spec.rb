require 'rails_helper'

describe "the delete a product process" do
  it "deletes a product" do
    User.create({email: "admin", password: "123456", admin: true})
    visit signin_path
    fill_in 'Email', with: 'admin'
    fill_in 'Password', with: '123456'
    click_on 'Sign In'
    product = Product.create({name: "Guitar", cost: 40, country_of_origin: 'Japan'})
    visit products_path
    click_on 'Guitar'
    click_on 'Delete'
    expect(page).to have_content 'Product successfully DESTROYED!!'
    expect(page).to have_no_content 'Guitar'
  end
end