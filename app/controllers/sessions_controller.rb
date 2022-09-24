class SessionsController < ApplicationController
  skip_before_action :authorized, only: [:new, :create, :welcome]

  def new
  end

  def create
    @user = User.find_by(nickname: params[:nickname])
    if @user && @user.password == params[:password]
      session[:user_id] = @user.id
      redirect_to root_path
    else
      redirect_to new_session_path
    end
  end

  def destroy
    if session[:user_id] == params[:id].to_i
      session[:user_id] = nil
      redirect_to root_path
    end
  end

  def welcome
  end
end
