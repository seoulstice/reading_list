class SearchController < ApplicationController

  def popular
    @saved_article = SavedArticle.new
    articles = PopularArticle.find_popular(params[:days])
    @articles = ArticleDecorator.wrap(articles)
  end


  def top
    @saved_article = SavedArticle.new
    articles = TopArticle.find_top(params[:section])
    @articles = ArticleDecorator.wrap(articles)
  end


end
