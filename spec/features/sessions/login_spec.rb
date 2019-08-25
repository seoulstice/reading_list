require 'rails_helper'

RSpec.describe "User login form" do
  it "logs in an registered User" do
  user = create(:user)

  visit root_path
  click_link "Login"

  expect(current_path).to eq(login_path)
  
  fill_in "username", with: user.username
  fill_in "password", with: user.password
  click_button "Log In"
  
  expect(current_path).to eq(root_path)
  expect(page).to have_content("Logged in as #{user.username}")
  expect(page).to have_content("Welcome back to Reading List, #{user.username}!")
  expect(page).to have_link("Logout")
  end
end
