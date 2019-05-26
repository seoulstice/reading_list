require 'rails_helper'

RSpec.describe "Registered User" do
  it "can access their own saved articles and delete them" do
    user = create(:user)
    create(:saved_article, user: user)
    create(:saved_article, user: user)
    page.set_rack_session(user_id: user.id)


    visit root_path

    expect(page).to have_css("table#unread tr", count: 2)

    click_button "Delete", match: :first

    expect(current_path).to eq(root_path)
    expect(page).to have_css("table#unread tr", count: 1)
  end
end
