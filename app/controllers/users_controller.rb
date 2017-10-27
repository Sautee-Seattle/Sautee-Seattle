class UsersController < ApplicationController
  def show
    @user = User.new
    render :show
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      @errors = @user.errors.full_messages
      render :new
    end
  end

  def show
    @user = User.new
    render :show
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :bio)
  end
end
