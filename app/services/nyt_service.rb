class NytService
  attr_reader :params
  def initialize(params)
    @params = params
    @conn = Faraday.new(url: "https://api.nytimes.com") do |faraday|
      faraday.params["api-key"] = ENV["nyt_api_key"]
      faraday.adapter Faraday.default_adapter
    end
  end

  def self.get_popular_articles(params)
    new(params).get_popular_articles
  end

  def get_popular_articles
    get_url("/svc/mostpopular/v2/viewed/#{params}.json")
  end

  def self.get_top_articles(params)
    new(params).get_top_articles
  end

  def get_top_articles
    get_url("/svc/topstories/v2/#{params}.json")
  end

  def get_url(url)
    response = @conn.get(url)
    JSON.parse(response.body, symbolize_names: true)[:results]
  end

end
