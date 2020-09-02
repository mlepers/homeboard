class ResidencesController < ApplicationController

    before_action :set_residence, only: [:show]

    def show
        @info_syndics = current_user.info_syndics.order("info_syndics.created_at DESC")
        @charge = Charge.find(current_user.charges.first.id)
        authorize @residence
    end

    private

    def set_residence
        @residence = Residence.find(params[:id])
    end

end
