class UsersController < ApplicationController
  def show
    @user = User.new
    render :show
  end
end
