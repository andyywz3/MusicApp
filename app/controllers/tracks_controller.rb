class TracksController < ApplicationController
  def index
    @album = Album.find(params[:album_id])
    @band = @album.band
    render :index
  end

  def create
    album = Album.find_by_name(params[:album][:name])
    band_id = album.band_id
    params[:track][:album_id] = album.id
    params[:track][:band_id] = band_id
    track = Track.new(params[:track])
    flash[:errors] ||= []

    if track.save
      redirect_to album_tracks_url(album.id)
    else
      flash[:errors] << "Could not create track"
    end
  end

  def new
    @albums = Album.all
    render :new
  end

  def edit
    @track = Track.find(params[:id])
    @albums = Album.all
    render :edit
  end

  def show
    @track = Track.find(params[:id])
    @album = @track.album
    @band = @album.band
    render :show
  end

  def update
    album = Album.find_by_name(params[:album][:name])
    band_id = album.band_id
    params[:track][:album_id] = album.id
    params[:track][:band_id] = band_id

    track = Track.find(params[:id])
    track.update_attributes(params[:track])
    flash[:errors] ||= []

    if track.save
      redirect_to album_tracks_url(album.id)
    else
      flash[:errors] << "Could not create track"
    end

  end

  def destroy
    track = Track.find(params[:id])
    album_id = track.album_id
    track.destroy
    redirect_to album_tracks_url(album_id)
  end

  def add_note
    params[:note][:track_id] = params[:id]
    note = Note.new(params[:note])
    flash[:errors] ||= []

    if note.save
      redirect_to track_url(params[:id])
    else
      flash[:errors] << "Could not create note"
    end
  end


  def delete_note
    note = Note.find(params[:id])
    track_id = note.track_id
    note.destroy
    redirect_to track_url(track_id)
  end
end
