require 'rails_helper'

describe "the add a product process" do
  before(:each) do
    User.create({email: "admin", password: "123456", admin: true})
    visit signin_path
    fill_in 'Email', with: 'admin'
    fill_in 'Password', with: '123456'
    click_on 'Sign In'
  end

  it "adds a new product" do
    visit products_path
    click_link 'Create new product'
    fill_in 'Name', :with => 'guitar'
    fill_in 'Cost', :with => 70
    fill_in 'Country of Origin', :with => 'Japan'
    click_on 'Create Product'
    expect(page).to have_content 'Product successfully added!'
    expect(page).to have_content 'Guitar'
  end

  it "gives an error when no name is entered" do
    visit new_product_path
    click_on 'Create Product'
    expect(page).to have_content "Name can't be blank"
  end
end