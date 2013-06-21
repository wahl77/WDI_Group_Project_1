class UsersController < ApplicationController
  def profile
    @my_locations = current_user.my_locations
    @markers = @my_locations.to_gmaps4rails
    @my_likes = current_user.my_likes
    
    @users = current_user.get_users
  end
  
  def my_profile
    @my_locations = current_user.my_locations
    @markers = @my_locations.to_gmaps4rails
  end
end
