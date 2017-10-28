class UsersController < ApplicationController
<<<<<<< HEAD
  def new
    @errors = ['cow', 'pie']
    @user = User.new
  end

  def create
    @errors = ['hi', 'there']
    render partial: 'shared/errors'
=======
  def show
    @user = User.new
    render :show
>>>>>>> master
  end
end
