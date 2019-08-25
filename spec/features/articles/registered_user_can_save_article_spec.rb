require 'rails_helper'

RSpec.describe 'Registered User' do
  it 'can search for popular articles and save them' do
    VCR.use_cassette("features/articles") do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit root_path
      within(:css, "div#popular") do
        select "Last Seven Days", from: :days
        click_on "Submit"
      end

      expect(current_path).to eq(popular_path)

      first('.article').click_button("Save")

      expect(current_path).to eq(user_saved_articles_path(user))
      expect(page).to have_css("div.article", count: 1)
      expect(page).to_not have_css("div.article", count: 5)
    end
  end
end
