class LocationsController < ApplicationController
  def new
    @location = Location.new
  end
  
  def create
    loc = Location.new(params[:location])
    current_user.locations << loc
    respond_to do |format|
      format.html 
      format.js
    end
  end
  
  def update
  end
  
  def destroy
    loc = Location.find(params[:location])
    loc.destroy
  end
  
  def show
  end
end
