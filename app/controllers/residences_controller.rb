class ResidencesController < ApplicationController

    before_action :set_residence, only: [:show]
   
    def show  
    end

    private

    def set_bike_offer
        @residence = Residence.find(params[:id])
    end

end
