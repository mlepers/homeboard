class ResidencesController < ApplicationController

    before_action :set_residence, only: [:show]
   
    def show  
        authorize @residence
    end

    private

    def set_residence
        @residence = Residence.find(params[:id])
    end

end
