class InfoSyndicsController < ApplicationController

  def new
    @info_syndic = InfoSyndic.new
    authorize @info_syndic
  end

  def create
    @residence = current_user.residence
    @residence.users.each do |user|
      @info_syndic = InfoSyndic.new(info_syndic_params)
      @info_syndic.residence = @residence
      @info_syndic.user = user
      @info_syndic.save
    end
    redirect_to residence_path(@info_syndic.residence)
    authorize @info_syndic
  end

  def update
    @info_syndic = InfoSyndic.find(params[:id])
    authorize @info_syndic
    @info_syndic.seen!
    @info_syndic.save
    redirect_to services_path
    end

  private

  def info_syndic_params
    params.require(:info_syndic).permit(:title, :content, :category, :seen, :residence, :user, :file)
  end
end
