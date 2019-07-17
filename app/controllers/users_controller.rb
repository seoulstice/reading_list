class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.save
      log_in(@user)
      redirect_to root_path
      flash[:success] = "Welcome to Reading List!"
    else
      flash[:danger] = "Sorry, an account with that username already exists."
      render :new
    end
  end

    private

      def user_params
        params.require(:user).permit(:username, :password, :password_confirmation)
      end

end
