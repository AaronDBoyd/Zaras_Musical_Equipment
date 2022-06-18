require 'rails_helper'

describe "the add a review process" do
  before :each do
    User.create({email: "admin", password: "123456", admin: true})
    visit signin_path
    fill_in 'Email', with: 'admin'
    fill_in 'Password', with: '123456'
    click_on 'Sign In'
    product = Product.create({name: "Guitar", cost: 40, country_of_origin: 'Japan'})
    visit products_path
    click_on 'Guitar'
  end

  it "adds a new review" do
    click_link 'Add a review'
    fill_in 'Author', :with => 'some person'
    fill_in 'Content', :with => 'abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz'
    select '3', from: 'Rating'
    click_on 'Create Review'
    expect(page).to have_content 'Review successfully added!'
    expect(page).to have_content 'Some Person'
  end

  it "gives an error when no name is entered" do
    click_on 'Add a review'
    click_on 'Create Review'
    expect(page).to have_content "Author can't be blank"
  end
end