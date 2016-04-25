require 'csv'

csv_text = File.read(Rails.root.join('lib', 'seeds', 'homes.csv'))
csv = CSV.parse(csv_text, :headers => true)
p csv['address']
  # neighbourhoods = ["Downtown Vancouver", "West End", "Yaletown", "Coal Harbour", "Gastown", "Chinatown", "Downtown Eastside", "False Creek", "Kitsilano", "Marpole", "Point Grey", "Commercial Drive", "Mount Pleasant", "Oakridge", "Kerrisdale", "Arbutus Ridge", "Dunbar-Southlands", "False Creek", "Granville Island/Fairview", "Shaughnessy", "South Cambie", "Grandview-Woodland", "Hastings-Sunrise", "Killarney", "Strathcona", "Riley Park-Little Mountain", "Sunset", "Victoria-Fairview", "Dunbar"]

  # neighbourhoods.each do |neighbourhood|
  #   Neighbourhood.create(name:neighbourhood)
  # end

   def random_neighbourhood
    words = ["Downtown Vancouver", "West End", "Yaletown", "Coal Harbour", "Gastown", "Chinatown", "Downtown Eastside", "False Creek", "Kitsilano", "Marpole", "Point Grey", "Commercial Drive", "Mount Pleasant", "Oakridge", "Kerrisdale", "Arbutus Ridge", "Dunbar-Southlands", "False Creek", "Granville Island/Fairview", "Shaughnessy", "South Cambie", "Grandview-Woodland", "Hastings-Sunrise", "Killarney", "Strathcona", "Riley Park-Little Mountain", "Sunset", "Victoria-Fairview", "Dunbar"]
    words.sample
  end

  def random_type
    words = ["Condo", "House", "Townhouse"]
    words[rand(words.length)]
  end

  def random_ownership
    words = ["Freehold Strata", "Freehold Nonstrata", "Leasehold prepaid-Strata"]
    words[rand(words.length)]
  end

  def random_property_summary(listing)
    "#{listing.bedrooms} bedrooms, #{listing.bathrooms} bathrooms #{listing.home_type} in {listing.neighbourhood.name}."
  end


100.times do 
  t = Listing.new
  t.neighbourhood = Neighbourhood.where(name: random_neighbourhood).first_or_create
  # t.address = p csv['address']
  # t.unit_number = 
  # t.street_number = 
  # t.street_name = 
  t.city = "Vancouver"
  t.postal_code = Faker::Address.postcode
  t.price = Faker::Number.between(300000, 10000000)
  t.bedrooms = Faker::Number.digit
  t.bathrooms = Faker::Number.digit
  t.size = Faker::Number.between(500, 12000)
  t.year_built = Faker::Number.between(1900, 2016)
  t.home_type = random_type 
  t.type_ownership = random_ownership
  t.levels = Faker::Number.between(1, 4)
  t.full_bathrooms = Faker::Number.digit
  t.half_bathrooms = Faker::Number.digit
  t.fireplaces = Faker::Number.between(0, 1)
  t.taxes = Faker::Number.between(1000, 13500)
  t.strata_fees = Faker::Number.between(120, 600)
  t.lot_size = Faker::Number.between(1000, 20000)
  t.walkscore = Faker::Number.between(20, 99)
  t.property_summary = random_property_summary(t)
  t.parking = Faker::Boolean.boolean(0.5)
  t.storage = Faker::Boolean.boolean(0.6)
  t.basement = Faker::Boolean.boolean(0.7)
  t.bike_room = Faker::Boolean.boolean(0.7)
  t.elevator = Faker::Boolean.boolean(0.8)
  t.garden = Faker::Boolean.boolean(0.4)
  t.insuite_laundry = Faker::Boolean.boolean(0.6)
  t.garage = Faker::Boolean.boolean(0.7)
  t.doorman = Faker::Boolean.boolean(0.6)
  t.gym = Faker::Boolean.boolean(0.5)
  t.amenities_room = Faker::Boolean.boolean(0.5)
  t.air_conditioning = Faker::Boolean.boolean(0.3)
  t.washer = Faker::Boolean.boolean(0.6)
  t.dishwasher = Faker::Boolean.boolean(0.8)
  t.stove = Faker::Boolean.boolean(0.8)
  t.fridge = Faker::Boolean.boolean(0.8)
  t.hot_tub = Faker::Boolean.boolean(0.4)
  t.pool = Faker::Boolean.boolean(0.5)
  t.pet_friendly = Faker::Boolean.boolean(0.5)
  t.wheelchair_accessible = Faker::Boolean.boolean(0.4)
  t.dryer = Faker::Boolean.boolean(0.6)
  t.save
  # puts row.to_hash
end


puts "There are now #{Listing.count} rows in the Listings table."