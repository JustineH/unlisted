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
  t.address = row['address']
  t.city = row['city']
  t.price = row['price']
  t.numOfBed = row['numOfBed']
  t.numOfBath = row['numOfBath']
  t.fullBathrooms = row['fullBathrooms']
  t.halfBathrooms = row['halfBathrooms']
  t.levels = row['levels']
  t.sqft = row['sqft']
  t.lotSize = row['lotSize']
  t.yearBuilt = row['yearBuilt']
  t.homeType = row['homeType']
  t.typeOwnership = row['typeOwnership']
  t.extraFeaturesDescription = row['extraFeaturesDescription']
  t.propertySummary = row['propertySummary']
  t.postalCode = row['postalCode']
  t.fireplaces = row['fireplaces']
  t.basementArea = row['basementArea']
  t.taxes = row['taxes']
  t.strataFees = row['strataFees']
  t.propertySummary = row['propertySummary']
  t.walkscore = row['walkscore']
  t.daysListed = row['daysListed']
  t.lastUpdated = row['lastUpdated']
  t.save
  puts row.to_hash
end

puts "there are now #{Listing.count} rows in the Listing table"