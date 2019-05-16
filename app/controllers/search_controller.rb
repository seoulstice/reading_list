class SearchController < ApplicationController

  def index
    @articles = Article.find_all(params[:days])
  end


end
