require 'nokogiri'
require 'open-uri'
require 'colorize'

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

url = 'http://www.lilypad.ca/vancouver' #listings page
lily = Lilypad.new(url)
puts lily.to_s


 

