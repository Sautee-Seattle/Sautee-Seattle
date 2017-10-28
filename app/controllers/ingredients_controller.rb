class IngredientsController < ApplicationController
  def show
    @ingredient = Ingredient.find(params[:id])
    @locations = @ingredient.posts.where("type = 'location'")
    @recipes = @ingredient.posts.where("type = 'recipe'")
  end
end
