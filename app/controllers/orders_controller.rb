class OrdersController < ApplicationController

  def create

  charge = Charge.find(params[:charge_id])
  @order = Order.create!(charge: charge, amount: charge.price, state: 'pending', user: current_user)

  session = Stripe::Checkout::Session.create(
    payment_method_types: ['card'],
    line_items: [{
      name: "Condominium fees / #{current_user.first_name}",
      amount: charge.price_cents,
      currency: 'eur',
      quantity: 1
    }],
    success_url: order_url(@order),
    cancel_url: order_url(@order)
  )

  @order.update(checkout_session_id: session.id)
  redirect_to new_order_payment_path(@order)
  authorize @order
  end

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

end

