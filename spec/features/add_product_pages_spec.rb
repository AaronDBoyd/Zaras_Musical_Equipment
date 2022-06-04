require 'rails_helper'

describe "the add a product process" do
  it "adds a new product" do
    visit products_path
    click_link 'Create new product'
    fill_in 'Name', :with => 'guitar'
    fill_in 'Cost', :with => 70
    fill_in 'Country of origin', :with => 'Japan'
    click_on 'Create Product'
    expect(page).to have_content 'Product successfully added!'
    expect(page).to have_content 'Guitar'
  end

  # it "gives an error when no name is entered" do
  #   visit new_album_path
  #   click_on 'Create Album'
  #   expect(page).to have_content "Name can't be blank"
  # end
end