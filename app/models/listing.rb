class Listing < ActiveRecord::Base
  belongs_to :user
  belongs_to :neighbourhood
  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  
  # validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
  validates_attachment :image, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }
end
