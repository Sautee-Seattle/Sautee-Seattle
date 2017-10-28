class SeasonsController < ApplicationController

  def index
  end

  def show
    @season = Season.find_by_name(params[:id])
  end

end
