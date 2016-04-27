class Image < ActiveRecord::Base
  belongs_to :listing
  has_attached_file :image, :styles => { :large =>"500x500>", :medium => "300x300>", :thumb => "100x100>" } 
  validates_attachment :image, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }

end
