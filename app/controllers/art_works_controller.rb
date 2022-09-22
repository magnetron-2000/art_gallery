class ArtWorksController < ApplicationController
  before_action :find_art_work, only: [:edit, :update, :destroy, :let_change]
  before_action :let_change, only: [:edit, :update, :destroy]

  def show
    @art_works = ArtWork.all.where :user_id => params[:id].to_i
    @creator = User.find_by(id: params[:id].to_i)
  end

  def new
    @art_work = ArtWork.new
    render '/art_works/new'
  end

  def create
    @art_work = ArtWork.new(art_params)
    @art_work.user_id = current_user.id
    if @art_work.save
      redirect_to '/'
    else
      flash.alert = @art_work.errors.full_messages
      render '/art_works/new'
    end
  end

  def edit
  end

  def update
    if @art_work.update(art_params)
      redirect_to "/art_works/#{current_user.id}"
    else
      render "/art_works/#{@art_work.id}/edit"
    end
  end

  def destroy
    @art_work.destroy
    redirect_to "/art_works/#{current_user.id}"
  end

  def let_change # Allow author to update and delete only his ArtWork
    if current_user.id != @art_work.user_id
      flash.alert = "You can not change someone else's work"
      redirect_to "/users"
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
