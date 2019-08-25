require 'rails_helper'

RSpec.describe 'Articles Search' do
  it 'allows any User to look for NYT articles' do
    VCR.use_cassette("features/search/popular_spec") do
      user = create(:user)
      page.set_rack_session(user_id: user.id)

      visit root_path

      expect(page).to have_select(:days, options: ["Last Day", "Last Seven Days", "Last Thirty Days"])
      within(:css, "div#popular") do
        select "Last Seven Days", from: :days
        click_on "Submit"
      end

      expect(current_path).to eq(popular_path)
      expect(page).to have_css("div.article", count: 20)
      expect(page).to_not have_css("div.article", count: 10)
      expect(page).to_not have_css("div.article", count: 30)
      expect(page).to have_css("div.article") do
        with_tag('a', text: "Save")
      end
    end
  end
end
