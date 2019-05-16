require 'rails_helper'

RSpec.describe 'Articles Search' do
  it 'allows any User to look for NYT articles' do
    visit root_path
    select "Seven", from: :days
    click_on "Submit"

    expect(current_path).to be(search_path)
  end
end
