require 'rails_helper'

RSpec.describe "Visitor Top Articles Search" do
  it "allows any User to look for top NYT articles" do
    VCR.use_cassette("features/search/visitor_top_spec") do
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
        within(:css, "div#top_select") do
          select "Theater", from: :section
          click_on "Submit"
        end

        expect(current_path).to eq(top_path)
        expect(page).to have_css("tr#article_0") do
          without_tag("a", text: "Save")
        end
    end
  end
end
