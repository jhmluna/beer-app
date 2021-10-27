class UsersController < ApplicationController
  before_action :set_user, only: %i[show]

  def show
    # set_user - Substituido pelo before_action
  end

  private

  def set_user
    @user = User.find(params[:id])
    authorize @user
  end
end
