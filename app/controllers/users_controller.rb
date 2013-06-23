class UsersController < ApplicationController
  def profile
    @my_locations = current_user.my_locations
    @markers = @my_locations.to_gmaps4rails
    @my_likes = current_user.my_likes
    @my_matches = current_user.my_matches
    @users = current_user.get_users
  end
  
  def my_profile
    @ip = Geocoder.search("#{request.ip}")
    
    tmp = Location.new()
    tmp.name = "Current Location"
    tmp.is_ip = true
    
    @my_locations = current_user.my_locations
    ip_location = @my_locations.where("is_ip = ?", true).first
    
    if ip_location.nil?
      tmp.name = "Paris"
      current_user.locations << tmp
      tmp.latitude = @ip[0].data["latitude"]
      tmp.longitude = @ip[0].data["longitude"]
      tmp.name = "Current Location"
      tmp.save
    else
      ip_location.latitude = tmp.latitude
      ip_location.longitude = tmp.longitude
    end
    
    @my_locations = current_user.my_locations
    @markers = @my_locations.to_gmaps4rails
    @markers
    
  end
  
  def destroy
    current_user.destroy
    redirect_to home_path
  end
end
