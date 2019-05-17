require 'rails_helper'

RSpec.describe 'Registered User' do
  it 'can search for popular articles and save them' do
    VCR.use_cassette("features/articles") do
      user = User.create(username: "test", password_digest: "test")
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit root_path
      select "Seven", from: :days
      click_on "Submit"

      expect(current_path).to eq(popular_path)
      within("#article_0") do
        click_on "Save"
      end

      expect(current_path).to eq(user_path(user))







    end
  end
end
