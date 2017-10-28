class SeasonsController < ApplicationController

  def index
  end

  def show
    # @season = Season.find_by(name: "Spring")
    @season = Season.find(2)
  end

end
