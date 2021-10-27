class BeersController < ApplicationController


  def index
    @beers = policy_scope(Beer)
  end
    
  def show
    # set_beer - Substituido pelo before_action
  end

end
