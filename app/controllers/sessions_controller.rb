class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_username(params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to '/'
    else
      @errors = ['Invalid login/password combination!']
      render :new
    end
  end

  def destroy
    session.clear
    redirect_to '/'
  end
end
