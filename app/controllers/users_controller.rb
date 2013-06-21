class UsersController < ApplicationController
  def profile
    @locations = current_user.locations
    @markers = @locations.to_gmaps4rails
  end
end
