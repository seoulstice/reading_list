require 'rails_helper'

RSpec.describe NytService do
  describe 'Popular Articles' do
    search_params = {}
    it 'gets most popular articles in last 1 day' do
      VCR.use_cassette("services/nyt_service_spec/popular") do
        popular_articles = NytService.new("1").get_popular_articles

        expect(popular_articles).to be_an(Array)
        expect(popular_articles.count).to eq(20)
      end
    end

    it 'gets articles by section' do
      VCR.use_cassette("services/nyt_service_spec/section") do
        section_articles = NytService.new("arts").get_top_articles

        expect(section_articles).to be_an(Array)
      end
    end

  end



  
end