class SessionsController < ApplicationController
  
  skip_before_filter :require_authentication, only:[:new, :create]
  
  def new
  end
  
  def create
    user = User.find(params[:uun])
    if user && user.authenticate(params[:password])
      flash[:notice] = "You just logged in, welcome #{user.name}"
      redirect_to users_path
    else
      redirect_to sessions_path
    end
  end
  
  def destroy
    session[:user_id] = nil
    edirect_to root_path, :notice => "You are now logged out"
  end
end
