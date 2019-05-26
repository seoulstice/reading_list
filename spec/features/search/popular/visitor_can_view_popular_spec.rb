require 'rails_helper'

RSpec.describe 'Visitor Popular Articles Search' do
  it 'allows any User to look for popular NYT articles' do
    VCR.use_cassette("features/search/popular_spec") do
      visit root_path

      expect(page).to have_select(:days, options: ['One', 'Seven', 'Thirty'])

      within(:css, "div#popular_select") do
        select "Seven", from: :days
        click_on "Submit"
      end

      expect(current_path).to eq(popular_path)
      expect(page).to have_css("table#popular tr", count: 20)
      expect(page).to_not have_css("table#popular tr", count: 10)
      expect(page).to have_css("tr#article_0") do
        without_tag('a', text: "Save")
      end
    end
  end
end
