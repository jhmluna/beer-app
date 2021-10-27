class UsersController < ApplicationController

  def sale
    @sales = Order.beer.where(user_id: current_user)
  end
end
