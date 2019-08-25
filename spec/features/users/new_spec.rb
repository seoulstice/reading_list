require 'rails_helper'

RSpec.describe "User registration form" do
  it "creates a new User" do
    visit root_path

    click_on "Login"
    expect(current_path).to eq(login_path)

    click_on "Register"
    expect(current_path).to eq(new_user_path)

    fill_in "user[username]", with: "hungryhippo"
    fill_in "user[password]", with: "test"
    fill_in "user[password_confirmation]", with: "test"
    click_button "Register"

    new_user = User.last

    expect(current_path).to eq(root_path)
    expect(page).to have_content("Welcome to Reading List!")
    expect(page).to have_content("Logged in as hungryhippo")
    expect(page).to have_link "Logout"
  end
end
