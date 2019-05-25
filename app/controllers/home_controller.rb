class HomeController < ApplicationController
  before_action :set_user, only: [:index]


   def index
     if logged_in?
       @unread_saved_articles = @user.saved_articles.where(read: false)
       @read_saved_articles = @user.saved_articles.where(read: true)
     end
   end

   private

   def set_user
     @user = @current_user ||= User.find_by(id: session[:user_id])
   end


end
