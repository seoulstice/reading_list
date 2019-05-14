require 'rails_helper'

RSpec.describe "User login form" do
  it "logs in an registered User" do
  user = User.create!(username: "hungryhippo", password: "test")

  visit root_path

  click_on "Log In"

  expect(current_path).to eq(login_path)

  fill_in "username", with: user.username
  fill_in "password", with: user.password
  click_on "Log In"

  expect(current_path).to eq(root_path)
  expect(page).to have_content(user.username)
  expect(page).to have_content("Log Out")
  end
end
