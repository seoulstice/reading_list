require 'rails_helper'

RSpec.describe "User registration form" do
  it "creates a new User" do
    visit root_path

    click_on "Register"

    expect(current_path).to eq(new_user_path)

    fill_in "user[username]", with: "hungryhippo"
    fill_in "user[password]", with: "test"
    fill_in "user[password_confirmation]", with: "test"
    click_button "Register"

    new_user = User.last

    expect(current_path).to eq(root_path)
    expect(page).to have_content("Signed in as #{new_user.username}")
    expect(page).to have_link "Log Out"
  end
end
