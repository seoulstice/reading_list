class NytService
  attr_reader :days
  def initialize(days)
    @days = days
    @conn = Faraday.new(url: "https://api.nytimes.com") do |faraday|
      faraday.params["api-key"] = ENV["nyt_api_key"]
      faraday.adapter Faraday.default_adapter
    end
  end

  def self.get_articles(days)
    new(days).get_articles
  end

  def get_articles
    get_url("/svc/mostpopular/v2/viewed/#{days}.json")
  end

  def get_url(url)
    response = @conn.get(url)
    JSON.parse(response.body, symbolize_names: true)[:results]
  end

end
