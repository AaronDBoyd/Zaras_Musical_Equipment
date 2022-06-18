require 'rails_helper'

describe "the add a user product" do
  it "adds a new user" do
    visit root_path
    click_on 'Sign up'
    fill_in "Email", with: "user@gmail.com"
    fill_in 'Password', with: '123456'
    fill_in 'Confirm Password', with: '123456'
    click_on 'Sign Up'
    expect(page).to have_content "You've successfully signed up!"
    expect(page).to have_content 'Welcome, User@gmail.com'
  end
end
