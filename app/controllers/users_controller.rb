class UsersController < ApplicationController
  skip_before_action :authorized, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_create_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to '/welcome'
    else
      render '/new'
    end
  end

  private
  def user_create_params
    params.require(:user).permit(:nickname, :password)
  end
end
