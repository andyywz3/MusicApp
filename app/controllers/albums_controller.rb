class AlbumsController < ApplicationController
  def index
    @band = Band.find(params[:id])
    @albums = @band.albums
    render :index
  end

  def create
    band_id = Band.find_by_name(params[:band][:name]).id
    params[:album][:band_id] = band_id
    album = Album.new(params[:album])

    flash[:errors] ||= []

    if album.save
      redirect_to albums_url(band_id)
    else
      flash[:errors] << "Could not create album"
    end
  end

  def new
    @bands = Band.all
    render :new
  end

  def edit
    @album = Album.find(params[:id])
    render :edit
  end

  def show
    @album = Album.find(params[:id])
    render :show
  end

  def update

  end

  def destroy
    @album = Album.find(params[:id])
    @album.destroy!
    redirect_to albums_url
  end

end
