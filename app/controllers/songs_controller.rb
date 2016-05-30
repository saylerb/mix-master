class SongsController < ApplicationController
  def new
    @artist = Artist.find(params[:artist_id])
    @song = @artist.songs.new
  end

  def create
    @artist = Artist.find(params[:artist_id])
    @song = @artist.songs.create(title: params[:song][:title])

    # previously, I redirected to a page that only listed the songs 
    # for that specific artist
    redirect_to song_path(@song)

  end

  def index
    @artist = Artist.find(params[:artist_id])
  end

  def show
    @song = Song.find(params[:id])
  end
end
