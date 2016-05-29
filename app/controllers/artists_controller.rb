class ArtistsController < ApplicationController
  def index
    @all_artists = Artist.all
  end

  def new
    @artist = Artist.new
  end

  def create
    #TODO: create helper method for params
    @artist = Artist.new(name: params[:artist][:name], image_path: params[:artist][:image_path])

    if @artist.valid?
      @artist.save
    # redirect_to artist_path(@artist)
      redirect_to @artist
    else
      render :new
    end
  end

  def show
    @artist = Artist.find(params[:id])
  end

  def edit
    @artist = Artist.find(params[:id])
  end

  def update
    @artist = Artist.find(params[:id])
    @artist.update(name: params[:artist][:name], image_path: params[:artist][:image_path])

    redirect_to @artist
  end

  def destroy
    @artist = Artist.find(params[:id])
    @artist.destroy

    redirect_to artists_path

  end
end
