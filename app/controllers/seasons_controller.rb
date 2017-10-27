class SeasonsController < ApplicationController

  def index
  end

  def show
    @season = Season.create!(name: "Summer")
    render :show
  end

end
