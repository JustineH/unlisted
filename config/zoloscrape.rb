require 'nokogiri'
require "css_parser"
require 'csv'
require 'open-uri'
require 'colorize'

class Zolo
  attr_accessor :city, :address, :price, :bedroom, :bathroom, :sqft, :age

  def initialize(url)
    @page = Nokogiri::HTML(open(url))
    @city = get_city
    @address = get_address
    @price = get_price
    @bedroom = get_bedroom
    @bathroom = get_bathroom
    @sqft = get_sqft
    @age = get_age
  end

  def get_city
    @page.search('.city').map {|element| element.inner_text}
  end

  def get_address
    @page.search('.street').map{|element| element.inner_text}
  end

  def get_price
    @page.search('.price').map{|element| element.inner_text}
  end

  def get_bedroom
    @page.search('.bedrooms>span').map {|element| element.inner_text}
  end

  def get_bathroom
    @page.search('.bathrooms>span').map {|element| element.inner_text}
  end

  def get_sqft
    @page.search('.sqft>span').map {|element| element.inner_text}
  end

  def get_age
    @page.search('.age>span').map {|element| element.inner_text}
  end

  def csv
    CSV.open("file.csv", "ab") do |csv|
      csv << %w[city address price bedroom bathroom sqft age]
        csv << [@city, @address, @price, @bedroom, @bathroom, @sqft, @age]
    end
  end
  
  def to_s
    puts "-"*40
    puts "City:".colorize(:green) + " #{@city}"
    puts "-"*40
    puts "Address:".colorize(:green) + " #{@address}"
    puts "-"*40
    puts "Price:".colorize(:green) + " #{@price}"
    puts "-"*40    
    puts "Bedrooms:".colorize(:green) + " #{@bedroom}"
    puts "-"*40
    puts "Bathrooms:".colorize(:green) + " #{@bathroom}"
    puts "-"*40
    puts "Square feet:".colorize(:green) + " #{@sqft}"
    puts "-"*40
    puts "Age:".colorize(:green) + " #{@age}"
   end
end

class Zolo_Condo_Search 

  attr_accessor :mortgage, :taxes, :type, :year, :walkscore, :about, :bedrooms, :full_bathrooms, :half_bathrooms, :fireplaces, :tax_year, :strata_fees, :area, :levels, :image

  def initialize(url2)
    @page = Nokogiri::HTML(open(url2))
    @address = get_address[0]
    @mortgage = get_mortgage[0]
    @taxes = get_taxes[0]
    @type = get_type[2] #house type
    @year = get_year[5]
    @walkscore = get_walkscore[7]
    @about = get_about
    @levels = get_levels[16]
    @bedrooms = get_bedrooms[17]
    @bathrooms = get_bathrooms
    @size = get_size[7]
    @full_bathrooms = get_full_bathrooms[18]
    @half_bathrooms = get_half_bathrooms[19]
    @fireplaces = get_fireplaces[20]
    @tax_year = get_tax_year[28]
    @strata_fees = get_strata_fees[29]
    @area = get_area.last  #i.e. Vancouver East
    @image = get_image
  end

  def get_address
    @page.search('.address').map {|element| element.inner_text}
  end

  def get_mortgage
    @page.search('div:nth-child(2) > .priv').map {|element| element.inner_text}
  end

  def get_taxes
    @page.search('div:nth-child(2) > .column-value > .priv:nth-child(1)').map {|element| element.inner_text} 
  end

  def get_type
    @page.search('div:nth-child(2) > .priv').map {|element| element.inner_text}
  end

  def get_year
    @page.search('div:nth-child(2) > .priv').map {|element| element.inner_text}
  end

  def get_walkscore
    @page.search('.column-value').map {|element| element.inner_text}
  end

  def get_size
    @page.search('.priv').map {|element| element.inner_text} 
  end

  def get_about
    @page.search('.priv > p').map {|element| element.inner_text }
  end

  def get_levels
    @page.search('.column-value').map {|element| element.inner_text}
  end

  def get_bedrooms
    @page.search('.column-value').map {|element| element.inner_text}
  end

  def get_bathrooms
    get_full_bathrooms[18].to_i + get_half_bathrooms[19].to_i
  end

  def get_full_bathrooms
    @page.search('.column-value').map {|element| element.inner_text}
  end

  def get_half_bathrooms
    @page.search('.column-value').map {|element| element.inner_text}
  end

  def get_fireplaces
    @page.search('.column-value').map {|element| element.inner_text}
  end

  def get_tax_year
    @page.search('.priv').map {|element| element.inner_text}
  end

  def get_strata_fees
    @page.search('.priv').map {|element| element.inner_text}
  end

  def get_area
    @page.search('.priv').map {|element| element.inner_text}
  end
  
  def get_image
    house_image = @page.xpath("//div/@*[starts-with(name(), 'data-photo-url')]").map{|e| e.value}
    if house_image.length < 1
      format_img = @page.xpath("//div/@*[starts-with(name(), 'style')]").map{|e| e.value}
      image = format_img.map do |img|
        img.gsub("background-image: url(", "").gsub(";", "").gsub(")", "").delete("display: block")
      end
    else 
      house_image
    end
  end

  def csv
    CSV.open("condos.csv", "ab") do |csv|
      csv << [@address, @price, @bedrooms, @bathrooms, @full_bathrooms, @half_bathrooms, @levels, @size, @year, @type, @mortgage, @taxes,   @walkscore, @about,   @fireplaces, @tax_year, @strata_fees, @area, @image]
    end
  end

  def to_s
    puts "Condo listings Only: ".colorize(:red)
    puts "the url for this page will look like this for Vancouver:".colorize(:blue)
    puts "http://www.zolo.ca/vancouver-real-estate/(street address)/(house number)".colorize(:blue)
    puts "for example: ".colorize(:green) + "http://www.zolo.ca/vancouver-real-estate/3588-crowley-drive/1501".colorize(:magenta)
    puts "-"*40
    puts "Address: ".colorize(:green) + " #{@address}"
    puts "-"*40
    puts "Mortgage:(est): ".colorize(:green) + " #{@mortgage}"
    puts "-"*40
    puts "Taxes(est): ".colorize(:green) + " #{@taxes}"
    puts "-"*40
    puts "Type: ".colorize(:green) + "#{@type}"
    puts "-"*40
    puts "Year built: ".colorize(:green) + "#{@year}"
    puts "-"*40
    puts "Walk score: ".colorize(:green) + "#{@walkscore}"
    puts "-"*40
    puts "About: ".colorize(:green) + "#{@about}"
    puts "-"*40
    puts "Bedrooms: ".colorize(:green) + "#{@bedrooms}"
    puts "-"*40
    puts "Full bathrooms: ".colorize(:green) + "#{@full_bathrooms}"
    puts "-"*40
    puts "Half bathrooms: ".colorize(:green) + "#{@half_bathrooms}"
    puts "-"*40
    puts "Levels: ".colorize(:green) + "#{@levels}"
    puts "-"*40
    puts "Fireplaces: ".colorize(:green) + "#{@fireplaces}"
    puts "-"*40
    puts "Tax Year: ".colorize(:green) + "#{@tax_year}"
    puts "-"*40
    puts "Strata Fees: ".colorize(:green) + "#{@strata_fees}"
    puts "-"*40
    puts "Area: ".colorize(:green) + "#{@area}"
    puts "-"*40
    puts "Image(url(s)): ".colorize(:green) + "#{image}"
    puts "-"*40
    puts "total bathrooms: ".colorize(:green) + "#{@bathrooms}"
    puts "-"*40
    puts "size: ".colorize(:green) + "#{@size}"
  end
end

class Zolo_House_Search

  attr_accessor :mortgage, :taxes, :type, :year, :walkscore, :about, :bedrooms, :full_bathrooms, :half_bathrooms, :fireplaces, :tax_year, :area, :levels, :basement, :value, :size, :image

  def initialize(url3)
    @page = Nokogiri::HTML(open(url3))
    @address = get_address[0]
    @value = get_value.join
    @mortgage = get_mortgage[0]
    @taxes = get_taxes[0]
    @type = get_type[2] #house type
    @year = get_year.join
    @walkscore = get_walkscore[7]
    @about = get_about.join
    @levels = get_levels[17]
    @bedrooms = get_bedrooms[18]
    @bathrooms = get_bathrooms
    @full_bathrooms = get_full_bathrooms[19]
    @half_bathrooms = get_half_bathrooms[20]
    @fireplaces = get_fireplaces[21]
    @basement = get_basement[22]
    @tax_year = get_tax_year[32]
    @area = get_area[38]  #i.e. Vancouver East
    @size = get_size[7]
    @image = get_image
  end

  def get_address
    @page.search('.address').map {|element| element.inner_text}
  end

  def get_value
    @page.search('.listing-market-view--value').map {|element| element.inner_text}
  end

  def get_mortgage
    @page.search('div:nth-child(2) > .priv').map {|element| element.inner_text}
  end

  def get_taxes
    @page.search('div:nth-child(2) > .column-value > .priv:nth-child(1)').map {|element| element.inner_text} 
  end

  def get_type
    @page.search('div:nth-child(2) > .priv').map {|element| element.inner_text}
  end

  def get_year
    @page.search('.priv > .priv').map {|element| element.inner_text}
  end

  def get_walkscore
    @page.search('.column-value').map {|element| element.inner_text}
  end

  def get_about
    @page.search('.priv > p').map {|element| element.inner_text}
  end

  def get_levels
    @page.search('.column-value').map {|element| element.inner_text}
  end

  def get_bedrooms
    @page.search('.column-value').map {|element| element.inner_text}
  end

  def get_full_bathrooms
    @page.search('.column-value').map {|element| element.inner_text}
  end

  def get_half_bathrooms
    @page.search('.column-value').map {|element| element.inner_text}
  end

  def get_bathrooms
    get_full_bathrooms[19].to_i + get_half_bathrooms[20].to_i
  end

  def get_basement
    @page.search('.column-value').map {|element| element.inner_text}
  end

  def get_fireplaces
    @page.search('.column-value').map {|element| element.inner_text}
  end

  def get_tax_year
    @page.search('.priv').map {|element| element.inner_text}
  end

  def get_area
    @page.search('.priv').map {|element| element.inner_text}
  end

  def get_size
    @page.search('.priv').map {|element| element.inner_text}
  end

  def get_image
    house_image = @page.xpath("//div/@*[starts-with(name(), 'data-photo-url')]").map{|e| e.value}
    if house_image.length < 1
      format_img = @page.xpath("//div/@*[starts-with(name(), 'style')]").map{|e| e.value}
      image = format_img.map do |img|
        img.gsub("background-image: url(", "").gsub(";", "").gsub(")", "").gsub("display: block", "").delete("")
      end
    else 
      house_image
    end
  end
  
  def csv
    CSV.open("homes.csv", "ab") do |csv|
      csv << [@address, @value, @mortgage, @taxes, @type, @year, @walkscore, @about, @levels, @bedrooms, @full_bathrooms, @half_bathrooms, @fireplaces, @tax_year, @area, @size, @image]      
    end
  end

  def to_s
    puts "-".colorize(:yellow)*40 
    puts "HOUSE listings Only: ".colorize(:red)
    puts "the url for this page will look like this for Vancouver:".colorize(:blue)
    puts "http://www.zolo.ca/vancouver-real-estate/(street address)".colorize(:blue)
    puts "for example: ".colorize(:green) + "https://www.zolo.ca/vancouver-real-estate/1081-w-7-avenue".colorize(:magenta)
    puts "-"*40
    puts "Address: ".colorize(:green) + " #{@address}"
    puts "-"*40
    puts "House Value: ".colorize(:green) + " #{@value}"
    puts "-"*40
    puts "Mortgage:(est): ".colorize(:green) + " #{@mortgage}"
    puts "-"*40
    puts "Taxes(est): ".colorize(:green) + " #{@taxes}"
    puts "-"*40
    puts "Type: ".colorize(:green) + "#{@type}"
    puts "-"*40
    puts "Year built: ".colorize(:green) + "#{@year}"
    puts "-"*40
    puts "Walk score: ".colorize(:green) + "#{@walkscore}"
    puts "-"*40
    puts "About: ".colorize(:green) + "#{@about}"
    puts "-"*40
    puts "Full bathrooms: ".colorize(:green) + "#{@full_bathrooms}"
    puts "-"*40
    puts "Half bathrooms: ".colorize(:green) + "#{@half_bathrooms}"
    puts "-"*40
    puts "Bedrooms: ".colorize(:green) + "#{@bedrooms}"
    puts "-"*40
    puts "Levels: ".colorize(:green) + "#{@levels}"
    puts "-"*40
    puts "Fireplaces: ".colorize(:green) + "#{@fireplaces}"
    puts "-"*40
    puts "Basement Area: ".colorize(:green) + "#{@basement}"
    puts "-"*40
    puts "Tax Year: ".colorize(:green) + "#{@tax_year}"
    puts "-"*40
    puts "Area: ".colorize(:green) + "#{@area}"
    puts "-"*40
    puts "Size (sqft): ".colorize(:green) + "#{@size}"
    puts "-"*40
    puts "Image(url(s)): ".colorize(:green) + "#{@image}" 
    puts "-"*40
    puts "total bathrooms: ".colorize(:green) + "#{@bathrooms}"
  end
end

class Zolo_Townhouse_Search

  def initialize(url4)
    @page = Nokogiri::HTML(open(url4))
    @address = get_address[0]
    @value = get_value.join
    @mortgage = get_mortgage[0]
    @taxes = get_taxes[0]
    @type = get_type[2] #house type
    @year = get_year.join
    @walkscore = get_walkscore[7]
    @about = get_about.join
    @levels = get_levels[20]
    @bedrooms = get_bedrooms[21]
    @bathrooms = get_bathrooms
    @full_bathrooms = get_full_bathrooms[22]
    @half_bathrooms = get_half_bathrooms[23]
    @fireplaces = get_fireplaces[24]
    @tax_year = get_tax_year[31]
    @area = get_area[38]  #i.e. Vancouver East
    @size = get_size[7]
    @image = get_image
  end

  def get_address
    @page.search('.address').map {|element| element.inner_text}
  end

  def get_price
    @page.search('.listing-market-view--value').map {|element| element.inner_text}
  end

  def get_mortgage
    @page.search('div:nth-child(2) > .priv').map {|element| element.inner_text}
  end

  def get_taxes
    @page.search('div:nth-child(2) > .column-value > .priv:nth-child(1)').map {|element| element.inner_text} 
  end

  def get_type
    @page.search('div:nth-child(2) > .priv').map {|element| element.inner_text}
  end

  def get_year
    @page.search('.priv > .priv').map {|element| element.inner_text}
  end

  def get_walkscore
    @page.search('.column-value').map {|element| element.inner_text}
  end

  def get_about
    @page.search('.priv > p').map {|element| element.inner_text}
  end

  def get_levels
    @page.search('.priv').map {|element| element.inner_text}
  end

  def get_bedrooms
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

  def get_tax_year
    @page.search('.priv').map {|element| element.inner_text}
  end

  def get_area
    @page.search('.priv').map {|element| element.inner_text}
  end

  def get_size
    @page.search('.priv').map {|element| element.inner_text}
  end

 def get_image
    house_image = @page.xpath("//div/@*[starts-with(name(), 'data-photo-url')]").map{|e| e.value}
    if house_image.length < 1
      format_img = @page.xpath("//div/@*[starts-with(name(), 'style')]").map{|e| e.value}
      image = format_img.map do |img|
        img.gsub("background-image: url(", "").gsub(";", "").gsub(")", "").gsub("display: block", "")
      end
    else 
      house_image
    end
  end

  def csv
    CSV.open("homes.csv", "ab") do |csv|
      csv << [@address, @price, @bedrooms, @bathrooms, @full_bathrooms, @half_bathrooms, @size, @type, @year, @area, @postal_code, @about, @strata_fees, @mortgage, @taxes, @walkscore, @levels, @fireplaces, @tax_year,  @image]      
    end
  end

  def to_s
    puts "-".colorize(:yellow)*40 
    puts "TOWNHOUSE listings Only: ".colorize(:red)
    puts "the url for this page will look like this for Vancouver:".colorize(:blue)
    puts "http://www.zolo.ca/vancouver-real-estate/(street address)".colorize(:blue)
    puts "for example: ".colorize(:green) + "https://www.zolo.ca/vancouver-real-estate/1081-w-7-avenue".colorize(:magenta)
    puts "-"*40
    puts "Address: ".colorize(:green) + " #{@address}"
    puts "-"*40
    puts "House Value: ".colorize(:green) + " #{@value}"
    puts "-"*40
    puts "Mortgage:(est): ".colorize(:green) + " #{@mortgage}"
    puts "-"*40
    puts "Taxes(est): ".colorize(:green) + " #{@taxes}"
    puts "-"*40
    puts "Type: ".colorize(:green) + "#{@type}"
    puts "-"*40
    puts "Year built: ".colorize(:green) + "#{@year}"
    puts "-"*40
    puts "Walk score: ".colorize(:green) + "#{@walkscore}"
    puts "-"*40
    puts "About: ".colorize(:green) + "#{@about}"
    puts "-"*40
    puts "Full bathrooms: ".colorize(:green) + "#{@full_bathrooms}"
    puts "-"*40
    puts "Half bathrooms: ".colorize(:green) + "#{@half_bathrooms}"
    puts "-"*40
    puts "Bedrooms: ".colorize(:green) + "#{@bedrooms}"
    puts "-"*40
    puts "Levels: ".colorize(:green) + "#{@levels}"
    puts "-"*40
    puts "Fireplaces: ".colorize(:green) + "#{@fireplaces}"
    puts "-"*40
    puts "Tax Year: ".colorize(:green) + "#{@tax_year}"
    puts "-"*40
    puts "Area: ".colorize(:green) + "#{@area}"
    puts "-"*40
    puts "Size (sqft): ".colorize(:green) + "#{@size}"
    puts "-"*40
    puts "Image (url(s)): ".colorize(:green) + "#{@image}"
    puts "-"*40
    puts "bathrooms: ".colorize(:green) + "#{@bathrooms}"
  end
end

# begin
  # url = 'https://www.zolo.ca/vancouver-real-estate/page-2#' #listings page
  # url2 = 'https://www.zolo.ca/vancouver-real-estate/2960-e-29th-street/105' #condos
  # url3 = 'https://www.zolo.ca/west-vancouver-real-estate/5076-pinetree-crescent' #houses
  # url4 = 'https://www.zolo.ca/vancouver-real-estate/3562-bella-vista-street' #townhouses
  # zolo = Zolo.new(url)
  # puts zolo.to_s
#   zolo_condo = Zolo_Condo_Search.new(url2)
#   puts zolo_condo.to_s
#   zolo_house = Zolo_House_Search.new(url3)
#   puts zolo_house.to_s
#   zolo_townhouse = Zolo_Townhouse_Search.new(url4)
#   puts zolo_townhouse.to_s
# # end


# loop through listings pages
# i = 2
# while i < 8
#   url = "https://www.zolo.ca/vancouver-real-estate/page-"+"#{i}"
#   zolo = Zolo.new(url)
#   puts zolo.to_s
#   i+= 1
# end


# loop through listings
unformatted_addresses = ["708-518 W 14th Avenue", "1901-1331 Alberni Street", "2624 W 3rd Avenue", "201-5728 Berton Avenue", "210-6328 Larkin Drive", "1437 W 32nd Avenue", "2715 E 47th Avenue", "1603-8588 Cornish Street", "502-668 Citadel Parade ", "3706-928 Beatty Street", "6143 Victoria Drive", "5875 Angus Drive", "3617 W 12th Avenue", "406-5725 Agronomy Road", "204-3289 Riverwalk Avenue", "2595 W 1st Avenue", "1522 E 20th Avenue", "702-668 Citadel Parade ", "603-3289 Riverwalk Avenue", "509-977 Mainland Street", "510-3289 Riverwalk Avenue", "1845 W 11th Avenue", "1566 W 65th Avenue", "309-6268 Eagles Drive", "1005-1650 W 7th Avenue", "213-3289 Riverwalk Avenue", "203-33 N Templeton Drive", "1001-555 Jervis Street", "3517 W 3rd Avenue", "107-3289 Riverwalk Avenue", "204-830 E 7th Avenue", "301-5728 Berton Avenue", "202-1860 Robson Street", "1801-1438 Richards Street", "1401-181 W 1st Avenue", "2213 Renfrew Street", "501-6929 Cambie Street", "601-908 Keith Road", "2765 W 8th Avenue", "4655 W 6th Avenue", "2208 W 34th Avenue", "2703-1189 Melville Street", "2344 W 37th Avenue", "3535 Puget Drive", "645 W 7th Avenue", "1303 Park Drive", "6592 Maple Street", "2-2880 W 33rd Avenue", "2719 W 15th Avenue", "307-3520 Crowley Drive", "19-2156 W 12th Avenue", "6222 Mccleery Street", "PH6-5555 Victoria Drive", "4553 Fraser Street", "3342 W 5th Avenue", "3312 Parker Street", "608-5782 Berton Avenue", "209-3520 Crowley Drive", "2781 E 27th Avenue", "477 W 63rd Avenue", "218-2889 E 1st Avenue", "320-2889 E 1st Avenue", "1161 Keefer Street", "310-3289 Riverwalk Avenue", "5188 Main Street", "1250 W 40th Avenue", "1706-950 Cambie Street", "3503-128 W Cordova Street", "906-5775 Hampton Place", "3626 W 22nd Avenue", "3433 W 22nd Avenue", "4519 Culloden Street", "2309-938 Smithe Street", "302-5025 Joyce Street", "16 N Kaslo Street", "3715 W 22nd Avenue", "1046 Nicola Street", "4015 W 30th Avenue", "312-3727 W 10th Avenue", "10-1038 W 7th Avenue", "2401-1020 Harwood Street", "605-2770 Sophia Street", "4679 W 13th Avenue", "2375 W 45th Avenue", "3371 Napier Street", "4197 Fraser Street", "3898 W 3rd Avenue", "1501-1499 W Pender Street", "4509 Slocan Street", "5695 Ormidale Street", "1531 Barclay Street", "2227 E 37th Avenue", "3-4900 Cartier Street", "2006 W 48th Avenue", "PH1-289 E 6th Avenue", "3533 Point Grey Road", "501-560 Cardero Street", "731 W 17th Avenue", "8481 Quayside Court", "302-2040 Cornwall Avenue", "303-110 Switchmen Street", "111-6018 Iona Drive", "429 E Pender Street", "512-1485 W 6th Avenue", "6611 Cartier Street", "3095 W 5th Avenue", "108-1825 W 8th Avenue", "2032 E 22nd Avenue", "101-2006 W 2nd Avenue", "1459 W 41st Avenue", "1107-833 Homer Street", "1702-788 Richards Street", "1449 W 41st Avenue", "710-123 W 1st Avenue", "3998 Granville Street", "731 Union Street", "3460 E Georgia Street", "603-1388 Homer Street", "402-53 W Hastings Street", "307-1239 Kingsway ", "4903-1480 Howe Street", "907-1775 Quebec Street", "238 W 14th Avenue", "107-3382 Wesbrook Mall", "1384 E 63rd Avenue", "105-1066 E 8th Avenue", "5350 Slocan Street", "2003-8555 Granville Street", "4108 Gladstone Street", "2601-1166 Melville Street", "2817 Fraser Street", "403-3628 Rae Avenue", "2846 W 30th Avenue", "102-2338 Western Parkway", "7061 Adera Street", "2560 4th Avenue", "2849 W King Edward Avenue", "7-2088 W 11 Avenue", "119 W 41st Avenue", "2801-233 Robson Street", "81 W 49th Avenue", "2485 Wall Street", "2101-1328 Marinaside Crescent", "1102-1420 W Georgia Street"]

def format_address(arr)
  downcase_arr = arr.map(&:downcase)
  formated_arr = downcase_arr.map{|a| a.gsub(" ", "-")}
  # puts formated_arr
end

formated_address = format_address(unformatted_addresses)

formated_address.each do |address|
  #condos
  if address.match(/\d{3,4}[-]\d{3,4}/)
    condo_address = address.gsub(/^\d{3,4}-/, "")
    condo_number = address.match(/\d{3,4}/)
    url2 = "https://www.zolo.ca/vancouver-real-estate/" + "#{condo_address}/" + "#{condo_number}"
    zolo_condo = Zolo_Condo_Search.new(url2)
    puts zolo_condo.to_s
    # zolo_condo.csv
  else #house && townhouse
    url = "https://www.zolo.ca/vancouver-real-estate/" + "#{address}"
    zolo_house = Zolo_House_Search.new(url)
    puts zolo_house.to_s
    # zolo_house.csv
  end
end