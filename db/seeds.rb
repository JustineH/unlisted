require 'csv'

csv_text = File.read(Rails.root.join('lib', 'seeds', 'homes.csv'))
csv = CSV.parse(csv_text, :headers => false)
@addresses = csv.map do |entry|
  entry[0]
end

csv_text = File.read(Rails.root.join('lib', 'seeds', 'condos.csv'))
csv = CSV.parse(csv_text, :headers => false)
@condo_addresses = csv.map do |entry|
  entry[0]
end

csv_text = File.read(Rails.root.join('lib', 'seeds', 'townhouses.csv'))
csv = CSV.parse(csv_text, :headers => false)
@townhouse_addresses = csv.map do |entry|
  entry[0]
end

# return one item from addresses and remove that option
def address_factory
  if @addresses.length == 0
    return Faker::Address.street_address
  end
  add = @addresses.sample
  @addresses.delete(add)
  add
end

def condo_address_factory
  if @condo_addresses.length == 0
    return Faker::Address.street_address
  end
  add = @condo_addresses.sample
  @condo_addresses.delete(add)
  add
end

def townhouse_address_factory
  if @townhouse_addresses.length == 0
    return Faker::Address.street_address
  end
  add = @townhouse_addresses.sample
  @townhouse_addresses.delete(add)
  add
end

def random_neighbourhood
  words = ["Downtown Vancouver", "West End", "Yaletown", "Coal Harbour", "Gastown", "Chinatown", "Downtown Eastside", "False Creek", "Kitsilano", "Marpole", "Point Grey", "Commercial Drive", "Mount Pleasant", "Oakridge", "Kerrisdale", "Arbutus Ridge", "Dunbar-Southlands", "False Creek", "Granville Island/Fairview", "Shaughnessy", "South Cambie", "Grandview-Woodland", "Hastings-Sunrise", "Killarney", "Strathcona", "Riley Park-Little Mountain", "Sunset", "Victoria-Fairview", "Dunbar"]
  words.sample
end

def random_ownership
  words = ["Freehold Strata", "Leasehold Prepaid-Strata"]
  words.sample
end

def random_property_summary(listing)
  "#{listing.bedrooms} bedrooms, #{listing.bathrooms} bathrooms #{listing.home_type}."
end

@addresses.length.times do 
  t = Listing.new
  t.neighbourhood = Neighbourhood.where(name: random_neighbourhood).first_or_create
  t.address = address_factory
  t.city = "Vancouver"
  t.postal_code = Faker::Address.postcode
  t.price = Faker::Number.between(300000, 10000000)
  t.bedrooms = Faker::Number.between(1, 7)
  t.bathrooms = Faker::Number.between(1, 4)
  t.size = Faker::Number.between(1300, 12000)
  t.year_built = Faker::Number.between(1900, 2016)
  t.home_type = "House" 
  t.type_ownership = "Freehold Nonstrata"
  t.levels = Faker::Number.between(1, 3)
  t.full_bathrooms = Faker::Number.between(1, 4)
  t.half_bathrooms = Faker::Number.between(0, 2)
  t.fireplaces = Faker::Number.between(0, 1)
  t.taxes = Faker::Number.between(5000, 13500)
  t.strata_fees = ""
  t.lot_size = Faker::Number.between(1700, 20000)
  t.walkscore = Faker::Number.between(20, 99)
  t.property_summary = random_property_summary(t)
  t.parking = true
  t.storage = true
  t.basement = Faker::Boolean.boolean(0.7)
  t.bike_room = false
  t.elevator = false
  t.garden = Faker::Boolean.boolean(0.4)
  t.insuite_laundry = true
  t.garage = Faker::Boolean.boolean(0.7)
  t.doorman = false
  t.gym = false
  t.amenities_room = false
  t.air_conditioning = Faker::Boolean.boolean(0.3)
  t.washer = Faker::Boolean.boolean(0.6)
  t.dishwasher = Faker::Boolean.boolean(0.8)
  t.stove = Faker::Boolean.boolean(0.8)
  t.fridge = Faker::Boolean.boolean(0.8)
  t.hot_tub = Faker::Boolean.boolean(0.1)
  t.pool = Faker::Boolean.boolean(0.1)
  t.pet_friendly = true
  t.wheelchair_accessible = Faker::Boolean.boolean(0.1)
  t.dryer = Faker::Boolean.boolean(0.6)
  t.save
end

@condo_addresses.length.times do 
  t = Listing.new
  t.neighbourhood = Neighbourhood.where(name: random_neighbourhood).first_or_create
  t.address = condo_address_factory
  t.city = "Vancouver"
  t.postal_code = Faker::Address.postcode
  t.price = Faker::Number.between(300000, 3000000)
  t.bedrooms = Faker::Number.between(1, 4)
  t.bathrooms = Faker::Number.between(1, 3)
  t.size = Faker::Number.between(500, 3000)
  t.year_built = Faker::Number.between(1990, 2016)
  t.home_type = "Condo"
  t.type_ownership = random_ownership
  t.levels = 1
  t.full_bathrooms = Faker::Number.between(1, 3)
  t.half_bathrooms = Faker::Number.between(0, 1)
  t.fireplaces = Faker::Number.between(0, 1)
  t.taxes = Faker::Number.between(1000, 7500)
  t.strata_fees = Faker::Number.between(120, 600)
  t.lot_size = 0
  t.walkscore = Faker::Number.between(20, 99)
  t.property_summary = random_property_summary(t)
  t.parking = Faker::Boolean.boolean(0.5)
  t.storage = Faker::Boolean.boolean(0.6)
  t.basement = false
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
end

@townhouse_addresses.length.times do 
  t = Listing.new
  t.neighbourhood = Neighbourhood.where(name: random_neighbourhood).first_or_create
  t.address = townhouse_address_factory
  t.city = "Vancouver"
  t.postal_code = Faker::Address.postcode
  t.price = Faker::Number.between(400000, 4000000)
  t.bedrooms = Faker::Number.between(1, 4)
  t.bathrooms = Faker::Number.between(1, 4)
  t.size = Faker::Number.between(1000, 4000)
  t.year_built = Faker::Number.between(1990, 2016)
  t.home_type = "Townhouse"
  t.type_ownership = random_ownership
  t.levels = Faker::Number.between(1, 3)
  t.full_bathrooms = Faker::Number.between(1, 4)
  t.half_bathrooms = Faker::Number.between(0, 1)
  t.fireplaces = Faker::Number.between(0, 1)
  t.taxes = Faker::Number.between(1000, 7500)
  t.strata_fees = Faker::Number.between(120, 700)
  t.lot_size = Faker::Number.between(2000, 5000)
  t.walkscore = Faker::Number.between(20, 99)
  t.property_summary = random_property_summary(t)
  t.parking = Faker::Boolean.boolean(0.5)
  t.storage = Faker::Boolean.boolean(0.6)
  t.basement = Faker::Boolean.boolean(0.5)
  t.bike_room = Faker::Boolean.boolean(0.7)
  t.elevator = false
  t.garden = Faker::Boolean.boolean(0.5)
  t.insuite_laundry = true
  t.garage = Faker::Boolean.boolean(0.7)
  t.doorman = false
  t.gym = false
  t.amenities_room = false
  t.air_conditioning = Faker::Boolean.boolean(0.3)
  t.washer = Faker::Boolean.boolean(0.6)
  t.dishwasher = Faker::Boolean.boolean(0.8)
  t.stove = Faker::Boolean.boolean(0.8)
  t.fridge = Faker::Boolean.boolean(0.8)
  t.hot_tub = false
  t.pool = false
  t.pet_friendly = Faker::Boolean.boolean(0.7)
  t.wheelchair_accessible = Faker::Boolean.boolean(0.4)
  t.dryer = Faker::Boolean.boolean(0.6)
  t.save
end


puts "There are now #{Listing.count} rows in the Listings table."