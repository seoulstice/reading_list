require 'rails_helper'

RSpec.describe "Registered User" do
  it "can only access their own saved articles" do
    user1 = create(:user)
    user2 = create(:user)
    saved_article_1 = create(:saved_article, user: user1)
    saved_article_2 = create(:saved_article, user: user1)
    saved_article_3 = create(:saved_article, user: user2)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user1)

    visit user_saved_articles_path(user1)

    expect(page).to have_link(saved_article_1.title)
    expect(page).to have_link(saved_article_2.title)
    expect(page).to_not have_link(saved_article_3.title)
  end
end
