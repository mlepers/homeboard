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

  def new
    @chatroom = Chatroom.new
    authorize @chatroom
    @users = User.where.not(id: current_user.id)
  end

  def create
    @chatroom = Chatroom.new
    p chatroom_params[:guest]
    @chatroom.guest = User.find(chatroom_params[:guest])
    @chatroom.host = current_user
    authorize @chatroom

    if @chatroom.save!
      redirect_to chatroom_path(@chatroom)
    else
      render 'form'
    end
  
  end

  private

  def chatroom_params
    params.require(:chatroom).permit(:guest)
  end

end
