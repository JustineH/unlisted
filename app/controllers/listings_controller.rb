class ListingsController < ApplicationController
  def index
    @listings = Listing.all
  end

  def show
    @neighbourhoods = Neighbourhood.all 
    # @type_ownership = Listing::TYPE_OWNERSHIP
    # @type_property = Listing::TYPE_PROPERTY
  end

  def new
    @listing = Listing.new
  end

  def edit
    
  end

  def search
    @results = Listing.where(params[:text])
  end

  def basic
    @listing = Listing.new
  end

  def details
    @listing = Listing.new
  end

  def amenities
    @listing = Listing.new
  end

  def photos
    @listing = Listing.new
  end
  
end
