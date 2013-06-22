class Message < ActiveRecord::Base
  belongs_to :user, inverse_of: :messages
  attr_accessible :content, :sender
end
