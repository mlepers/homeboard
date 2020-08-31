class InfoSyndicsController < ApplicationController

  def new
    @info_syndic = InfoSyndic.new
    authorize @info_syndic
  end

  def create
    @info_syndic = InfoSyndic.new(info_syndic_params)
    @info_syndic.residence = current_user.residence
    if @info_syndic.save
      redirect_to residence_path(@info_syndic.residence)
    else
      render :new
    end
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
    params.require(:info_syndic).permit(:title, :content, :category, :seen, :residence)
  end
end
