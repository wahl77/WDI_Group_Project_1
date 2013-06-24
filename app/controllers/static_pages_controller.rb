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
  
  def about
    @feedback = Feedback.new
  end
  
  def create
    feedback = Feedback.new(:content => params[:feedback][:content])
    current_user.feedbacks << feedback
  end
end
