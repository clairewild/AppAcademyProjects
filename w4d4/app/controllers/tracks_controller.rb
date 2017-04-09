class TracksController < ApplicationController
  def new
    @albums = Album.all
    render :new
  end

  def create
    @track = Track.new(track_params)
    if @track.save
      redirect_to tracks_url
    else
      flash[:errors] = @track.errors.full_messages
      redirect_to new_track_url
    end
  end

  def index
    @tracks = Track.all
    render :index
  end

  private
  def track_params
    params.require(:track).permit(:songname, :album_id, :type, :lyrics)
  end
end
