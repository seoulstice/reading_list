require 'rails_helper'

RSpec.describe "Registered User" do
  it "can only access their own saved articles" do
    user1 = create(:user)
    user2 = create(:user)
    saved_article_1 = create(:saved_article, user: user1)
    saved_article_2 = create(:saved_article, user: user1)
    saved_article_3 = create(:saved_article, user: user2)
    page.set_rack_session(user_id: user1.id)

    visit root_path

    expect(page).to have_link(saved_article_1.title)
    expect(page).to have_link(saved_article_2.title)
    expect(page).to_not have_link(saved_article_3.title)
  end
end
