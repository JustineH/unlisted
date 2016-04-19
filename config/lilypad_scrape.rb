require 'nokogiri'
require 'open-uri'
require 'colorize'
require 'pry'

class Lilypad
  attr_accessor :address, :price, :bedroom, :bathroom, :sqft

  def initialize(url)
    @page = Nokogiri::HTML(open(url))
    @address = get_address
    @price = get_price
    @bedroom = get_bedroom
    @bathroom = get_bathroom
    @sqft = get_sqft
  end

  def get_address
    @page.search('.lb-address').map {|element| element.inner_text}
  end

  def get_price
    @page.search('.lb-price').map {|element| element.inner_text}
  end

  def get_bedroom
    @page.search('.lb-bed').map {|element| element.inner_text}
  end

  def get_bathroom
    @page.search('.lb-bath').map {|element| element.inner_text}
  end

  def get_sqft
    @page.search('.lb-size').map {|element| element.inner_text}
  end


  def to_s
    puts "_"*40
    puts "Address: ".colorize(:green) + "#{@address}"
    puts "_"*40
    puts "Price: ".colorize(:green) + "#{@price}"
    puts "_"*40
    puts "Bedrooms: ".colorize(:green) + "#{@bedroom}"
    puts "_"*40
    puts "Bathrooms: ".colorize(:green) + "#{@bathroom}"
    puts "_"*40
    puts "Size: ".colorize(:green) + "#{@sqft}"
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
    @taxes = get_taxes[31]
    @strata_fees = get_strata_fees[33]
    @area = get_area[38]
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
    @page.search('.priv').map {|element| element.inner_text}
  end

  def get_strata_fees
    @page.search('.priv').map {|element| element.inner_text}
  end

  def get_area
    @page.search('.priv').map {|element| element.inner_text}
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
    @lot = get_lot[37]
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
    @taxes = get_taxes[35]
    @area = get_area[42]
    @amenities = get_amenities[43]
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
    @page.search('.priv').map {|element| element.inner_text}
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
    @page.search('.priv').map {|element| element.inner_text}
  end

  def get_area
    @page.search('.priv').map {|element| element.inner_text}
  end
  
  def get_amenities
    @page.search('.priv').map {|element| element.inner_text}
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
    @lot = get_lot[33]
    @type = get_type[18]
    @year_built = get_year_built[13]
    @neighbourhood = get_neighbourhood
    @postal_code = get_postal_code.join
    @walkscore = get_walkscore
    @days_listed = get_days_listed[14]
    @last_updated = get_last_updated.join
    @property_summary = get_property_summary.join
    @ownership = get_ownership[20]
    @levels = get_levels[24]
    @full_bathrooms = get_full_bathrooms[26]
    @half_bathrooms = get_half_bathrooms[27]
    @fireplaces = get_fireplaces[28]
    @taxes = get_taxes[30]
    @strata_fees = get_strata_fees[32]
    @area = get_area[37]
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
    @page.search('.priv').map {|element| element.inner_text}
  end

  def get_strata_fees
    @page.search('.priv').map {|element| element.inner_text}
  end

  def get_area
    @page.search('.priv').map {|element| element.inner_text}
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


url = 'http://www.lilypad.ca/vancouver' #listings page
url2 = 'http://www.lilypad.ca/vancouver/1028-barclay-street/3205' # condos
url3 = 'http://www.lilypad.ca/vancouver/1081-w-7-avenue' # houses
url4 = 'http://www.lilypad.ca/vancouver/5188-main-street' #townhomes
lily = Lilypad.new(url)
# puts lily.to_s

lily_condo = Lilypad_Condo_Search.new(url2)
lily_condo.to_s
 

