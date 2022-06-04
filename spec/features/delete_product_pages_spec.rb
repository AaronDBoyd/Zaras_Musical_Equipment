require 'rails_helper'

describe "the delete a product process" do
  it "deletes a product" do
    product = Product.create({name: "Guitar", cost: 40, country_of_origin: 'Japan'})
    visit products_path
    click_on 'Guitar'
    click_on 'Delete'
    expect(page).to have_content 'Product successfully DESTROYED!!'
    expect(page).to have_no_content 'Guitar'
  end
end