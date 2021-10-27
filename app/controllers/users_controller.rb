class UsersController < ApplicationController
  def edit
  end

  def update
    @user.update(user_params)
    redirect_to user_path(@user)
  end
end
