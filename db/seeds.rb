# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'csv'

csv_text = File.read(Rails.root.join('lib', 'seeds', 'homes.csv'))
csv = CSV.parse(csv_text, :headers => true)

csv.each do |row|
  t = Listing.new
  t.address = Faker::Address.street_address
  t.city = Faker::Address.city
  t.price = Faker::Commerce.price
  t.numOfBed = Faker::Number.digit
  t.numOfBath = Faker::Number.digit
  t.fullBathrooms = Faker::Number.digit
  t.halfBathrooms = Faker::Number.digit
  t.levels = Faker::Number.digit
  t.sqft = Faker::Number.between(500, 12,000)
  t.lotSize = Faker::Number.between(1000, 20,000)
  t.yearBuilt = Faker::Base.rand_in_range(1900, 2015) 
  t.homeType = row['random_type'] # FIX
  t.typeOwnership = row['random_ownership']
  t.extraFeaturesDescription = row['extraFeaturesDescription'] # REMOVE
  t.propertySummary = row['propertySummary'] # Change to automatically generated home info e.g., "5 bedroom, 4 bathroom house in Shaughnessy."
  t.postalCode = Faker::Address.postcode
  t.fireplaces = Faker::Number.digit
  t.basementArea = Faker::Boolean.boolean(0.2)
  t.taxes = Faker::Commerce.price
  t.strataFees = Faker::Commerce.price
  t.walkscore = Faker::Number.between(20, 99)
  t.daysListed = Faker::Number.between(1, 40)
  t.lastUpdated = Faker::Date.between(35.days.ago, Date.today)
  t.save
  puts row.to_hash
end

puts "There are now #{Listing.count} rows in the Listing table."