class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  include SelectHelper
  include ViewHelper
  helper_method :current_user

end
