class TracksController < ApplicationController
  def index
    render :index
  end

  def create

  end

  def new
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
    @track.destroy!
    redirect_to tracks_url
  end
end
