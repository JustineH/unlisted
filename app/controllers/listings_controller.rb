class ListingsController < ApplicationController
  def index
    @listings = Listing.all
  end

  def show
    @listings = Listing.all


    @neighbourhoods = Neighbourhood.all 

    # @type_ownership = Listing::TYPE_OWNERSHIP
    # @type_property = Listing::TYPE_PROPERTY
  end

  def add_bookmark
    @bookmark = Bookmark.create user_id: session[:user_id], listing_id: params[:listing_id]
    

  end

  def new
    @listing = Listing.new
  end

  def edit
    
  end

  def search
    @results = Listing.where(params[:results])
  end
end
