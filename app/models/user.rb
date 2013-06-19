class User < ActiveRecord::Base
  
  # Does not have any
  # attr_accessible :age, :gender, :uun, :password, :password_confirmation
    
  has_many :locations, inverse_of: :user, dependent: :destroy
  has_and_belongs_to_many :tags
  
  #validates :uun, 
  #  length:{minimum:2, message:"must have at least %{count} characters"},
  #  uniqueness:true, {message:"Sorry, name already taken"},
  #  presence:true, {message:"You need a username"}
  #  
  #validate :age,
  #  numericality:true, {only:integer:true, greater_than_or_equal_to:0, message:"Invalid age"}
    
    
  
  #def uun=(value)
  #  write_attribute :uun, 
  #end
  
  def user_locations 
    self.locations.map{|location| location}.join(", ")
  end
  
  def find_match
  end
  
  def is_match
  end
end
