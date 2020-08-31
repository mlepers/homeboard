class Chatroom < ApplicationRecord
  belongs_to :guest, class_name: "User"
  belongs_to :host, class_name: "User"
  has_many :messages
  
  def users
    return [self.guest, self.host]
  end

  def nb_of_unseen_messages
    n = 0 
    self.messages.each do |message|
      if message.seen == false
        n+=1
      end
    end
    return n
  end

  def mark_all_messages_as_seen
    self.messages.each do |message|
      message.seen!
    end
  end


end
