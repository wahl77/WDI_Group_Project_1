class Sender < User
  has_many :messages, dependent: :destroy
  # attr_accessible :title, :body
end
