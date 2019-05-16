class SearchController < ApplicationController

  def index
    articles = Article.find_all(params[:days])
    @articles = ArticleDecorator.decorate_collection(articles)
  end


end
