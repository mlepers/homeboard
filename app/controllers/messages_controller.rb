class MessagesController < ApplicationController

  skip_before_action :verify_authenticity_token, :only => [:create]

  def create
    @chatroom = Chatroom.find(params[:chatroom_id])
    @messages = @chatroom.messages
    @message = Message.new(message_params)
    @message.chatroom = @chatroom
    @message.user = current_user
    if current_user == @chatroom.guest 
      @other = @chatroom.guest
    else
      @other = @chatroom.host
    end
    if @message.save!
      ChatroomChannel.broadcast_to(
        @chatroom,
        render_to_string(partial: "messages/broadcasted_message", locals: {message: @message})
      )
      redirect_to chatroom_path(@chatroom, anchor: "message-#{@message.id}")
    else
      render "chatrooms/show"
    end
    authorize @message
  end

  private

  def message_params
    params.require(:message).permit(:content, :chatroom, :user)
  end
  
end
