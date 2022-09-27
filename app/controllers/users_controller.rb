class UsersController < ApplicationController
  skip_before_action :authorized, only: [:new, :create]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_create_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path
    else
      render new_user_path
    end
  end

  private
  def user_create_params
    params.require(:user).permit(:nickname, :password, :email)
  end
end
