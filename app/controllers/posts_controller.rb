class PostsController < ApplicationController
  def index
    @ingredient = Ingredient.find(params[:ingredient_id])
    render :index
  end
end
