class Like < ActiveRecord::Base
  belongs_to :user
  attr_accessible :user_who_is_liked
end
