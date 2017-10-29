class IngredientsController < ApplicationController
  def show
    @ingredient = Ingredient.find(params[:id])
    @description = "Hey! #{@ingredient.name} are awesome! Here are some neat local places to find #{@ingredient.name.downcase}, as well as a few of our favorite recipes to get you started."
    @recipes = @ingredient.recipes.sample(5)
    @locations = @ingredient.locations.sample(5)
    @seasons_string = @ingredient.seasons.pluck(:name).join(", ")
  end
end
