require 'rails_helper'

RSpec.describe 'Registered User' do
  it 'can search for popular articles and save them' do
    VCR.use_cassette("features/articles") do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit root_path
      select "Seven", from: :days
      click_on "Submit"

      expect(current_path).to eq(popular_path)

      within(:css, "tr#article_0") do
        click_on "Save"
      end

      expect(current_path).to eq(user_saved_articles_path(user))
      expect(page).to have_css("table#saved tr", count: 1)
      expect(page).to_not have_css("table#saved tr", count: 5)
    end
  end
end
