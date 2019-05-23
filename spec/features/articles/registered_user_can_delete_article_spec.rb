require 'rails_helper'

RSpec.describe "Registered User" do
  it "can access their own saved articles and delete them" do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    user.saved_articles.create()




  end
end
