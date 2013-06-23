class Location < ActiveRecord::Base
  attr_accessible :latitude, :longtitute, :name, :range
  
  belongs_to :user, inverse_of: :locations
  
  geocoded_by :name
  after_validation :geocode, :if => :name_changed?
  
  acts_as_gmappable
  
  def avail_range
    return [1, 2, 5, 10, 30, 50]
  end
  
  def gmaps4rails_address 
    name
  end
  
  def my_ip
    request.ip
  end
end
