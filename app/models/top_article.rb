class TopArticle
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
    if attributes[:multimedia].empty?
      @photo = "/assets/blank.png"
    else
      @photo = attributes[:multimedia][3][:url]
    end
  end

  def self.find_top(section)
    NytService.get_top_articles(section).map do |raw_article|
      TopArticle.new(raw_article)
    end
  end




end
