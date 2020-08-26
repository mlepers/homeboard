class ChatroomsController < ApplicationController

  def index
    @chatrooms = policy_scope(Chatroom).where('guest_id = ? OR host_id = ?', current_user, current_user)
  end

  def show 
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
    if current_user == @chatroom.guest 
      @other = @chatroom.host
    else
      @other = @chatroom.guest
    end
    authorize @chatroom
  end

end
