class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :require_authentication
  
  helper_method :current_user
   
  def current_user
    if session[:user_id]
      @user = User.find(session[:user_id])
    end
  end
  
  def require_authentication
    if current_user.nil?
      redirect_to root_path, :alert => "You must be log in."
    end
  end
end
