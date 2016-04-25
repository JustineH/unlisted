class ListingsController < ApplicationController

  def index
    @listings = Listing.all

    @listings = Listing.search(params[:query] + "*", misspellings: {edit_distance: false}, where: params[:query_options].deep_symbolize_keys)


    # Listing.search("Killarn", autocomplete: true, limit: 10)
  end

  def show
    @neighbourhoods = Neighbourhood.all 
  end

  def new
    @listing = Listing.new
  end

  def edit
    
  end

  # def autocomplete
  #   render json: Listing.search(params[:query], {
  #     fields: ["neighbourhood_id"],
  #     limit: 10,
  #     load: false,
  #     misspellings: {below: 3}
  #   }).map(&:neighbourhood_id)
  # end

  def basic

  end

  
end

