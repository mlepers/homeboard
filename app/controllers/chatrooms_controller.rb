class ChatroomsController < ApplicationController
  before_action :set_title

  def index
    @chatrooms = policy_scope(Chatroom).includes(:messages).order("messages.created_at DESC")
  end

  def show
    @chatroom = Chatroom.find(params[:id])
    @chatroom.mark_all_messages_recieved_as_seen(current_user)
    @messages = @chatroom.messages.sort_by &:created_at
    @message = Message.new
    if current_user == @chatroom.guest 
      @other = @chatroom.host
    else
      @other = @chatroom.guest
    end
    authorize @chatroom
    unread_message
  end

  def new
    @chatroom = Chatroom.new
    authorize @chatroom
    @users = User.where.not(id: current_user.id)
  end

  def create
    @chatroom = Chatroom.new
    guest = User.find(chatroom_params[:guest])
    authorize @chatroom
    if Chatroom.where('guest_id = ? AND host_id = ?', guest, current_user).empty? && Chatroom.where('guest_id = ? AND host_id = ?', current_user, guest).empty? 

      @chatroom.guest = User.find(chatroom_params[:guest])
      @chatroom.host = current_user
      

      if @chatroom.save!
        redirect_to chatroom_path(@chatroom)
      else
        render 'form'
      end

    else  
      if Chatroom.where('guest_id = ? AND host_id = ?', current_user, guest).empty?
        @chatroom = Chatroom.where('guest_id = ? AND host_id = ?', guest, current_user)
        redirect_to chatroom_path(@chatroom.first.id)
      else
        @chatroom = Chatroom.where('guest_id = ? AND host_id = ?', current_user, guest)
        redirect_to chatroom_path(@chatroom.first.id)
      end
      
    end
  

  end

  private

  def chatroom_params
    params.require(:chatroom).permit(:guest)
  end

  def set_title
    @title = "Message"
  end
end
