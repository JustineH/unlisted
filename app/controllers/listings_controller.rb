class ListingsController < ApplicationController
  def index

  end

  def show
  end

  def new
  end

  def edit
    @listings = Listing.all
  end
end
