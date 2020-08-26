class ChatroomsController < ApplicationController

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
