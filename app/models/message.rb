class Message < ActiveRecord::Base
  belongs_to :sender, inverse_of: :messages
  belongs_to :receiver, inverse_of: :messages
  attr_accessible :content, :sender
end
