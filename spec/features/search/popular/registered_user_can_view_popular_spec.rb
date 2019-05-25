require 'rails_helper'

RSpec.describe 'Articles Search' do
  it 'allows any User to look for NYT articles' do
    VCR.use_cassette("features/search/popular_spec") do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit root_path

      expect(page).to have_select(:days, options: ['One', 'Seven', 'Thirty'])

      select "Seven", from: :days
      click_on "Submit"

      expect(current_path).to eq(popular_path)
      expect(page).to have_css("table#popular tr", count: 20)
      expect(page).to_not have_css("table#popular tr", count: 10)
      expect(page).to have_css("tr#article_0") do
        with_tag('a', text: "Save")
      end
    end
  end
end
