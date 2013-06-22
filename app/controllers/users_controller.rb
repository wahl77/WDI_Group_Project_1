class UsersController < ApplicationController
  def profile
    @my_locations = current_user.my_locations
    @markers = @my_locations.to_gmaps4rails
    @my_likes = current_user.my_likes
    @my_matches = current_user.my_matches
    @users = current_user.get_users
  end
  
  def my_profile
    @my_locations = current_user.my_locations
    @markers = @my_locations.to_gmaps4rails
  end
  
  def destroy
    current_user.destroy
    redirect_to home_path
  end
end
