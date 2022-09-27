class ArtWorksController < ApplicationController
  before_action :find_art_work, only: [:edit, :update, :destroy, :let_change]
  before_action :let_change, only: [:edit, :update, :destroy]

  def show
    @art_works = ArtWork.all.where :user_id => params[:id].to_i
    @creator = User.find_by(id: params[:id].to_i)
  end

  def new
    @art_work = ArtWork.new
  end

  def create
    @art_work = ArtWork.new(art_params)
    @art_work.user_id = current_user.id
    if @art_work.save
      redirect_to root_path
    else
      flash.alert = @art_work.errors.full_messages
      render :new,  :status => 400
    end
  end

  def edit
  end

  def update
    if @art_work.update(art_params)
      redirect_to art_work_path(current_user.id)
    else
      flash.alert = @art_work.errors.full_messages
      redirect_to edit_art_work_path(@art_work),  :status => 400
    end
  end

  def destroy
    @art_work.destroy
    redirect_to art_work_path(current_user)
  end

  def let_change # Allow author to update and delete only his ArtWork
    if current_user.id != @art_work.user_id
      flash.alert =  I18n.t "access_deny"
      redirect_to users_path
    end
  end

  private
  def art_params
    params.require(:art_work).permit(:title, :attachment, :resize_to_fit)
  end

  def find_art_work
    @art_work = ArtWork.find(params[:id])
  end
end
