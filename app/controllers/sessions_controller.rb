class SessionsController < ApplicationController
  skip_before_action :authorized, only: [:new, :create, :welcome]

  def new
  end

  def create
    @user = User.find_by(nickname: params[:nickname])
    if @user.password == params[:password]
      session[:user_id] = @user.id
      redirect_to '/welcome'
    else
      redirect_to '/login'
    end
  end

  def destroy
    if session[:user_id]
      session[:user_id] = nil
      redirect_to '/welcome'
    end
  end

  def welcome
  end
end
