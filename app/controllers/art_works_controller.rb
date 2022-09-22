class ArtWorksController < ApplicationController

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
      render '/art_works/new'
    end
  end

  def edit
    @art_work = ArtWork.find(params[:id])
  end

  def update
    @art_work = ArtWork.find(params[:id])
    if @art_work.update(art_params)
      redirect_to "/art_works/#{current_user.id}"
    else
      render "/art_works/#{@art_work.id}/edit"
    end
  end

  def destroy
    @art_work = ArtWork.find(params[:id])
    @art_work.destroy
    redirect_to "/art_works/#{current_user.id}"
  end

  private
  def art_params
    params.require(:art_work).permit(:title, :attachment, :resize_to_fit)
  end
end
