class StaticPagesController < ApplicationController
  
  skip_before_filter :require_authentication, :only => [:home]
  
  
  def home
    session[:user_id] = nil
    session[:atoker] = nil
  end
  
  def settings
  end
  
  def menu
  end
  
end
