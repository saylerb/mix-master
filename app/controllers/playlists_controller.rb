class PlaylistsController < ApplicationController
  def index
    @playlists = Playlist.all
  end

  def new
    @playlist = Playlist.new
  end

  def create
    @playlist = Playlist.create(name: params[:playlist][:name],
                                song_ids: params[:playlist][:song_ids])
    redirect_to playlist_path(@playlist)
  end

  def show
    @playlist = Playlist.find(params[:id])
  end
  
  def edit
    @playlist = Playlist.find(params[:id])
  end

  def update
    @playlist = Playlist.find(params[:id])
    @playlist.update(name: params[:playlist][:name],
                     song_ids: params[:playlist][:song_ids])

    redirect_to playlist_path(@playlist)
  end

end
