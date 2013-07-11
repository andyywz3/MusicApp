class BandsController < ApplicationController
  def index
    @bands = Band.all
    render :index
  end

  def create
    band = Band.new(params[:band])
    flash[:errors] ||= []

    if band.save
      redirect_to bands_url
    else
      flash[:errors] << "Could not create band"
    end
  end

  def new
    render :new
  end

  def edit
    @band = Band.find(params[:id])
    render :edit
  end

  def show
    @band = Band.find(params[:id])
    render :show
  end

  def update
    band = Band.find(params[:id])
    band.update_attributes(params[:band])
    flash[:errors] ||= []

    if band.save
      redirect_to band_url
    else
      flash[:errors] << "Could not update band"
    end
  end

  def destroy
    @band = Band.find(params[:id])
    @band.destroy
    redirect_to bands_url
  end

  def tracks
    @band = Band.find(params[:id])
    render :tracks
  end
end
