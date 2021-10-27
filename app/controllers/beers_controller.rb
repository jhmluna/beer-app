class BeersController < ApplicationController
  before_action :set_beer, only: %i[show edit update destroy]

  def destroy
    @beer.destroy
    redirect_to beers_url, notice: 'Beer has been removed.'
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
