class RecipesController < ApplicationController
  def show
    @recipe = Post.find(params[:id])
  end
end
