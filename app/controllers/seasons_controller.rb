class SeasonsController < ApplicationController

  def index
  end

  def show
    current_season = Season.create!(name: "Fall")

  end

end
