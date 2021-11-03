class OrdersController < ApplicationController
  before_action :set_query, only: %i[index]

  def index
    @orders = policy_scope(Order.where(user_id: current_user))
  end

  def create
    @order = Order.new
    @order.user = current_user
    @order.date = Time.now
    @order.beer_id = params[:beer_id]
    authorize @order

    if @order.save
      redirect_to orders_path, notice: 'Order was successfully created into the catalog.'
    else
      redirect_to beer_path(@order.beer_id), notice: 'Order was not created'
    end
  end
end
