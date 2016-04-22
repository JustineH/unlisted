  neighbourhoods = ["Downtown Vancouver", "West End", "Yaletown", "Coal Harbour", "Gastown", "Chinatown", "Downtown Eastside", "False Creek", "Kitsilano", "Marpole", "Point Grey", "Commercial Drive", "Mount Pleasant", "Oakridge", "Kerrisdale", "Arbutus Ridge", "Dunbar-Southlands", "False Creek", "Granville Island/Fairview", "Shaughnessy", "South Cambie", "Grandview-Woodland", "Hastings-Sunrise", "Killarney", "Strathcona", "Riley Park-Little Mountain", "Sunset", "Victoria-Fairview", "Dunbar"]

  neighbourhoods.each do |neighbourhood|
    Neighbourhood.create(name:neighbourhood)
  end

  condo_1 = Listing.new
    condo_1.address = "201 - 2560 4th Avenue"
    condo_1.city = "Vancouver"
    condo_1.price = 470139
    condo_1.bedrooms = 1
    condo_1.bathrooms = 1
    condo_1.full_bathrooms = 0
    condo_1.half_bathrooms = 1
    condo_1.levels = 1
    condo_1.size = 646
    condo_1.lot_size = 0
    condo_1.year_built = 1986
    condo_1.home_type =  "Apartment/Condo"
    condo_1.type_ownership = "Leasehold Prepaid-Strata"
    # condo_1.neighbourhood = "Kitsilano" 
    condo_1.postal_code = "V6K 1P6"
    condo_1.property_summary = "1 bedroom 1 bathroom condo in Kitsilano."
    condo_1.fireplaces = 4
    condo_1.basement = false
    condo_1.taxes = 1160
    condo_1.strata_fees = 234
    condo_1.walkscore = 94
    condo_1.save

  condo_2 = Listing.new
    condo_2.address = "309 - 6268 Eagles Drive"
    condo_2.city = "Vancouver"
    condo_2.price = 580879
    condo_2.bedrooms = 2
    condo_2.bathrooms = 2
    condo_2.full_bathrooms = 2
    condo_2.half_bathrooms = 0
    condo_2.levels = 1
    condo_2.size = 1096
    condo_2.lot_size = 0
    condo_2.year_built = 2006
    condo_2.home_type =  "Apartment/Condo"
    condo_2.type_ownership = "Leasehold Prepaid-Strata"
    # condo_2.neighbourhood = "Point Grey" 
    condo_2.postal_code = "V6T 0A2" 
    condo_2.property_summary = "2 bedroom 2 bathroom condo in Point Grey."
    condo_2.fireplaces = 0
    condo_2.basement = false
    condo_2.taxes = 1930
    condo_2.strata_fees = 2015
    condo_2.walkscore = 69
    condo_2.save

  condo_3 = Listing.new
    condo_3.address = "204 - 830 7th Avenue E"
    condo_3.city = "Vancouver"
    condo_3.price = "$299,000"
    condo_3.bedrooms = 1
    condo_3.bathrooms = 1
    condo_3.full_bathrooms = 1
    condo_3.half_bathrooms = 0
    condo_3.levels = 1
    condo_3.size = 580
    condo_3.lot_size = 333.24
    condo_3.year_built = 1975
    condo_3.home_type =  "Apartment/Condo"
    condo_3.type_ownership = "Freehold Strata"
    # condo_3.neighbourhood = "Mount Pleasant" 
    condo_3.postal_code = "V5T 4J2"
    condo_3.property_summary = "1 bedroom 1 bathroom condo in Mount Pleasant."
    condo_3.fireplaces = 0
    condo_3.basement = false
    condo_3.taxes = 1061
    condo_3.strata_fees = 276.04
    condo_3.walkscore = 89
    condo_3.save

  condo_4 = Listing.new
    condo_4.address = "209 - 3520 Crowley Drive"
    condo_4.city = "Vancouver"
    condo_4.price = 2319760
    condo_4.bedrooms = 1
    condo_4.bathrooms = 1
    condo_4.full_bathrooms = 1
    condo_4.half_bathrooms = 0
    condo_4.levels = 1
    condo_4.size = 701
    condo_4.lot_size = 202
    condo_4.year_built = 2002
    condo_4.home_type =  "Apartment/Condo"
    condo_4.type_ownership = "Freehold Strata"
    # condo_4.neighbourhood = "Collingwood" 
    condo_4.postal_code = "V5R 6G9"
    condo_4.property_summary = "1 bedroom 1 bathroom condo in Collingwood."
    condo_4.fireplaces = 1
    condo_4.basement = false
    condo_4.taxes = 1061
    condo_4.strata_fees = 276
    condo_4.walkscore = 89
    condo_4.save

  house_1 = Listing.new
    house_1.address = "2624 3rd Avenue W"
    house_1.city = "Vancouver"
    house_1.price = 2319760
    house_1.bedrooms = 3
    house_1.bathrooms = 3
    house_1.full_bathrooms = 3
    house_1.half_bathrooms = 0
    house_1.levels = 3
    house_1.size = 2760
    house_1.lot_size = 333.24
    house_1.year_built = 1910
    house_1.home_type =  "House/Single Family"
    house_1.type_ownership = "Freehold NonStrata"
    # house_1.neighbourhood = "Kitsilano" 
    house_1.postal_code = "V6K 1M3"
    house_1.property_summary = "3 bedroom 3 bathroom single family house in Kitsilano."
    house_1.fireplaces = 1
    house_1.basement = true
    house_1.taxes = 5763
    house_1.strata_fees = 0
    house_1.walkscore = 95
    house_1.save

  house_2 = Listing.new
    house_2.address = "3535 Puget Drive"
    house_2.city = "Vancouver"
    house_2.price = 5334120
    house_2.bedrooms = 5
    house_2.bathrooms = 5
    house_2.full_bathrooms = 4
    house_2.half_bathrooms = 1
    house_2.levels = 3
    house_2.size = 3828
    house_2.lot_size = 5500
    house_2.year_built = 2015
    house_2.home_type =  "House/Single Family"
    house_2.type_ownership = "Freehold NonStrata"
    # house_2.neighbourhood = "Arbutus Ridge" 
    house_2.postal_code = "V6L 2T6"
    house_2.property_summary = "5 bedroom 5 bathroom single family house in Arbutus Ridge."
    house_2.fireplaces = 1
    house_2.basement = true
    house_2.taxes = 9750
    house_2.strata_fees = 0
    house_2.walkscore = 62
    house_2.save

  house_3 = Listing.new
    house_3.address = "3898 3rd Avenue W"
    house_3.city = "Vancouver"
    house_3.price = 5344020
    house_3.bedrooms = 6
    house_3.bathrooms = 6
    house_3.full_bathrooms = 4
    house_3.half_bathrooms = 2
    house_3.levels = 3
    house_3.size = 4008
    house_3.lot_size = 5644.42
    house_3.year_built = 2015
    house_3.home_type =  "House/Single Family"
    house_3.type_ownership = "Freehold NonStrata"
    # house_3.neighbourhood = "Point Grey" 
    house_3.postal_code = "V6R 1M4"
    house_3.property_summary = "6 bedroom 6 bathroom single family house in Point Grey."
    house_3.fireplaces = 2
    house_3.basement = true
    house_3.taxes = 7392
    house_3.strata_fees = 0
    house_3.walkscore = 81
    house_3.save

  house_4 = Listing.new
    house_4.address = "2208 34th Avenue W"
    house_4.city = "Vancouver"
    house_4.price = 7504200
    house_4.bedrooms = 6
    house_4.bathrooms = 6
    house_4.full_bathrooms = 5
    house_4.half_bathrooms = 1
    house_4.levels = 3
    house_4.size = 5121
    house_4.lot_size = 8583
    house_4.year_built = 1996
    house_4.home_type =  "House/Single Family"
    house_4.type_ownership = "Freehold NonStrata"
    # house_4.neighbourhood = "Quilchena" 
    house_4.postal_code = "V6M 1G6"
    house_4.property_summary = "6 bedroom 6 bathroom single family house in Quilchena."
    house_4.fireplaces = 1
    house_4.basement = true
    house_4.taxes = 14854
    house_4.strata_fees = 0
    house_4.walkscore = 82
    house_4.save

  townhouse_1 = Listing.new
    townhouse_1.address = "645 7th Avenue W"
    townhouse_1.city = "Vancouver"
    townhouse_1.price = 683000
    townhouse_1.bedrooms = 1
    townhouse_1.bathrooms = 2
    townhouse_1.full_bathrooms = 1
    townhouse_1.half_bathrooms = 1
    townhouse_1.levels = 2
    townhouse_1.size = 921
    townhouse_1.lot_size = 0
    townhouse_1.year_built = 1988
    townhouse_1.home_type =  "Townhouse"
    townhouse_1.type_ownership = "Freehold Strata"
    # townhouse_1.neighbourhood = "Fairview" 
    townhouse_1.postal_code = "V5Z 1B6"
    townhouse_1.property_summary = "1 bedroom 2 bathroom townhouse in Fairview."
    townhouse_1.fireplaces = 3
    townhouse_1.basement = true
    townhouse_1.taxes = 1651
    townhouse_1.strata_fees = 325
    townhouse_1.walkscore = 96
    townhouse_1.save

  townhouse_2 = Listing.new
    townhouse_2.address = "1046 Nicola Street"
    townhouse_2.city = "Vancouver"
    townhouse_2.price = 401250
    townhouse_2.bedrooms = 1
    townhouse_2.bathrooms = 1
    townhouse_2.full_bathrooms = 0
    townhouse_2.half_bathrooms = 1
    townhouse_2.levels = 0
    townhouse_2.size = 410
    townhouse_2.lot_size = 0
    townhouse_2.year_built = 1996
    townhouse_2.home_type =  "Townhouse"
    townhouse_2.type_ownership = "Freehold Strata"
    # townhouse_2.neighbourhood = "West End" 
    townhouse_2.postal_code = "V6G 2C9"
    townhouse_2.property_summary = "1 bedroom 1 bathroom townhouse in the West End."
    townhouse_2.fireplaces = 5
    townhouse_2.basement = false
    townhouse_2.taxes = 1015
    townhouse_2.strata_fees = 153
    townhouse_2.walkscore = 97
    townhouse_2.save

  townhouse_3 = Listing.new
    townhouse_3.address = "312 - 3727 10th Avenue W"
    townhouse_3.city = "Vancouver"
    townhouse_3.price = 728000
    townhouse_3.bedrooms = 2
    townhouse_3.bathrooms = 2
    townhouse_3.full_bathrooms = 2
    townhouse_3.half_bathrooms = 0
    townhouse_3.levels = 2
    townhouse_3.size = 998
    townhouse_3.lot_size = 0
    townhouse_3.year_built = 2001
    townhouse_3.home_type =  "Townhouse"
    townhouse_3.type_ownership = "Freehold Strata"
    # townhouse_3.neighbourhood = "Point Grey" 
    townhouse_3.postal_code = "V6R 2G5"
    townhouse_3.property_summary = "2 bedroom 2 bathroom townhouse in Point Grey."
    townhouse_3.fireplaces = 1
    townhouse_3.basement = false
    townhouse_3.taxes = 2042
    townhouse_3.strata_fees = 310
    townhouse_3.walkscore = 93
    townhouse_3.save

  townhouse_4 = Listing.new
    townhouse_4.address = "111 - 6018 Iona Drive"
    townhouse_4.city = "Vancouver"
    townhouse_4.price = 1598000
    townhouse_4.bedrooms = 4
    townhouse_4.bathrooms = 4
    townhouse_4.full_bathrooms = 3
    townhouse_4.half_bathrooms = 1
    townhouse_4.levels = 4
    townhouse_4.size = 2316
    townhouse_4.lot_size = 0
    townhouse_4.year_built = 2002
    townhouse_4.home_type =  "Townhouse"
    townhouse_4.type_ownership = "Freehold Strata"
    # townhouse_4.neighbourhood = "Kerrisdale" 
    townhouse_4.postal_code = "V6T 2L1"
    townhouse_4.property_summary = "4 bedroom 4 bathroom townhouse in Kerrisdale."
    townhouse_4.fireplaces = 1
    townhouse_4.basement = true
    townhouse_4.taxes = 2466
    townhouse_4.strata_fees = 868
    townhouse_4.walkscore = 74
    townhouse_4.save

puts "There are now #{Listing.count} rows in the Listings table."