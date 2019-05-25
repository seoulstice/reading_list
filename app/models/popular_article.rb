class PopularArticle
  attr_reader :nyt_id,
              :url,
              :title,
              :byline,
              :abstract,
              :section,
              :published_date,
              :photo

  def initialize(attributes)
    @nyt_id = attributes[:id]
    @url = attributes[:url]
    @title = attributes[:title]
    @byline = attributes[:byline]
    @abstract = attributes[:abstract]
    @section = attributes[:section]
    @published_date = attributes[:published_date]
    @photo = attributes[:media][0][:"media-metadata"][0][:url]
  end

  def self.find_popular(days)
    NytService.get_popular_articles(days).map do |raw_article|
      PopularArticle.new(raw_article)
    end
  end

end
