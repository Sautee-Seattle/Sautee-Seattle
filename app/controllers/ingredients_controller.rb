class IngredientsController < ApplicationController
  def show
    @ingredient = Ingredient.find(params[:id])
    @locations = @ingredient.posts.where("post_type = 'location'")
    @recipes = @ingredient.posts.where("post_type = 'recipe'")
  end
end
