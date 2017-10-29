class PostsController < ApplicationController
  def new
    @post = Post.new
    @ingredients = Ingredient.all
  end
  def create
    @post = Post.new(post_params)

    if @post.save
      session[:post_id] = @post.id
      redirect_to post_path(@post)
    else
      @errors = @post.errors.full_messages
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:post_type, :title, :body)
  end
end
