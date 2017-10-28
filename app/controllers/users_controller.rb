class UsersController < ApplicationController
  def new
    @errors = ['cow', 'pie']
    @user = User.new
  end

  def create
    @errors = ['hi', 'there']
    render partial: 'shared/errors'
  end
  
  def show
    @user = User.new
    render :show
  end
end
