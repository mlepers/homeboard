class Message < ApplicationRecord
  belongs_to :chatroom
  belongs_to :user

  def seen!
    self.seen = true
  end

end
