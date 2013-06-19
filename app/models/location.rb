class Location < ActiveRecord::Base
  attr_accessible :latitude, :longtitute
  
  belongs_to :user, inverse_of: :locations
  
  validates :latitude, numericality:true
  validates :longitude, numericality:true
end
