require 'rails_helper'

RSpec.describe 'Articles Search' do
  it 'allows any User to look for NYT articles' do
    VCR.use_cassette("features/search/index_spec") do
      visit root_path
      select "Seven", from: :days
      click_on "Submit"

      expect(current_path).to eq(search_path)
      expect(page).to have_content("20")
    end
  end
end
