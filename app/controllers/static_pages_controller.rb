class StaticPagesController < ApplicationController
  
  skip_before_filter :require_authentication
  
  def home
  end
  
end
