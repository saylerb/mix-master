class PlaylistsController < ApplicationController
  def index
  end

  def new
    @playlist = Playlist.new
  end

  def create
    @playlist = Playlist.create(name: params[:playlist][:name],
                             songs_ids: params[:playlist][:song_ids])
    redirect_to playlist_path(@playlist)
  end
end
