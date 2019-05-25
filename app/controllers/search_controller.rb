class SearchController < ApplicationController

  def popular
    @saved_article = SavedArticle.new
    articles = PopularArticle.find_popular(params[:days])
    @articles = ArticleDecorator.decorate_collection(articles)
  end

  def top
    articles = TopArticle.find_top(params[:section])
    @articles = ArticleDecorator.decorate_collection(articles)
  end


end
