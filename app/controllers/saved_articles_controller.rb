class SavedArticlesController < ApplicationController
  before_action :set_user, only: [:create, :index, :destroy, :update]

  def create
    @saved_article = @user.saved_articles.new(saved_article_params.merge(read: false))
    if @saved_article.save
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  def destroy
    saved_article = SavedArticle.find(params[:id])
    saved_article.destroy
    redirect_to root_path
  end

  def update
    saved_article = SavedArticle.find(params[:id])
    saved_article.update(saved_article_params)
    redirect_to root_path
  end


end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def saved_article_params
    params.require(:saved_article).permit(:abstract, :authors, :photo, :published_date, :section, :title, :url, :read)
  end
