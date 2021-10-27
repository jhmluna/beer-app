class OrdersController < ApplicationController
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

   def order_params
    params.require(:beer).permit(:date)
  end

end
