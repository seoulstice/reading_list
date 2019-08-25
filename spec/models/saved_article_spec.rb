require 'rails_helper'

RSpec.describe SavedArticle, type: :model do 
  describe 'validations' do
    it {should validate_presence_of(:authors)}
    it {should validate_presence_of(:photo)}
    it {should validate_presence_of(:title)}
    it {should validate_presence_of(:url)}
    it {should validate_presence_of(:user_id)}
  end
end