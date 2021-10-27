class BeersController < ApplicationController
  def new
    @beer = Beer.new
    authorize @beer
  end

  def create
    @beer = Beer.new(beer_params)
    @beer.user = current_user
    authorize @beer

    if @beer.save
      redirect_to @beer, notice: 'Beer was successfully created into the catalog.'
    else
      render :new
    end
  end
end
