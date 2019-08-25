require 'rails_helper'

RSpec.describe "Registered User Top Articles Search" do
  it "allows a Registered User to look for top articles" do
    VCR.use_cassette("features/search/registered_top_spec") do
      user = create(:user)
      page.set_rack_session(user_id: user.id)

      page.visit root_path
      within(:css, "div#section") do
        select "Books", from: :section
        click_on "Submit"
      end
      
      expect(current_path).to eq(top_path)
      expect(page).to have_css("div.article") do
        with_tag("a", text: "Save")
      end

    end
  end
end
