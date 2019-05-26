require 'rails_helper'

RSpec.describe "Registered User" do
  describe "can navigate to their saved_articles#index" do
    it "and can mark articles as read" do
      user = create(:user)
      create(:saved_article, user: user)
      create(:saved_article, user: user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit user_saved_articles_path(user)

      expect(page).to have_css("table#unread tr", count: 2)

      click_button "Read", match: :first

      expect(current_path).to eq(user_saved_articles_path(user))
      expect(page).to have_css("table#unread tr", count: 1)
      expect(page).to have_css("table#read tr", count: 1)
    end
  end
end
