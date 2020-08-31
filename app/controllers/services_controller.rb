class ServicesController < ApplicationController

  before_action :set_service, only: [:show, :edit, :update, :destroy]

  def index
    @alert = current_user.info_syndics.where(category: "alert", seen: false).last
    if params[:query].present?
      @services = policy_scope(Service.search_by_title_and_description(params[:query]))
    else
      @services = policy_scope(Service).order(created_at: :desc)
    end
    if params[:category].present?
      @services = @services.where(category: params[:category])
    end
  end

  def show
    @comments = @service.comments
    @comment = Comment.new
  end

  def new
    @service = Service.new
    authorize @service
  end

  def create
    @service = Service.new(service_params)
    @service.user = current_user
    if @service.save
      redirect_to service_path(@service)
    else
      render :new
    end
    authorize @service
  end

  def edit
    authorize @service
  end

  def update
    if @service.update(service_params)
      redirect_to service_path(@service)
    else
      render :edit
    end
  end

  def destroy
    @service.destroy
    redirect_to services_path
  end

  private

  def set_service
    @service = Service.find(params[:id])
    authorize @service
  end

  def service_params
    params.require(:service).permit(:title, :description, :start_at, :end_at, :category, :user, photos: [])
  end

end
