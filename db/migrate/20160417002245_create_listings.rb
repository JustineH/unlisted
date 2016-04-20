class CreateListings < ActiveRecord::Migration
  def change
   create_table :listings do |t|
      t.references :user, index: true 

      # Address
      t.string :address
      # t.string :streetNumber
      # t.string :streetName
      t.integer :city
      t.string :postalCode
      t.integer :neighbourhood
      #Key Facts
      t.integer :price, default:0
      t.integer :numOfBed, default: 0 
      t.integer :numOfBath, default: 0 
      t.integer :sqft, default: 0 
      t.date :yearBuilt
      t.integer :homeType  
      t.integer :typeOwnership
      t.integer :daysListed, default: 0
      t.integer :lastUpdated, default:0
      # Size
      t.integer :levels, default: 0 
      t.integer :fullBathrooms, default: 0 
      t.integer :halfBathrooms, default: 0 
      t.integer :levels, default: 0 
      t.integer :fireplaces, default: 0 
      t.date :taxYear
      t.integer :taxes, default: 0 
      t.integer :strataFees, default: 0
      t.integer :lotSize  #sqft
      # Display: acres, sq m, hectares
      t.integer :walkscore, default: 0 
      t.text :propertySummary
      t.text :extraFeaturesDescription
      #Condo Extras
      t.integer :parking, default: 0 
      t.integer :storage, default: 0 
      t.integer :basementArea, default: 0 
      t.boolean :basement, default: false

      # Amenities
      t.boolean :bikeRoom, default: false
      t.boolean :elevator, default: false
      t.boolean :garden, default: false
      t.boolean :inSuiteLaundry, default: false
      t.boolean :garage, default: false
      t.boolean :doorman, default: false
      t.boolean :gym, default: false
      t.boolean :amenitiesRoom, default: false
      # Other
      t.boolean :airconditioning, default: false
      t.boolean :washer, default: false
      t.boolean :dishwasher, default: false
      t.boolean :stove, default: false
      t.boolean :fridge, default: false
      t.boolean :hotTub, default: false
      t.boolean :pool, default: false
      t.boolean :petFriendly, default: false
      t.boolean :wheelchairAccessible, default: false

      t.timestamps
    end
  end
end
