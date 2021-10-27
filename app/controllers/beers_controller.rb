class BeersController < ApplicationController
  def edit; end

  def update
    @beer.update(task_params)
    redirect_to beer_path(@task)
  end
end
