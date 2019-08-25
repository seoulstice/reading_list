require 'rails_helper'

RSpec.describe "Registered User" do
  it "can access their own saved articles and delete them" do
    user = create(:user)
    create(:saved_article, user: user)
    create(:saved_article, user: user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit user_saved_articles_path(user)

    expect(page).to have_css("div.article", count: 2)
    
    first('.btn').click

    expect(current_path).to eq(user_saved_articles_path(user))
    expect(page).to have_css("div.article", count: 1)
  end
end
