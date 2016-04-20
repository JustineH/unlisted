require 'nokogiri'
require 'open-uri'
require 'colorize'
require 'csv'
require 'pry'

class Lilypad
  attr_accessor :address, :price, :bedroom, :bathroom, :sqft

  def initialize(url)
    @page = Nokogiri::HTML(open(url))
    @address = get_address
    # @price = get_price
    # @bedrooms = get_bedroom
    # @bathrooms = get_bathroom
    # @sqft = get_sqft
  end

  def get_address
    @page.search('.lb-address').map {|element| element.inner_text}
  end

  # def get_price
  #   @page.search('.lb-price').map {|element| element.inner_text}
  # end

  # def get_bedrooms
  #   @page.search('.lb-bed').map {|element| element.inner_text}
  # end

  # def get_bathrooms
  #   @page.search('.lb-bath').map {|element| element.inner_text}
  # end

  # def get_sqft
  #   @page.search('.lb-size').map {|element| element.inner_text}
  # end


  # def csv
  #   CSV.open("file.csv", "ab") do |csv|
  #     csv << %w[city address price bedrooms bathrooms sqft]
  #       csv << [@city, @address, @price, @bedrooms, @bathrooms, @sqft]
  #   end
  # end


  def to_s
  #   puts "_"*40
    puts "Address: ".colorize(:green) + "#{@address}"
  #   puts "_"*40
  #   puts "Price: ".colorize(:green) + "#{@price}"
  #   puts "_"*40
  #   puts "Bedrooms: ".colorize(:green) + "#{@bedroom}"
  #   puts "_"*40
  #   puts "Bathrooms: ".colorize(:green) + "#{@bathroom}"
  #   puts "_"*40
  #   puts "Size: ".colorize(:green) + "#{@sqft}"
  end
end


class Lilypad_Condo_Search 

  attr_accessor :address, :city, :price, :bedrooms, :bathrooms, :size, :type, :year_built, :neighbourhood, :postal_code, :walkscore, :days_listed, :last_updated, :property_summary, :ownership, :levels, :full_bathrooms, :half_bathrooms, :fireplaces, :taxes, :strata_fees, :area, :image

  def initialize(url2)
    @page = Nokogiri::HTML(open(url2))
    @address = get_address.join
    @city = get_city.join
    @price = get_price[7]
    @bedrooms = get_bedrooms[4]
    @bathrooms = get_bathrooms[5]
    @size = get_size[6]
    @type = get_type[12]
    @year_built = get_year_built[13]
    @neighbourhood = get_neighbourhood
    @postal_code = get_postal_code.join
    @walkscore = get_walkscore
    @days_listed = get_days_listed[14]
    @last_updated = get_last_updated.join
    @property_summary = get_property_summary
    @ownership = get_ownership[20]
    @levels = get_levels[24]
    @full_bathrooms = get_full_bathrooms[26]
    @half_bathrooms = get_half_bathrooms[27]
    @fireplaces = get_fireplaces[28]
    @taxes = get_taxes
    @strata_fees = get_strata_fees
    @area = get_area
    @image = get_image
  end

  def get_address
    @page.search('.listing-street').map {|element| element.inner_text}
  end

  def get_city
    @page.search('.listing-city').map {|element| element.inner_text}
  end

  def get_price
    @page.search('.priv').map {|element| element.inner_text}
  end

  def get_bedrooms
    @page.search('.priv').map {|element| element.inner_text}
  end

  def get_bathrooms
    @page.search('.priv').map {|element| element.inner_text}
  end

  def get_size
    @page.search('.priv').map {|element| element.inner_text}
  end

  def get_type
    @page.search('.priv').map {|element| element.inner_text}
  end

  def get_year_built
    @page.search('.priv').map {|element| element.inner_text}
  end

  def get_neighbourhood
    @page.search("[text()*='Neighbourhood']").first.next_element.text
  end

  def get_postal_code
    @page.search('.listing-postal-code').map {|element| element.inner_text}
  end

  def get_walkscore
    @page.search("[text()*='Walkscore']").first.next_element.text
  end

  def get_days_listed
    @page.search('.priv').map {|element| element.inner_text}
  end

  def get_last_updated
    @page.search('.last-updated').map {|element| element.inner_text}
  end

  def get_property_summary
    @page.search('.listing-description > p').map {|element| element.inner_text}
  end

  def get_ownership
    @page.search('.priv').map {|element| element.inner_text}
  end

  def get_levels
    @page.search('.priv').map {|element| element.inner_text}
  end

  def get_full_bathrooms
    @page.search('.priv').map {|element| element.inner_text}
  end

  def get_half_bathrooms
    @page.search('.priv').map {|element| element.inner_text}
  end

  def get_fireplaces
    @page.search('.priv').map {|element| element.inner_text}
  end

  def get_taxes
    @page.search("[text()*='Taxes']").first.next_element.text
  end

  def get_strata_fees
    @page.search("[text()*='Strata Fees']").first.next_element.text
  end

  def get_area
    @page.search("[text()*='Area']").first.next_element.text
  end
  
  def get_image
    condo_image = @page.css('div.listing-image-all-photo').map{|e| e.attributes["data-bg"].value}
    if condo_image.length < 2
      single_img = @page.css('a.listing-image-main-photo img').map{|e| e.attributes["src"].value}
      single_img
    else
      condo_image
    end
  end

  def csv
    CSV.open("condos.csv", "ab") do |csv|
      csv << [@address, @city, @price, @bedrooms, @bathrooms, @full_bathrooms, @half_bathrooms, @levels, @size, @lot, @year_built, @type, @ownership, @area, @postal_code, @property_summary, @fireplaces, @basement_area, @taxes, @strata_fees, @walkscore, @days_listed, @last_updated, @image]
    end
  end


  def to_s
    puts "Condo listings: ".colorize(:red)
    puts "The url for this page will look like this for Vancouver:".colorize(:blue)
    puts "http://www.lilypad.ca/vancouver/(street address)/(house number)".colorize(:blue)
    puts "For example: ".colorize(:green) + "http://www.lilypad.ca/vancouver/1028-barclay-street/3205".colorize(:magenta)
    puts "-"*40
    puts "Address: ".colorize(:green) + " #{@address}"
    puts "-"*40
    puts "City: ".colorize(:green) + " #{@city}"
    puts "-"*40
    puts "Price: ".colorize(:green) + " #{@price}"
    puts "-"*40
    puts "Bedrooms: ".colorize(:green) + "#{@bedrooms}"
    puts "-"*40
    puts "Bathrooms: ".colorize(:green) + "#{@bathrooms}"
    puts "-"*40
    puts "Full bathrooms: ".colorize(:green) + "#{@full_bathrooms}"
    puts "-"*40
    puts "Half bathrooms: ".colorize(:green) + "#{@half_bathrooms}"
    puts "-"*40
    puts "Levels: ".colorize(:green) + "#{@levels}"
    puts "-"*40
    puts "Fireplaces: ".colorize(:green) + "#{@fireplaces}"
    puts "-"*40
    puts "Size (sq ft): ".colorize(:green) + "#{@size}"
    puts "-"*40
    puts "Type: ".colorize(:green) + "#{@type}"
    puts "-"*40
    puts "Ownership: ".colorize(:green) + "#{@ownership}"
    puts "-"*40
    puts "Year Built: ".colorize(:green) + "#{@year_built}"
    puts "-"*40
    puts "Neighbourhood: ".colorize(:green) + "#{@neighbourhood}"
    puts "-"*40
    puts "Postal Code: ".colorize(:green) + "#{@postal_code}"
    puts "-"*40
    puts "Property Summary: ".colorize(:green) + "#{@property_summary}"
    puts "-"*40
    puts "Walkscore: ".colorize(:green) + "#{@walkscore}"
    puts "-"*40
    puts "Taxes (est.): ".colorize(:green) + " #{@taxes}"
    puts "-"*40
    puts "Strata Fees: ".colorize(:green) + "#{@strata_fees}"
    puts "-"*40
    puts "Area: ".colorize(:green) + "#{@area}"
    puts "-"*40
    puts "Days Listed: ".colorize(:green) + "#{@days_listed}"
    puts "-"*40
    puts "Last Updated: ".colorize(:green) + "#{@last_updated}"
    puts "-"*40
    puts "Image(url(s)): ".colorize(:green) + "#{image}"
  end
end  


class Lilypad_House_Search 

  attr_accessor :address, :city, :price, :bedrooms, :bathrooms, :size, :lot, :type, :year_built, :neighbourhood, :postal_code, :walkscore, :days_listed, :last_updated, :property_summary, :ownership, :levels, :full_bathrooms, :half_bathrooms, :basement_area, :fireplaces, :taxes, :area, :amenities, :image

  def initialize(url3)
    @page = Nokogiri::HTML(open(url3))
    @address = get_address.join
    @city = get_city.join
    @price = get_price[2]
    @bedrooms = get_bedrooms[4]
    @bathrooms = get_bathrooms[5]
    @size = get_size[6]
    @lot = get_lot
    @type = get_type[12]
    @year_built = get_year_built
    @neighbourhood = get_neighbourhood
    @postal_code = get_postal_code.join
    @walkscore = get_walkscore
    @days_listed = get_days_listed[3]
    @last_updated = get_last_updated.join
    @property_summary = get_property_summary.join
    @ownership = get_ownership[21]
    @levels = get_levels[25]
    @full_bathrooms = get_full_bathrooms[27]
    @half_bathrooms = get_half_bathrooms[28]
    @basement_area = get_basement_area[30]
    @fireplaces = get_fireplaces[28]
    @taxes = get_taxes
    @area = get_area
    @amenities = get_amenities
    @image = get_image
  end

  def get_address
    @page.search('.listing-street').map {|element| element.inner_text}
  end

  def get_city
    @page.search('.listing-city').map {|element| element.inner_text}
  end

  def get_price
    @page.search('.priv').map {|element| element.inner_text}
  end

  def get_bedrooms
    @page.search('.priv').map {|element| element.inner_text}
  end

  def get_bathrooms
    @page.search('.priv').map {|element| element.inner_text}
  end

  def get_size
    @page.search('.priv').map {|element| element.inner_text}
  end

  def get_lot
    @page.search("[text()*='Lot Size (sq ft)']").first.next_element.text
  end

  def get_type
    @page.search('.priv').map {|element| element.inner_text}
  end

  def get_year_built
    @page.search("[text()*='Year Built']").first.next_element.text
  end

  def get_neighbourhood
    @page.search("[text()*='Neighbourhood']").first.next_element.text
  end

  def get_postal_code
    @page.search('.listing-postal-code').map {|element| element.inner_text}
  end

  def get_walkscore
    @page.search("[text()*='Walkscore']").first.next_element.text
  end

  def get_days_listed
    @page.search('.priv').map {|element| element.inner_text}
  end

  def get_last_updated
    @page.search('.last-updated').map {|element| element.inner_text}
  end

  def get_property_summary
    @page.search('.listing-description > p').map {|element| element.inner_text}
  end

  def get_ownership
    @page.search('.priv').map {|element| element.inner_text}
  end

  def get_levels
    @page.search('.priv').map {|element| element.inner_text}
  end

  def get_full_bathrooms
    @page.search('.priv').map {|element| element.inner_text}
  end

  def get_half_bathrooms
    @page.search('.priv').map {|element| element.inner_text}
  end

  def get_basement_area
    @page.search('.priv').map {|element| element.inner_text}
  end

  def get_fireplaces
    @page.search('.priv').map {|element| element.inner_text}
  end

  def get_taxes
    @page.search("[text()*='Taxes']").first.next_element.text
  end

  def get_area
    @page.search("[text()='Area']").first.next_element.text 
  end
  
  def get_amenities
    amenities = @page.search("[text()='Amenities']").first
    amenities_class = amenities.attributes["class"].value
    if amenities_class.include? "column-label"
      amenities.next_element.text 
    else
      ""
    end
  end

  def get_image
    house_image = @page.css('div.listing-image-all-photo').map{|e| e.attributes["data-bg"].value}
    if house_image.length < 2
      single_img = @page.css('a.listing-image-main-photo img').map{|e| e.attributes["src"].value}
      single_img
    else
      house_image
    end
  end

  def csv
    CSV.open("homes.csv", "ab") do |csv|
      csv << [@address, @city, @price, @bedrooms, @bathrooms, @full_bathrooms, @half_bathrooms, @levels, @size, @lot, @year_built, @type, @ownership, @area, @postal_code, @property_summary, @fireplaces, @basement_area, @taxes, @strata_fees, @walkscore, @days_listed, @last_updated, @image]
    end
  end


  def to_s
    puts "House listings: ".colorize(:red)
    puts "The url for this page will look like this for Vancouver:".colorize(:blue)
    puts "http://www.lilypad.ca/vancouver/(street address)/(house number)".colorize(:blue)
    puts "For example: ".colorize(:green) + "http://www.lilypad.ca/vancouver/1081-w-7-avenue".colorize(:magenta)
    puts "-"*40
    puts "Address: ".colorize(:green) + " #{@address}"
    puts "-"*40
    puts "City: ".colorize(:green) + " #{@city}"
    puts "-"*40
    puts "Price: ".colorize(:green) + " #{@price}"
    puts "-"*40
    puts "Bedrooms: ".colorize(:green) + "#{@bedrooms}"
    puts "-"*40
    puts "Bathrooms: ".colorize(:green) + "#{@bathrooms}"
    puts "-"*40
    puts "Full bathrooms: ".colorize(:green) + "#{@full_bathrooms}"
    puts "-"*40
    puts "Half bathrooms: ".colorize(:green) + "#{@half_bathrooms}"
    puts "-"*40
    puts "Levels: ".colorize(:green) + "#{@levels}"
    puts "-"*40
    puts "Fireplaces: ".colorize(:green) + "#{@fireplaces}"
    puts "-"*40
    puts "Basement Area: ".colorize(:green) + "#{@basement_area}"
    puts "-"*40
    puts "Size (sq ft): ".colorize(:green) + "#{@size}"
    puts "-"*40
    puts "Lot (sq ft): ".colorize(:green) + "#{@lot}"
    puts "-"*40
    puts "Type: ".colorize(:green) + "#{@type}"
    puts "-"*40
    puts "Ownership: ".colorize(:green) + "#{@ownership}"
    puts "-"*40
    puts "Year Built: ".colorize(:green) + "#{@year_built}"
    puts "-"*40
    puts "Neighbourhood: ".colorize(:green) + "#{@neighbourhood}"
    puts "-"*40
    puts "Postal Code: ".colorize(:green) + "#{@postal_code}"
    puts "-"*40
    puts "Property Summary: ".colorize(:green) + "#{@property_summary}"
    puts "-"*40
    puts "Taxes (est.): ".colorize(:green) + " #{@taxes}"
    puts "-"*40
    puts "Walkscore: ".colorize(:green) + "#{@walkscore}"
    puts "-"*40
    puts "Area: ".colorize(:green) + "#{@area}"
    puts "-"*40
    puts "Amenities: ".colorize(:green) + "#{@amenities}"
    puts "-"*40
    puts "Days Listed: ".colorize(:green) + "#{@days_listed}"
    puts "-"*40
    puts "Last Updated: ".colorize(:green) + "#{@last_updated}"
    puts "-"*40
    puts "Image(url(s)): ".colorize(:green) + "#{image}"
  end
end



class Lilypad_Townhouse_Search 

  attr_accessor :address, :city, :price, :bedrooms, :bathrooms, :size, :lot, :type, :year_built, :neighbourhood, :postal_code, :walkscore, :days_listed, :last_updated, :property_summary, :ownership, :levels, :full_bathrooms, :half_bathrooms, :basement_area, :fireplaces, :taxes, :strata_fees, :area, :image

  def initialize(url4)
    @page = Nokogiri::HTML(open(url4))
    @address = get_address.join
    @city = get_city.join
    @price = get_price[7]
    @bedrooms = get_bedrooms[4]
    @bathrooms = get_bathrooms[5]
    @size = get_size[6]
    @lot = get_lot
    @type = get_type[18]
    @year_built = get_year_built[13]
    @neighbourhood = get_neighbourhood
    @postal_code = get_postal_code.join
    @walkscore = get_walkscore
    @days_listed = get_days_listed[14]
    @last_updated = get_last_updated.join
    @property_summary = get_property_summary.join
    @ownership = get_ownership
    @levels = get_levels[24]
    @full_bathrooms = get_full_bathrooms[26]
    @half_bathrooms = get_half_bathrooms[27]
    @fireplaces = get_fireplaces[28]
    @taxes = get_taxes
    @strata_fees = get_strata_fees[32]
    @area = get_area
    @image = get_image
  end

  def get_address
    @page.search('.listing-street').map {|element| element.inner_text}
  end

  def get_city
    @page.search('.listing-city').map {|element| element.inner_text}
  end

  def get_price
    @page.search('.priv').map {|element| element.inner_text}
  end

  def get_bedrooms
    @page.search('.priv').map {|element| element.inner_text}
  end

  def get_bathrooms
    @page.search('.priv').map {|element| element.inner_text}
  end

  def get_size
    @page.search('.priv').map {|element| element.inner_text}
  end

  def get_lot
    @page.search("[text()*='Lot Size (sq ft)']").first.next_element.text
  end

  def get_type
    @page.search('.priv').map {|element| element.inner_text}
  end

  def get_year_built
    @page.search('.priv').map {|element| element.inner_text}
  end

  def get_neighbourhood
    @page.search("[text()*='Neighbourhood']").first.next_element.text
  end

  def get_postal_code
    @page.search('.listing-postal-code').map {|element| element.inner_text}
  end

  def get_walkscore
    @page.search("[text()*='Walkscore']").first.next_element.text
  end

  def get_days_listed
    @page.search('.priv').map {|element| element.inner_text}
  end

  def get_last_updated
    @page.search('.last-updated').map {|element| element.inner_text}
  end

  def get_property_summary
    @page.search('.listing-description > p').map {|element| element.inner_text}
  end

  def get_ownership
    @page.search("[text()*='Ownership']").first.next_element.text
  end

  def get_levels
    @page.search('.priv').map {|element| element.inner_text}
  end

  def get_full_bathrooms
    @page.search('.priv').map {|element| element.inner_text}
  end

  def get_half_bathrooms
    @page.search('.priv').map {|element| element.inner_text}
  end

  def get_fireplaces
    @page.search('.priv').map {|element| element.inner_text}
  end

  def get_taxes
    @page.search("[text()*='Taxes']").first.next_element.text
  end

  def get_strata_fees
    @page.search('.priv').map {|element| element.inner_text}
  end

  def get_area
    @page.search("[text()*='Area']").first.next_element.text
  end
  
  def get_image
    townhouse_image = @page.css('div.listing-image-all-photo').map{|e| e.attributes["data-bg"].value}
    if townhouse_image.length < 2
      single_img = @page.css('a.listing-image-main-photo img').map{|e| e.attributes["src"].value}
      single_img
    else
      townhouse_image
    end
  end


  def csv
    CSV.open("homes.csv", "ab") do |csv|
      csv << [@address, @city, @price, @bedrooms, @bathrooms, @full_bathrooms, @half_bathrooms, @levels, @size, @lot, @year_built, @type, @ownership, @area, @postal_code, @property_summary, @fireplaces, @basement_area, @taxes, @strata_fees, @walkscore, @days_listed, @last_updated, @image]
    end
  end

  def to_s
    puts "Townhouse listings: ".colorize(:red)
    puts "The url for this page will look like this for Vancouver:".colorize(:blue)
    puts "http://www.lilypad.ca/vancouver/(street address)/(house number)".colorize(:blue)
    puts "For example: ".colorize(:green) + "http://www.lilypad.ca/vancouver/5188-main-street".colorize(:magenta)
    puts "-"*40
    puts "Address: ".colorize(:green) + " #{@address}"
    puts "-"*40
    puts "City: ".colorize(:green) + " #{@city}"
    puts "-"*40
    puts "Price: ".colorize(:green) + " #{@price}"
    puts "-"*40
    puts "Bedrooms: ".colorize(:green) + "#{@bedrooms}"
    puts "-"*40
    puts "Bathrooms: ".colorize(:green) + "#{@bathrooms}"
    puts "-"*40
    puts "Full bathrooms: ".colorize(:green) + "#{@full_bathrooms}"
    puts "-"*40
    puts "Half bathrooms: ".colorize(:green) + "#{@half_bathrooms}"
    puts "-"*40
    puts "Levels: ".colorize(:green) + "#{@levels}"
    puts "-"*40
    puts "Fireplaces: ".colorize(:green) + "#{@fireplaces}"
    puts "-"*40
    puts "Size (sq ft): ".colorize(:green) + "#{@size}"
    puts "-"*40
    puts "Lot (sq ft): ".colorize(:green) + "#{@lot}"
    puts "-"*40
    puts "Type: ".colorize(:green) + "#{@type}"
    puts "-"*40
    puts "Ownership: ".colorize(:green) + "#{@ownership}"
    puts "-"*40
    puts "Year Built: ".colorize(:green) + "#{@year_built}"
    puts "-"*40
    puts "Neighbourhood: ".colorize(:green) + "#{@neighbourhood}"
    puts "-"*40
    puts "Postal Code: ".colorize(:green) + "#{@postal_code}"
    puts "-"*40
    puts "Property Summary: ".colorize(:green) + "#{@property_summary}"
    puts "-"*40
    puts "Walkscore: ".colorize(:green) + "#{@walkscore}"
    puts "-"*40
    puts "Taxes (est.): ".colorize(:green) + " #{@taxes}"
    puts "-"*40
    puts "Strata Fees: ".colorize(:green) + " #{@strata_fees}"
    puts "-"*40
    puts "Area: ".colorize(:green) + "#{@area}"
    puts "-"*40
    puts "Days Listed: ".colorize(:green) + "#{@days_listed}"
    puts "-"*40
    puts "Last Updated: ".colorize(:green) + "#{@last_updated}"
    puts "-"*40
    puts "Image(url(s)): ".colorize(:green) + "#{image}"
  end
end


# url = 'http://www.lilypad.ca/vancouver' #listings page
# url2 = 'http://www.lilypad.ca/vancouver/1028-barclay-street/3205' # condos
# url3 = 'http://www.lilypad.ca/vancouver/1081-w-7-avenue' # houses
# url4 = 'http://www.lilypad.ca/vancouver/5188-main-street' #townhomes
# lily = Lilypad.new(url)
# puts lily.to_s

# i = 2
# while i < 10
#   url = "http://www.lilypad.ca/vancouver/houses/page-#{i}"
#   lily = Lilypad.new(url)
#   puts lily.to_s
#   i += 1
# end

# lily_condo = Lilypad_Condo_Search.new(url2)
# lily_condo.to_s


 
# loop through condo listings
unformatted_addresses = ["1302-555 Jervis Street", "3701-833 Seymour Street", "206-5189 Gaston Street", "205-2388 Western Parkway", "515-4078 Knight Street", "527-4078 Knight Street", "709-1708 Columbia Street", "309-1331 Alberni Street", "3207-688 Abbott Street", "1206-120 Milross Avenue", "2506-1111 Alberni Street", "1316-938 Smithe Street", "2600-1280 Richards Street", "1701-2688 West Mall", "2307-1155 Seymour Street", "1007-480 Robson Street", "ph3-505 30th Avenue W", "1102-1501 Howe Street", "1806-8555 Granville Street", "419-3333 Main Street", "405-5989 Iona Drive", "1808-1850 Comox Street", "108-8989 Hudson Street", "409-2101 Mcmullen Avenue", "114-2556 Hastings Street E", "203-2008 54th Avenue E", "317-3289 Riverwalk Avenue", "1001-728 8th Avenue W", "512-3289 Riverwalk Avenue", "ph1-5555 Victoria Drive", "2904-977 Mainland Street", "404-2001 Wall Street", "115-444 49th Avenue W", "1804-1199 Seymour Street", "209-2828 Main Street", "3764 Commercial Street", "204-488 Helmcken Street", "201-1010 Burnaby Street", "401-1010 Richards Street", "1410-1050 Burrard Street", "1008-5728 Berton Avenue", "3102-833 Seymour Street", "505-438 Seymour Street", "503-2108 38th Avenue W", "405-1478 Hastings Street W", "1503-2688 West Mall", "402-1989 Dunbar Street", "105-225 19th Avenue E", "103-2910 Ontario Street", "301-2023 Franklin Street", "216-1422 3rd Avenue E", "701-1409 Pender Street W", "303-1367 Alberni Street", "1801-1171 Jervis Street", "2501-1077 Cordova Street W", "1502-928 Richards Street", "1802-1166 Melville Street", "1002-1530 8th Avenue W", "406-328 11th Avenue E", "310-688 Fairchild Road", "501-997 22nd Avenue W", "2103-188 Keefer Place", "312-1405 15th Avenue W", "802-488 Marine Drive SW", "ph3-2528 Collingwood Street", "506-6063 Iona Drive", "403-1530 8th Avenue W", "1605-1238 Melville Street", "510-1288 Marinaside Crescent", "107-3626 28th Avenue W", "204-2159 Wall Street", "1304-4655 Valley Drive", "1009-8031 Nunavut Lane", "204-1535 Nelson Street", "305-1661 Ontario Street", "405-833 16th Avenue W", "3301-233 Robson Street", "204-2480 3rd Avenue W", "707-535 Smithe Street", "404-288 8th Avenue E", "411-5835 Hampton Place", "900-1919 Beach Avenue", "104-3575 Euclid Avenue", "213-428 8th Avenue W", "307-1188 Richards Street", "301-1925 Alberni Street", "511-1088 Richards Street", "1202-1438 Richards Street", "102-3680 Oak Street", "1203-1188 Quebec Street", "113-5355 Boundary Road", "1307-821 Cambie Street", "ph8-1288 Georgia Street W", "302-1438 Richards Street", "904-128 Cordova Street W", "106-2190 7th Avenue W", "1501-289 Drake Street", "105-2960 29th Street E", "101-5725 Agronomy Road", "105-735 15th Avenue W", "3205-1028 Barclay Street", "802-1480 Howe Street", "1501-3588 Crowley Drive", "2106-1723 Alberni Street", "308-4989 Duchess Street", "708-518 14th Avenue W", "1901-1331 Alberni Street", "210-6328 Larkin Drive", "1603-8588 Cornish Street", "3706-928 Beatty Street", "406-5725 Agronomy Road", "204-3289 Riverwalk Avenue", "603-3289 Riverwalk Avenue", "509-977 Mainland Street", "510-3289 Riverwalk Avenue", "309-6268 Eagles Drive", "1005-1650 7th Avenue W", "213-3289 Riverwalk Avenue", "203-33 Templeton Drive N", "1001-555 Jervis Street", "107-3289 Riverwalk Avenue", "204-830 7th Avenue E", "301-5728 Berton Avenue", "202-1860 Robson Street", "1801-1438 Richards Street", "1401-181 1st Avenue W", "501-6929 Cambie Street", "601-908 Keith Road", "2703-1189 Melville Street", "2-2880 33rd Avenue W", "307-3520 Crowley Drive", "19-2156 12th Avenue W", "ph6-5555 Victoria Drive", "608-5782 Berton Avenue", "209-3520 Crowley Drive", "310-3289 Riverwalk Avenue", "1706-950 Cambie Street", "3503-128 Cordova Street W", "906-5775 Hampton Place", "2309-938 Smithe Street", "302-5025 Joyce Street", "10-1038 7th Avenue W"].shuffle

# Loop through home listings
# unformatted_addresses = ["4249 Hudson Street", "4150 Victoria Drive", "4275 Skeena Street", "3830 Victoria Drive", "6462 Macdonald Street", "3159 28th Avenue W", "1370 10th Avenue E", "3617 35th Avenue W", "4585 Prince Albert Street", "2088 17th Avenue W", "4716 Fairmont Street", "2838 Broadway E", "1343 14th Avenue E", "3380 Crown Street", "1760 37th Avenue E", "1320 33rd Avenue W", "1748 46th Avenue E", "4458 Brakenridge Street", "1411 62nd Avenue W", "2720 6th Avenue W", "5921 Prince Albert Street", "2766 Turner Street", "1707 Prestwick Drive", "2209 51st Avenue W", "2922 22nd Avenue W", "3133 21st Avenue E", "4662 Puget Drive", "2733 Franklin Street", "425 56th Avenue E", "2790 27th Avenue E", "395 49th Avenue W", "1861 39th Avenue E", "1891 Upland Drive", "2091 20th Avenue E", "3227 21st Avenue E", "5661 Highbury Street", "2823 Woodland Drive", "2807 Eton Street", "3179 49th Avenue W", "1122 27th Avenue W", "4140 Crown Crescent", "1987 Charles Street", "3951 18th Avenue W", "62 19th Avenue W", "3115 Broadway E", "1816 12th Avenue E", "4975 Chester Street", "53 23rd Avenue W", "3771 15th Avenue W", "6218 Oak Street", "3985 14th Avenue W", "153 19th Avenue W", "2949 52nd Avenue E", "2261 35th Avenue E", "4010 Inverness Street", "2796 21st Avenue W", "3562 Bella Vista Street", "1688 Marine Drive SW", "1081 7 Avenue W", "419 19th Avenue W", "1676 Marine Drive SW", "2545 15th Avenue W", "6698 Brooks Street", "1369 55th Avenue W", "832 17 Avenue W", "3894 11th Avenue W", "675 32nd Avenue W", "2624 3rd Avenue W", "1437 32nd Avenue W", "2715 47th Avenue E", "3617 12th Avenue W", "1522 20th Avenue E", "1566 65th Avenue W", "3517 3rd Avenue W", "2213 Renfrew Street", "2765 8th Avenue W", "4655 6th Avenue W", "2208 34th Avenue W", "2344 37th Avenue W", "3535 Puget Drive", "1303 Park Drive", "6592 Maple Street", "2719 15th Avenue W", "6222 Mccleery Street", "4553 Fraser Street", "3312 Parker Street", "2781 27th Avenue E", "477 63rd Avenue W", "1161 Keefer Street", "1250 40th Avenue W", "3626 22nd Avenue W", "3433 22nd Avenue W", "4519 Culloden Street", "16 Kaslo Street N", "3715 22nd Avenue W", "4015 30th Avenue W", "4679 13th Avenue W", "2375 45th Avenue W", "3371 Napier Street", "3898 3rd Avenue W", "4509 Slocan Street", "5695 Ormidale Street", "2227 37th Avenue E", "2006 48th Avenue W", "3533 Point Grey Road", "731 17th Avenue W", "429 Pender Street E", "6611 Cartier Street", "3095 5th Avenue W", "2032 22nd Avenue E", "1459 41st Avenue W", "1449 41st Avenue W", "3998 Granville Street", "731 Union Street", "3460 Georgia Street E", "1384 63rd Avenue E", "5350 Slocan Street", "4108 Gladstone Street", "2817 Fraser Street", "2846 30th Avenue W", "7061 Adera Street", "2849 King Edward Avenue W", "119 41st Avenue W", "81 49th Avenue W", "2485 Wall Street", "66 23rd Avenue E", "5315 Ash Street", "3556 34th Avenue W", "1218 14th Avenue E", "3848 29th Avenue W", "128 41st Avenue W", "3125 18th Avenue W", "7575 Ash Street", "3821 22nd Avenue W", "3805 24th Avenue W", "2825 Venables Street", "3562 34th Avenue W", "7259 Elmhurst Drive", "3385 6th Avenue E", "6599 Churchill Street", "295 30th Avenue E", "2773 Dundas Street", "3057 44th Avenue W", "7506 Prince Edward Street", "10 Dieppe Place", "4675 Rupert Street", "6449 Dumfries Street", "2608 Georgia Street E", "4578 John Street", "5665 Lancaster Street", "3181 54th Avenue E", "5821 Latta Street", "2732 53rd Avenue E", "6990 Lancaster Street", "2425 26th Avenue E", "1461 Connaught Drive", "3932 Osler Street", "957 62nd Avenue E", "3061 Parker Street", "3440 22nd Avenue E"]

def format_address(arr)
  downcase_arr = arr.map(&:downcase)
  formatted_arr = downcase_arr.map{|a| a.gsub(", ", "").gsub(" ", "-")}
  # puts formatted_arr
end
 # puts format_address(unformatted_addresses)
formatted_address = format_address(unformatted_addresses)

formatted_address.each do |address|
  begin
  #condos
    if address.match(/\d{3,4}[-]\d{3,4}/)
      condo_address = address.gsub(/^\d{3,4}-/, "")
      condo_number = address.match(/\d{3,4}/)
      url1 = "https://www.lilypad.ca/vancouver/" + "#{condo_address}/" + "#{condo_number}"
      lilypad_condo = Lilypad_Condo_Search.new(url1)
      # puts lilypad_condo.to_s
      lilypad_condo.csv
    else #houses 
      url3 = "https://www.lilypad.ca/vancouver/" + "#{address}"
      lilypad_house = Lilypad_House_Search.new(url3)
      # puts lilypad_house.to_s
      lilypad_house.csv
    end
    rescue OpenURI::HTTPError
  end
end




