class TopArticle
  attr_reader :nyt_id,
              :url,
              :title,
              :byline,
              :abstract,
              :section,
              :published_date,
              :photo

  def initialize(attributes = {})
    @nyt_id = attributes[:id]
    @url = attributes[:url]
    @title = attributes[:title]
    @byline = attributes[:byline]
    @abstract = attributes[:abstract]
    @section = attributes[:section]
    @published_date = attributes[:published_date]
    @photo = attributes[:multimedia][3][:url]
  end

  def self.find_top(section)
    NytService.get_top_articles(section).map do |raw_article|
      TopArticle.new(raw_article)
    end
  end




end
