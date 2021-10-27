class BeersController < ApplicationController
  before_action :set_beer, only: %i[show edit update destroy]

  def index
    @beers = policy_scope(Beer)
  end
    
  def show
    # set_beer - Substituido pelo before_action
  end
  
  def destroy
    @beer.destroy
    redirect_to beers_url, notice: 'Beer has been removed.'
  end
  
  def edit; end

  def update
    @beer.update(beer_params)
    redirect_to beer_path(@beer)
  end  

  private

  def set_beer
    @beer = Beer.find(params[:id])
    authorize @beer
  end

  def beer_params
    params.require(:beer).permit(:name, :category, :price, :description)
  end
end
