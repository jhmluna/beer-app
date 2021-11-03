class OrdersController < ApplicationController
  def index
    @orders = policy_scope(Order.where(user_id: current_user))
  end

  def create
    @order = Order.new(order_params)
    @order.user = current_user
    @order.date = Time.now
    authorize @order

    if @order.save
      beer = Beer.find(order_params[:beer_id])
      if @order.quantity == 0 
        redirect_to beer_path(@order.beer_id), notice: 'Quantity must be greater than zero.'  
      elsif beer.quantity >= @order.quantity  
        beer.update(quantity: beer.quantity-@order.quantity)
        redirect_to orders_path, notice: 'Order was successfully created into the catalog.'
      else
        redirect_to beer_path(@order.beer_id), notice: 'Quantity not available.'  
      end  
    else
      redirect_to beer_path(@order.beer_id), notice: 'Order was not created'
    end
  
     

  end

  def order_params
    params.require(:order).permit(:quantity, :beer_id)
  end
end
