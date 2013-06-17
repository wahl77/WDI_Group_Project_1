class User < ActiveRecord::Base
  attr_accessible :age, :gender, :uun
    
  has_many :locations, inverse_of: :user, dependent: :destroy
  has_and_belongs_to_many :tags
  
  validates_length_of :uun, minimum:5, too_short:"must have at least %{count} characters" 
  validates_uniqueness_of :uun, message:"Sorry, name already taken" 
  validates_presence_of :uun, message:"You need a username"
    
  validates_numericality_of :age, greater_than_or_equal_to:0 
  
  def uun=(value)
    write_attribute :uun, value.downcase
  end
  
  def find_match
  end
  
  def is_match
  end
end
