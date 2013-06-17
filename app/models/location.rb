class Location < ActiveRecord::Base
  attr_accessible :latitude, :longtitute
  
  belongs_to :user, inverse_of: :locations
  
  validates_numericality_of :latitude
  validates_numericality_of :longitute
  
end
