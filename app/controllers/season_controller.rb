class SeasonController < ApplicationController

  def index
  end

  def show
    #Create logic to detemine which season is given and set CSS and produce to aforementioned season
    Season.create!(name: "Fall")
    season = Season.last
    # season = Season.all
  end

end
