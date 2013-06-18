class StaticPagesController < ApplicationController
  
  skip_before_filter :require_authentication, :only => [:home]
  
  
  def home
  end
  
end
