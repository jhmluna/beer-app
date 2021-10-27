class OrdersController < ApplicationController

  def index
    @orders = Order.where(user_id: current_user)
  end
  
  def new
      @order = Order.new
      authorize @order
  end
    
  def create
    @order = Order.new(order_params)
    @order.user = current_user
    authorize @order
  
    if @order.save
      redirect_to @order, notice: 'Order was successfully created into the catalog.'
    else
      render :new
    end
  end
  
  private

  def order_params
    params.require(:beer).permit(:date)
  end
end
