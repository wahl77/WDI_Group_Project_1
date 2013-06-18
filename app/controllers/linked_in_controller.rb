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
    
    email = client.profile(:fields => ["email-address"])[:email_address]
    @user = User.find_by_email(email)
    if @user.nil? 
      @user = User.new
      @user.email = email
      @user.firstName = client.profile(:fields => ["first-name"])[:first_name]
      @user.lastName = client.profile(:fields => ["last-name"])[:last_name]
      binding.pry
      @user.save
    end
    
    session[:user_id] = @user.id
    redirect_to root_path   
  end
  
  def destroy
    session[:atoken] = nil
    session[:asecret] = nil
    redirect_to "/";
  end  
end
