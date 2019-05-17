class Article
  attr_reader :url,
              :title,
              :byline,
              :abstract,
              :section,
              :published_date,
              :photo

  def initialize(attributes = {})
    @url = attributes[:url]
    @title = attributes[:title]
    @byline = attributes[:byline]
    @abstract = attributes[:abstract]
    @section = attributes[:section]
    @published_date = attributes[:published_date]
    @photo = attributes[:media][0][:"media-metadata"][1][:url]
  end

  def self.find_all(days)
    NytService.get_articles(days).map do |raw_article|
      Article.new(raw_article)
    end
  end




end