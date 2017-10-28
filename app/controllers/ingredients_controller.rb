class IngredientsController < ApplicationController
  def show
    @ingredient = Ingredient.find(params[:id])
    # puts "****************************************"
    # p @ingredient
    # p @ingredient.posts.pluck(:post_type)
    @locations = @ingredient.posts.where("post_type = 'location'")
    @recipes = @ingredient.posts.where("post_type = 'recipe'")
  end
end
