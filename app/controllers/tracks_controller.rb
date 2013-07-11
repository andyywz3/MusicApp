class TracksController < ApplicationController
  def index
    @band = Band.find(params[:band_id])
    @album = Album.find(params[:album_id])
    render :index
  end

  def create
    album_id = Album.find_by_name(params[:album][:name]).id
    band_id = params[:band_id]
    params[:track][:album_id] = album_id
    params[:track][:band_id] = band_id
    track = Track.new(params[:track])
    flash[:errors] ||= []

    if track.save
      redirect_to band_album_tracks_url(band_id, album_id)
    else
      flash[:errors] << "Could not create track"
    end

  end

  def new
    @band = Band.find(params[:band_id]
    @albums = @band.albums
    render :new
  end

  def edit
    @track = Track.find(params[:id])
    render :edit
  end

  def show
    @track = Track.find(params[:id])
    render :show
  end

  def update

  end

  def destroy
    @track = Track.find(params[:id])
    @track.destroy
    redirect_to tracks_url
  end
end
