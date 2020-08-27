class ProfilesController < ApplicationController

  before_action :set_user, only: [:show, :edit, :update]
    
    def index
      @users = policy_scope(User).where(residence_id: current_user.residence_id)
    end

    def show
      @user = User.find(params[:id])
      @chatroom_id = nil
          if Chatroom.where('guest_id = ? AND host_id = ?', current_user, @user).empty?
            @chatroom = Chatroom.where('guest_id = ? AND host_id = ?', @user, current_user)
            unless @chatroom.count == 0
              @chatroom_id= @chatroom.first.id
            end
          else
            @chatroom = Chatroom.where('guest_id = ? AND host_id = ?', current_user, @user)
            unless @chatroom.count == 0
              @chatroom_id= @chatroom.first.id
            end
          end
      authorize @user
    end
    
   
    def edit
    end
  

    def update
      if @user.update(user_params)
        redirect_to profile_path(@user)
      else
      render :edit
      end
      authorize @user
    end

    
    private 
    
    def user_params
      params.require(:user).permit(:description, :photo)
    end



    def set_user
      @user = User.find(params[:id])
      authorize @user
    end
  
end
