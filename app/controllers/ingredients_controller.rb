class IngredientsController < ApplicationController
  def show
    @ingredient = Ingredient.find(params[:id])
    @recipes = @ingredient.recipes.sample(5)
    @locations = @ingredient.locations.sample(5)
    @seasons_string = @ingredient.seasons.pluck(:name).join(", ")
  end
end
