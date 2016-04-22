class ListingsController < ApplicationController
  def index
    @listings = Listing.all
  end

  def show
    @neighbourhoods = Neighbourhood.all 
    # @type_ownership = Listing::TYPE_OWNERSHIP
    # @type_property = Listing::TYPE_PROPERTY
    # @listing = Listing.find(params[:id])
  end

  def new
    @listing = Listing.new
    # @listing = current_user.listings.build
  end

  def create
    @listing = current_user.listings.build(listing_params)
    if @listing.save
      redirect_to @listing, notice: 'Listing was successfully entered'
    else
      render action: 'new'
    end
  end

  def edit
    @listing = Listing.find(params[:id])    
  end

  def update
    @listing = Listing.find(params[:id])
    if @listing.update_attributes(listing_params)
    redirect_to listing_path(@listing)
    else
      render :edit      
    end
  end

  def destroy
    @listing = Listing.find(params[:id])
    @listing.destroy
    redirect_to listings_path
  end

  def search
    @results = Listing.where(params[:results])
  end

  private

  def listing_params
    params.require(:listing).permit(
      :address, :unit_number, :street_name, :city, :postal_code, :price, :bedrooms, :bathrooms, :size, :year_built, :home_type, :type_ownership, :levels, :full_bathrooms, :half_bathrooms, :fireplaces, :taxes, :strata_fees, :lot_size, :walkscore, :property_summary, :features_description, :parking, :storage, :basement, :bike_room, :elevator, :garden, :insuite_laundry, :garage, :doorman, :gym, :amenities_room, :air_conditioning, :washer, :dishwasher, :stove, :fridge, :hot_tub, :pool, :pet_friendly, :wheelchair_accessible, :neighbourhood_id
      )
  end
end
