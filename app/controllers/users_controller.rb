class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update]

  def sale
    @sales = Order.where(beers: { user_id: current_user })
  end

  def show
    # set_user - Substituido pelo before_action
  end

  def edit
  end

  def update
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  private

  def set_user
    @user = User.find(params[:id])
    authorize @user
  end

  def user_params
    params.require(:user).permit(:full_name, :address)
  end
end
