class Listing < ActiveRecord::Base
  belongs_to :user
  belongs_to :neighbourhood
  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  
end
