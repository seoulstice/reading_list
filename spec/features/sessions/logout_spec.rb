require 'rails_helper'

RSpec.describe "User logout" do
  it "logout as a registered User" do
    user = User.create!(username: "hungryhippo", password: "test")

    visit root_path
    click_on "Log In"
    fill_in "username", with: user.username
    fill_in "password", with: user.password
    click_on "Log In"
    click_on "Log Out"

    expect(current_path).to eq(root_path)
    expect(page).to have_link("Register")
    expect(page).to have_link("Log In")
  end
end
