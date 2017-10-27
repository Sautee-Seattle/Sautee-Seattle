class SeasonsController < ApplicationController

  def index
  end

  def show
    @season = Season.create!(name: "Spring")
    render :show
  end

end
