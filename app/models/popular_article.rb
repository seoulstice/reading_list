class PopularArticle
  attr_reader :url,
              :title,
              :byline,
              :abstract,
              :photo

  def initialize(attributes)
    @url = attributes[:url]
    @title = attributes[:title]
    @byline = attributes[:byline]
    @abstract = attributes[:abstract]
    @photo = attributes[:media][0][:"media-metadata"][2][:url]
  end

  def self.find_popular(days)
    NytService.get_popular_articles(days).map do |raw_article|
      PopularArticle.new(raw_article)
    end
  end

end
