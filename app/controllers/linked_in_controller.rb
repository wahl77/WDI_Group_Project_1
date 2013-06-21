class LinkedInController < ApplicationController
  
  skip_before_filter :require_authentication, :only => [:index, :callback, :destroy]
  
  def index
    # get your api keys at https://www.linkedin.com/secure/developer
    client = LinkedIn::Client.new(ENV["LINKEDIN_API_KEY"], ENV["LINKEDIN_SECRET_KEY"])
    request_token = client.request_token(:oauth_callback =>
                                      "http://#{request.host_with_port}/linked_in/callback")
    session[:rtoken] = request_token.token
    session[:rsecret] = request_token.secret
  
    redirect_to client.request_token.authorize_url
  
  end
  
  def callback
    client = LinkedIn::Client.new(ENV["LINKEDIN_API_KEY"], ENV["LINKEDIN_SECRET_KEY"])
    if session[:atoken].nil?
      pin = params[:oauth_verifier]
      atoken, asecret = client.authorize_from_request(session[:rtoken], session[:rsecret], pin)
      session[:atoken] = atoken
      session[:asecret] = asecret
    else
      client.authorize_from_access(session[:atoken], session[:asecret])
    end
    
    data = client.profile(:fields => ["first-name", "last-name", "email-address", "headline", "location"])
    #binding.pry
    @user = User.find_by_email(data[:email_address])
    if @user.nil? 
      #binding.pry
      @user = User.new
      @user.email = data[:email_address]
      @user.firstName = data[:first_name]
      @user.lastName = data[:last_name]
      location = Location.new
      location.name = data[:location].name
      @user.save
      @user.locations << location
      
    end
    
    session[:user_id] = @user.id
    redirect_to root_path   
  end
  
  def destroy
    session[:atoken] = nil
    session[:asecret] = nil
    session[:user_id] = nil
    redirect_to home_path;
  end  
end
