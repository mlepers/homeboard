class Chatroom < ApplicationRecord
  belongs_to :guest, class_name: "User"
  belongs_to :host, class_name: "User"
  has_many :messages
  
  def users
    return [self.guest, self.host]
  end

end
