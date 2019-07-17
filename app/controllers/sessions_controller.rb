class SessionsController < ApplicationController

  def new

  end

  def create
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
        log_in(user)
        redirect_to root_path
        flash[:success] = "Welcome back to Reading List, #{user.username}!"
    else
        flash[:danger] = "Sorry, your login credentials did not work."
        render :new
    end
  end

    def destroy
        log_out
        redirect_to "/"
        flash[:danger] = "See you later!"
    end



end
