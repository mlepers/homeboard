class ResidencesController < ApplicationController

    before_action :set_residence, only: [:show]

    def show
        @info_syndics = current_user.info_syndics.order("info_syndics.created_at DESC")
        if (@condition = current_user.charges.first)
          @charge = Charge.find(current_user.charges.first.id)
          if @charge.orders.last
            if @charge.orders.last.state == "pending"
              @order = @charge.orders.last
            end
          end
        end
        authorize @residence
        @title = "Copro"
    end

    private

    def set_residence
        @residence = Residence.find(params[:id])
    end

end
