require 'rails_helper'

RSpec.describe 'Registered User' do
  it 'can search for popular articles and save them' do
    VCR.use_cassette("features/articles") do
      user = create(:user)
      page.set_rack_session(user_id: user.id)

      visit root_path
      within(:css, "div#popular_select") do
        select "Seven", from: :days
        click_on "Submit"
      end

      expect(current_path).to eq(popular_path)

      within(:css, "tr#article_0") do
        click_on "Save"
      end

      expect(current_path).to eq(root_path)
      expect(page).to have_css("table#unread tr", count: 1)
      expect(page).to_not have_css("table#unread tr", count: 5)
    end
  end
end
