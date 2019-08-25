require 'rails_helper'

RSpec.describe "User logout" do
  it "logout as a registered User" do
    user = create(:user)

    visit root_path
    click_link "Login"
    fill_in "username", with: user.username
    fill_in "password", with: user.password
    click_button "Log In"
    click_link "Logout"

    expect(current_path).to eq(root_path)
    expect(page).to have_link("Login")
    expect(page).to have_content("See you later!")
  end
end
