class ListingsController < ApplicationController
  def index
    @listings = Listing.all
  end

  def show
  end

  def new
  end

  def edit
  end

  def basic
    render :layout => false
  end

  def details
    render :layout => false
  end
end
