class RecipesController < ApplicationController
  def show
    @recipe = Post.find(params[:id])
  end
  def new
    @recipe = Post.new
    @ingredients = Ingredient.all
    @ingredient = Ingredient.find(params[:ingredient_id])
  end

  def create
    if session[:user_id]
      @recipe = Post.new(recipe_params)
      if params[:ingredients]
        ingredients = params[:ingredients].keys
        ingredients.each do |name|
          @recipe.ingredients << Ingredient.find_by(name: name)
        end
      end
      if @recipe.save
        redirect_to recipe_path(@recipe)
      else
        @errors = @recipe.errors.full_messages
        @ingredients = Ingredient.all
        @ingredient = Ingredient.find(params[:ingredient_id])
        render :new
      end
    end
  end

  private
  def recipe_params
    user = User.find(session[:user_id])
    strong_params = params.require(:post).permit(:title, :body)
    strong_params[:user] = user
    strong_params[:post_type] = 'recipe'
    strong_params
  end
end
