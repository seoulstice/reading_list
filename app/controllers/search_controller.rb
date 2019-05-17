class SearchController < ApplicationController

  def popular
    @saved_article = SavedArticle.new
    articles = Article.find_all(params[:days])
    @articles = ArticleDecorator.decorate_collection(articles)
  end


end
