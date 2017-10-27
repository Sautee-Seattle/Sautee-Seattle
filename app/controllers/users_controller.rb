class UsersController < ApplicationController
  def new
    @errors = ['cow', 'pie']
    @user = User.new
  end

  def create
    @errors = ['hi', 'there']
    render partial: 'shared/errors'
  end
end
