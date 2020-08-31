class ProfilesController < ApplicationController

  before_action :set_user, only: [:show, :edit, :update]
    
    def index
      if params[:query].present?
        @users = policy_scope(User.search_by_first_name_last_name_and_pseudo(params[:query])).where(residence_id: current_user.residence_id)
      else
        @users = policy_scope(User).order(last_name: :desc).where(residence_id: current_user.residence_id)
      end
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
