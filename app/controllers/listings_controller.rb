class ListingsController < ApplicationController

  before_action :set_listing, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy] 

  def index
    @listings = Listing.all

    if current_user
      @user = current_user.id
    end

    # @bookmarked_listings = current_user.bookmarked_listings
    # @bookmarked_listing = Listing.find(Bookmark.where(user_id: current_user.id).first.listing_id)
    # @test = current_user.bookmarked_listings.create(listing_id: params[:listing_id])

  end

  def show

  end

  def add_bookmark

    @bookmark = Bookmark.new user_id: current_user.id, listing_id: params[:listing_id]
    if @bookmark.save
      render json: @bookmark.as_json(include: :listing)
    end
   
  end

  def del_bookmark
    Bookmark.find_by(user_id: current_user.id, listing_id: params[:listing_id]).destroy
    render nothing: true
  end

  def new
    # @listing = Listing.new
    @listing = current_user.listings.build
  end

  def create
    # @listing = Listing.new(listing_params)
    # @listing.user = current_user
    @listing = current_user.listings.build(listing_params)
    if @listing.save
      redirect_to @listing, notice: 'Listing was successfully entered'
    else
      render action: 'new'
    end
  end

  def edit 
  end

  def update
    if @listing.update(listing_params)
    redirect_to @listing, notice: "Your Listing was successfully updated."
    else
      render :edit      
    end
  end

  def destroy
    @listing.destroy
    redirect_to action: "index"
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

  private

  def set_listing
    @listing = Listing.find(params[:id])
  end
  def correct_user
    @listing = current_user.listings.find_by(id: params[:id])
    redirect_to listings_path, notice: "Not authorized to edit this listing" if @listing.nil?
  end
  def listing_params
    params.require(:listing).permit(
      :address, :unit_number, :street_name, :city, :postal_code, :price, :bedrooms, :bathrooms, :size, :year_built, :home_type, :type_ownership, :levels, :full_bathrooms, :half_bathrooms, :fireplaces, :taxes, :strata_fees, :lot_size, :walkscore, :property_summary, :features_description, :parking, :storage, :basement, :bike_room, :elevator, :garden, :insuite_laundry, :garage, :doorman, :gym, :amenities_room, :air_conditioning, :washer, :dishwasher, :stove, :fridge, :hot_tub, :pool, :pet_friendly, :wheelchair_accessible, :neighbourhood_id, :image
      )
  end

end
