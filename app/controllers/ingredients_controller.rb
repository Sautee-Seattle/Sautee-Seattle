class IngredientsController < ApplicationController
  def show
    @ingredient = Ingredient.find(params[:id])
    @seasons_string = @ingredient.seasons.pluck(:name).join("|")
  end
end
