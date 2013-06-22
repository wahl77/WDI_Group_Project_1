class User < ActiveRecord::Base
  
  # Does not have any
  # attr_accessible :age, :gender, :uun, :password, :password_confirmation
    
  has_many :locations, inverse_of: :user, dependent: :destroy
  has_many :likes, inverse_of: :user, dependent: :destroy
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
  
  def my_locations
    self.locations
  end
  
  def user_locations 
    self.locations.map{|location| location.name}.join(", ")
  end
  
  # This is a list of people I who are around me
  def get_users(range=50)
    my_locations = self.my_locations
    users = []
    people_liked = my_likes
    my_locations.each do |location| 
      friend_locations = Location.near(location, range, :order => :distance)
      friend_locations.each do |friend_location|
        if (! users.include? friend_location.user) && (! people_liked.include? friend_location.user) && (friend_location.user != self)
          users << friend_location.user
        end
      end
    end
    return users
  end
  
  def my_likes
    my_likes = []
    Like.where('user_id = ?', self.id).each do |friend|
      my_likes << User.find(friend.user_who_is_liked)
    end
    return my_likes
  end
  
  # Gets a list of users who you like and who like you
  def my_matches
    matches = []
    my_likes = my_likes()
    my_likes.each do |friend|
      if is_match? friend
        matches << User.find(friend.id)
      end
    end
    return matches
  end
  
  
  # find if current user object is a reciprocal match with someone else
  # returns a boolean
  def is_match?(user2)
    matches = []
    my_likes = my_likes();
    Like.where('user_id = ?', user2.id).each do |friend|
      
      return true if friend.user_who_is_liked == self.id 
    end
    return false
      
  end
  
  
  
  
  
  
  
  
  
end
