require 'nokogiri'
require 'open-uri'
require 'colorize'

class Zolo
  attr_accessor :city, :address, :price, :bedroom, :bathroom, :sqft, :age

  def initialize(url)
    @page = Nokogiri::HTML(open(url))
    # @url = ARGV[0]
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

  attr_accessor :mortgage, :taxes, :type, :year, :walkscore, :about, :full_bathrooms, :half_bathrooms, :fireplaces, :tax_year, :strata_fees, :area, :levels

  def initialize(url2)
    @page = Nokogiri::HTML(open(url2))
    @mortgage = get_mortgage[0]
    @taxes = get_taxes[0]
    @type = get_type[2] #house type
    @year = get_year[5]
    @walkscore = get_walkscore[7]
    @about = get_about
    @levels = get_levels[16]
    @full_bathrooms = get_full_bathrooms[18]
    @half_bathrooms = get_half_bathrooms[19]
    @fireplaces = get_fireplaces[20]
    @tax_year = get_tax_year[28]
    @strata_fees = get_strata_fees[29]
    @area = get_area.last  #i.e. Vancouver East
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

  def get_about
    @page.search('.priv > p').map {|element| element.inner_text}
  end

  def get_levels
    @page.search('.column-value').map {|element| element.inner_text}
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

  def to_s
    puts "Condo listings Only: ".colorize(:red)
    puts "the url for this page will look like this for Vancouver:".colorize(:blue)
    puts "http://www.zolo.ca/vancouver-real-estate/(street address)/(house number)".colorize(:blue)
    puts "for example: ".colorize(:green) + "http://www.zolo.ca/vancouver-real-estate/3588-crowley-drive/1501".colorize(:magenta)
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
    puts "Levels: ".colorize(:green) + "#{@levels}"
    puts "-"*40
    puts "Fireplaces: ".colorize(:green) + "#{@fireplaces}"
    puts "-"*40
    puts "Tax Year: ".colorize(:green) + "#{@tax_year}"
    puts "-"*40
    puts "Strata Fees: ".colorize(:green) + "#{@strata_fees}"
    puts "-"*40
    puts "Area: ".colorize(:green) + "#{@area}"
  end
end

class Zolo_House_Search

   attr_accessor :mortgage, :taxes, :type, :year, :walkscore, :about, :bedrooms, :full_bathrooms, :half_bathrooms, :fireplaces, :tax_year, :area, :levels, :basement, :value, :size

  def initialize(url3)
    @page = Nokogiri::HTML(open(url3))
    @value = get_value.join
    @mortgage = get_mortgage[0]
    @taxes = get_taxes[0]
    @type = get_type[2] #house type
    @year = get_year.join
    @walkscore = get_walkscore[7]
    @about = get_about.join
    @levels = get_levels[17]
    @bedrooms = get_bedrooms[18]
    @full_bathrooms = get_full_bathrooms[19]
    @half_bathrooms = get_half_bathrooms[20]
    @fireplaces = get_fireplaces[21]
    @basement = get_basement[22]
    @tax_year = get_tax_year[32]
    @area = get_area[38]  #i.e. Vancouver East
    @size = get_size[7]
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

  def to_s
    puts "-".colorize(:yellow)*40 
    puts "HOUSE listings Only: ".colorize(:red)
    puts "the url for this page will look like this for Vancouver:".colorize(:blue)
    puts "http://www.zolo.ca/vancouver-real-estate/(street address)".colorize(:blue)
    puts "for example: ".colorize(:green) + "https://www.zolo.ca/vancouver-real-estate/1081-w-7-avenue".colorize(:magenta)
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
  end
end

class Zolo_Townhouse_Search
  def initialize(url4)
    @page = Nokogiri::HTML(open(url4))
  end

end

begin
  url = 'https://www.zolo.ca/vancouver-real-estate' #listings page
  url2 = 'https://www.zolo.ca/vancouver-real-estate/735-w-15th-avenue/105' #condos
  url3 = 'https://www.zolo.ca/west-vancouver-real-estate/5076-pinetree-crescent' #houses
  url4 = 'https://www.zolo.ca/vancouver-real-estate/2128-adanac-street' #townhouses
  zolo = Zolo.new(url)
  # puts zolo.to_s
  zolo_condo = Zolo_Condo_Search.new(url2)
  # puts zolo_condo.to_s
  zolo_house = Zolo_House_Search.new(url3)
  # puts zolo_house.to_s
  zolo_townhouse = Zolo_Townhouse_Search.new(url4)
  puts zolo_townhouse.to_s
end
