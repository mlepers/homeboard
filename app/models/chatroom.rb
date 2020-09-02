class Chatroom < ApplicationRecord
  belongs_to :guest, class_name: "User"
  belongs_to :host, class_name: "User"
  has_many :messages
  
  def users
    return [self.guest, self.host]
  end

  def nb_of_unseen_messages(current_user)
    n = 0 
    self.messages.each do |message|
      if message.seen == false && message.user != current_user
        n+=1
      end
    end
    return n
  end

  def mark_all_messages_recieved_as_seen(current_user)
    self.messages.each do |message|
      unless message.user == current_user
        message.seen!
        message.save
      end
    end
  end


end
