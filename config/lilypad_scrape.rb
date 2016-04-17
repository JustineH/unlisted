require 'nokogiri'
require 'open-uri'
require 'colorize'

class Lilypad
  attr_accessor :city, :address, :price, :bedroom, :bathroom, :sqft, :year_built

  def initialize(url)
    @page = Nokogiri::HTML(open(url))
    @city = get_city.join
    @address = get_address
    @price = get_price
    @bedroom = get_bedroom
    @bathroom = get_bathroom
    @sqft = get_sqft
    @year_built = get_year_built

  end

  def get_city
    @page.search('.listing-city').map {|element| element.inner_text}
  end

   def get_address
    @page.search('.listing-address').map {|element| element.inner_text}
  end

   def get_price
    @page.search('.price').map {|element| element.inner_text}
  end

   def get_bedroom
    @page.search('.bed').map {|element| element.inner_text}
  end

   def get_bathroom
    @page.search('.bath').map {|element| element.inner_text}
  end

   def get_sqft
    @page.search('.size').map {|element| element.inner_text}
  end

   def get_year_built
    @page.search('.column_label').map {|element| element.inner_text}
  end

  def to_s
    puts "_"*40
    puts "City: ".colorize(:green) + "#{@city}"
    puts "_"*40
    puts "Address: ".colorize(:green) + "#{@listing-address}"
    puts "_"*40
    puts "Price: ".colorize(:green) + "#{@price}"
    puts "_"*40
    puts "Bedrooms: ".colorize(:green) + "#{@bed}"
    puts "_"*40
    puts "Bathrooms: ".colorize(:green) + "#{@bath}"
    puts "_"*40
    puts "Size: ".colorize(:green) + "#{@size}"
    puts "_"*40
    puts "Year built: ".colorize(:green) + "#{@column_label}"
  end
end


url = 'http://www.lilypad.ca/vancouver' #listings page
url2 = 'http://www.lilypad.ca/vancouver/2960-e-29th-street/105' # condos
url3 = 'http://www.lilypad.ca/vancouver/1081-w-7-avenue' # houses
url4 = 'http://www.lilypad.ca/vancouver/7161-algonquin-mews' #townhomes
lily = Lilypad.new(url)
# puts lily.to_s


 

