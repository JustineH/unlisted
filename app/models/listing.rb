class Listing < ActiveRecord::Base
  belongs_to :user
  belongs_to :neighbourhood

  # validates :address, presence: true, length: { minimum: 10}
  # validates :unit_number, numericality: true
  # validates :street_number, presence: true, numericality: true
  # validates :street_name, presence: true, length: {minimum: 5}
  # # validates :city
  # validates :postal_code, presence: true, :postcode_format => {:country_code => :ca, :message => "Please enter a valid postal code"}
  # validates :price, presence: true, numericality: true
  # validates :bedrooms, presence: true, numericality: true
  # validates :bathrooms, presence: true, numericality: true
  # validates :size, presence: true, numericality: true
  # validates :year_built, numericality: true
  # validates :home_type, presence: true, length: {minimum: 2}
  # # validates :type_ownership
  # validates :levels, numericality: true
  # validates :full_bathrooms, numericality: true
  # validates :half_bathrooms, numericality: true
  # validates :fireplaces, numericality: true
  # validates :taxes, numericality: true
  # validates :strata_fees, numericality: true
  # validates :lot_size, numericality: true
  # validates :walkscore, numericality: true
  # # validates :property_summary
  # # validates :feature_description
  # validates :parking, numericality: true
  # validates :storage, inclusion: [true, false]
  # validates :basement, inclusion: [true, false]
  # validates :bike_room, inclusion: [true, false]
  # validates :elevator, inclusion: [true, false]
  # validates :garden, inclusion: [true, false]
  # validates :insuite_laundry, inclusion: [true, false]
  # validates :garage, inclusion: [true, false]
  # validates :doorman, inclusion: [true, false]
  # validates :gym, inclusion: [true, false]
  # validates :amenities_room, inclusion: [true, false]
  # validates :air_conditioning, inclusion: [true, false]
  # validates :washer, inclusion: [true, false]
  # validates :dishwasher, inclusion: [true, false]
  # validates :stove, inclusion: [true, false]
  # validates :fridge, inclusion: [true, false]
  # validates :hot_tub, inclusion: [true, false]
  # validates :pool, inclusion: [true, false]
  # validates :pet_friendly, inclusion: [true, false]
  # validates :wheelchair_accessible, inclusion: [true, false]
  # validates :image, presence: true, :file_size {maximum: 1.0.megabytes.to_i}

end