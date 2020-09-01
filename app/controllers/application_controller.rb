class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :unread_message
  after_action :live_message

  include Pundit

  # Pundit: white-list approach.
  after_action :verify_authorized, except: :index, unless: :skip_pundit?
  after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

  # Uncomment when you *really understand* Pundit!
  # rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  # def user_not_authorized
  #   flash[:alert] = "You are not authorized to perform this action."
  #   redirect_to(root_path)
  # end

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:pseudo, :email, :first_name, :last_name, :description, :residence_id])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:pseudo, :email, :first_name, :last_name, :description, :residence_id])
  end

  def live_message
    if request.referer
      if request.referer.split('/').include? "chatrooms"
        unless request.referer.split('/').last == "chatrooms"
          chatroom_number = request.referer.split('/').last.to_i
          last_message = Chatroom.find(chatroom_number).messages.last
          unless last_message.user_id == current_user.id
            last_message.seen!
            last_message.save
          end
        end
      end
    end
  end

  def unread_message
    unless params[:controller].include? "devise"
      x = 0
      y = 0
      @unread_message = false

      if Chatroom.where(guest_id: current_user.id).count > 0
        Chatroom.where(guest_id: current_user.id).each do |chatroom|
          x += chatroom.nb_of_unseen_messages(current_user)
        end
      end

      if Chatroom.where(host_id: current_user.id).count > 0
        Chatroom.where(host_id: current_user.id).each do |chatroom|
          y += chatroom.nb_of_unseen_messages(current_user)
        end
      end

      if x + y > 0
        @unread_message = true
      end

      return @unread_message
    end
  end

  private

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end
end
