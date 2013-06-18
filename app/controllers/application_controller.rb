class ApplicationController < ActionController::Base
  protect_from_forgery
  
  helper_method :current_user
  
  before_filter :require_authentication
  
  def current_user
    if session[:atoken]
      client = LinkedIn::Client.new("bg6dl48a8njs", "BxdMXmqVb5NnkLdc")
      client.authorize_from_access(session[:atoken], session[:asecret])
      @profile = client.profile
    end
  end
  
  def require_authentication
    if current_user.nil?
      redirect_to root_path, :alert => "You must be logged in."
    end
  end
end
