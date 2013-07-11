class BandsController < ApplicationController
  def index
    render :index
  end

  def create

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

  end

  def destroy
    @band = Band.find(params[:id])

  end

end
