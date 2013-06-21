class ApplicationController < ActionController::Base
  protect_from_forgery
  
  helper_method :current_user
  
  before_filter :require_authentication
  
  def current_user
    if (session[:atoken].nil? || session[:user_id].nil?)
      session[:atoken] = nil
      session[:user_id] = nil
    end
    if session[:atoken] && session[:user_id]
      client = LinkedIn::Client.new(ENV["LINKEDIN_API_KEY"], ENV["LINKEDIN_SECRET_KEY"])
      client.authorize_from_access(session[:atoken], session[:asecret])
      user = User.find(session[:user_id])
    end
  end
  
  def require_authentication
    if current_user.nil?
      redirect_to home_path, :alert => "You must be logged in."
    end
  end
end
