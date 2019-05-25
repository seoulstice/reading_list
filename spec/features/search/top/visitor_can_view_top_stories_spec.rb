require 'rails_helper'

RSpec.describe "Visitor Top Articles Search" do
  it "allows any User to look for top NYT articles" do
    VCR.use_cassette("features/search/top_spec") do
      visit root_path

      expect(page).to have_select(:section, options: ['Arts',
                                                      'Automobiles',
                                                      'Books',
                                                      'Business',
                                                      'Fashion',
                                                      'Food',
                                                      'Health',
                                                      'Home',
                                                      'Insider',
                                                      'Magazine',
                                                      'Movies',
                                                      'National',
                                                      'NY Region',
                                                      'Obituaries',
                                                      'Opinion',
                                                      'Politics',
                                                      'Real Estate',
                                                      'Science',
                                                      'Sports',
                                                      'Sunday Review',
                                                      'Technology',
                                                      'Theater',
                                                      'T Magazine',
                                                      'Travel',
                                                      'Upshot',
                                                      'World'])


        select "Food", from: :section
        click_on "Submit"

        expect(current_path).to eq(top_path)
        expect(page).to have_css("table#top tr", count: 20)
        expect(page).to_not have_css("table#popular tr", count: 10)
        expect(page).to have_css("tr#article_0") do
          without_tag("a", text: "Save")
        end
    end
  end
end