class SessionsController < ApplicationController
  
  skip_before_filter :require_authentication, only:[:new, :create]
  
  def new
  end
  
  def create
    user = User.find_by_uun(params[:uun])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:notice] = "You just logged in, welcome #{user.uun}"
      redirect_to root_path
    else
      flash.now[:alert] = "Username or password not found"
      render :new
    end
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to root_path, :notice => "You are now logged out"
  end
end
