class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    p '$' * 50
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save!
        p '*'
        session[:user_id] = @user.id
        format.json { render json: @user, status: :created }
        # redirect_to user_path(@user)
      else
        @errors = @user.errors.full_messages
        render :new
      end
    end
  end

  def show
    @user = User.find(params[:id])
    render :show
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :bio)
  end
end
