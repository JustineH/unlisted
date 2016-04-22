class ListingsController < ApplicationController
  def index
    @listings = Listing.all
  end

  def show

  end

  def new
    @listing = Listing.new
  end

  def edit
    
  end

  def search
    @results = Listing.where(params[:results])
  end

  def basic
    render :layout => false
  end

  def details
    render :layout => false
  end

end
