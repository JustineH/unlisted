class CreateListings < ActiveRecord::Migration
  def change
   create_table :listings do |t|
      t.references :user, index: true 

      # Address
      t.string :address
      t.string :unit_number
      t.string :street_number
      t.string :street_name
      t.integer :city
      t.string :postal_code
      t.integer :neighbourhood
      #Key Facts
      t.integer :price, default:0
      t.integer :bedrooms, default: 0 
      t.integer :bathrooms, default: 0 
      t.integer :size, default: 0 
      t.date :year_built
      t.integer :home_type  
      t.integer :type_ownership
      t.integer :days_listed, default: 0
      t.integer :last_updated, default:0
      # Size
      t.integer :levels, default: 0 
      t.integer :full_bathrooms, default: 0 
      t.integer :half_bathrooms, default: 0 
      t.integer :levels, default: 0 
      t.integer :fireplaces, default: 0 
      t.integer :taxes, default: 0 
      t.integer :strata_fees, default: 0
      t.integer :lot_size  #sqft
      # Display: acres, sq m, hectares
      t.integer :walkscore, default: 0 
      t.text :property_summary
      t.text :features_description
      #Condo Extras
      t.integer :parking, default: 0 
      t.integer :storage, default: 0 
      t.integer :basement_area, default: 0 
      t.boolean :basement, default: false

      # Amenities
      t.boolean :bike_room, default: false
      t.boolean :elevator, default: false
      t.boolean :garden, default: false
      t.boolean :insuite_laundry, default: false
      t.boolean :garage, default: false
      t.boolean :doorman, default: false
      t.boolean :gym, default: false
      t.boolean :amenities_room, default: false
      # Other
      t.boolean :air_conditioning, default: false
      t.boolean :washer, default: false
      t.boolean :dishwasher, default: false
      t.boolean :stove, default: false
      t.boolean :fridge, default: false
      t.boolean :hot_tub, default: false
      t.boolean :pool, default: false
      t.boolean :pet_friendly, default: false
      t.boolean :wheelchair_accessible, default: false

      t.timestamps
    end
  end
end
