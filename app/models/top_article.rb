class TopArticle
  attr_reader :url,
              :title,
              :byline,
              :abstract,
              :section,
              :published_date,
              :photo

  def initialize(attributes)
    @url = attributes[:url]
    @title = attributes[:title]
    @byline = attributes[:byline]
    @abstract = attributes[:abstract]
    @section = attributes[:section]
    @published_date = attributes[:published_date]
    if attributes[:multimedia].empty?
      @photo = "https://static01.nyt.com/images/2019/06/12/arts/12thrones-3/12thrones-3-mediumThreeByTwo210-v3.jpg"
    else
      @photo = attributes[:multimedia][3][:url]
    end
  end

  def self.find_top(section)
    NytService.get_top_articles(section).map do |raw_article|
      # binding.pry
      TopArticle.new(raw_article)
    end
  end




end
