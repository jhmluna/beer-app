class BeersController < ApplicationController
  before_action :set_beer, only: %i[show edit update destroy]
  skip_before_action :authenticate_user!, only: :index

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

  def edit
  end

  def update
    @beer.update(beer_params)
    redirect_to beer_path(@beer)
  end

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

  private

  def set_beer
    @beer = Beer.find(params[:id])
    authorize @beer
  end

  def beer_params
    params.require(:beer).permit(:name, :category, :price, :description, :quantity, :photo)
  end
end
