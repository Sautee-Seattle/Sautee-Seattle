class SeasonsController < ApplicationController

  def index
    @home = true
  end

  def show
    season_name = params[:id]
    season_name[0] = season_name[0].upcase
    @season = Season.find_by_name(season_name)
  end

end
