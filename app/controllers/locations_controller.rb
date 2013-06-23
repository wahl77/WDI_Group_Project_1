class LocationsController < ApplicationController
  def new
    @location = Location.new
    @range = @location.avail_range.map{|y| ["#{y} miles", y]}
  end
  
  def create
    @location = Location.new(params[:location])
    
    # No more than 5 locations per user
    if current_user.locations.length >= 5
      current_user.locations.first.destroy
    end
    current_user.locations << @location
    
   
    
    redirect_to "/edit_locations" 
  end
  
  def update
  end
  
  def destroy
    loc = Location.find(params[:id])
    loc.destroy
    redirect_to "/edit_locations" 
  end
  
  def show

  end
  
  def edit
    @locations = current_user.locations.reverse()
    @location = Location.new
    @range = @location.avail_range.map{|y| ["#{y} miles", y]}
    @markers = current_user.locations.to_gmaps4rails
  end
end
