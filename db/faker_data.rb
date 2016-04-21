# require 'csv'

# csv_text = File.read(Rails.root.join('lib', 'seeds', 'homes.csv'))
# csv = CSV.parse(csv_text, :headers => true)


#### Faker data that was not used ####

  def random_type
    words = ["Condo", "House", "Townhouse"]
    words[rand(words.length)]
  end

  def random_ownership
    words = ["Freehold Strata", "Freehold Nonstrata", "Leasehold prepaid-Strata"]
    words[rand(words.length)]
  end

  def random_neighbourhood
    words = ["Gastown", "Yaletown", "Kitsilano", "West End", "Granville Entertainment", "The Drive", "Mount Pleasant", "Downtown", "South Granville", "Point Grey", "Strathcona", "Coal Harbour", "Chinatown", "Killarney", "Marpole", "Shaughnessy", "Oakridge", "Kerrisdale", "Fairview", "Central Lonsdale"]
    words[rand(words.length)]
  end

  def random_area
    words = ["Arbutus-Ridge", "Cedar Cottage", "Champlain Heights", "Chinatown", "Coal Harbour", "Collingwood", "Commercial Drive", "Creekside", "Downtown", "Downtown Eastside", "Dunbar-Southlands", "Fairview", "False Creek Flats", "False Creek North", "False Creek South", "Fraser", "Gastown", "Grandview-Woodland", "Granville Island", "Hastings-Sunrise", "Hastings Crossing", "Hastings East", "Hillcrest", "Kensington-Cedar Cottage", "Kerrisdale", "Killarney", "Kitsilano", "Knight", "Langara", "Little Mountain", "MacKenzie Heights", "Main", "Marpole", "Mole Hill", "Mount Pleasant", "Musqueam", "Oakridge", "Quilchena", "Renfrew-Collingwood", "Riley Park", "Shaughnessy", "South Cambie", "South Granville", "South Hill", "South Vancouver", "Southlands", "Southwest Marine", "Strathcona", "Sunrise", "Sunset", "Victoria-Fraserview", "West Broadway", "West End", "West Point Grey", "Woodland", "Yaletown"]
    words[rand(words.length)]
  end

  def random_property_summary(listing)
    "#{listing.bedrooms} bedrooms, #{listing.bathrooms} bathrooms #{listing.home_type} in {listing.neighbourhood}."
  end

100.times do 
  t = Listing.new
  t.address = Faker::Address.street_address
  t.city = Faker::Address.city
  t.price = Faker::Commerce.price
  t.bedrooms = Faker::Number.digit
  t.bathrooms = Faker::Number.digit
  t.full_bathrooms = Faker::Number.digit
  t.half_bathrooms = Faker::Number.digit
  t.levels = Faker::Number.digit
  t.size = Faker::Number.between(500, 12000)
  t.lot_size = Faker::Number.between(1000, 20000)
  t.year_built = Faker::Date.between(Date.new(1900, 1, 1), Date.today) 
  t.home_type = random_type  
  t.type_ownership = random_ownership
  t.neighbourhood = random_neighbourhood
  t.area = random_area
  t.postal_code = Faker::Address.postcode
  t.property_summary = random_property_summary(t)
  t.fireplaces = Faker::Number.digit
  t.basement_area = Faker::Boolean.boolean(0.1)
  t.taxes = Faker::Commerce.price
  t.strata_fees = Faker::Commerce.price
  t.walkscore = Faker::Number.between(20, 99)
  t.days_listed = Faker::Number.between(1, 40)
  t.last_updated = Faker::Date.between(35.days.ago, Date.today)
  # t.image
  t.save
  # puts row.to_hash
end


puts "There are now #{Listing.count} rows in the Listings table."